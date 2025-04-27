class FaceRecognitionSVGPage extends StatefulWidget {
  @override
  _FaceRecognitionSVGPageState createState() => _FaceRecognitionSVGPageState();
}

class _FaceRecognitionSVGPageState extends State<FaceRecognitionSVGPage> {
  CameraController? _controller;
  bool _isFaceAligned = false;
  bool _showScanLine = true;

  // SVG 遮罩文件内容
  final String maskSVG = '''
  <svg width="100%" height="100%" viewBox="0 0 375 812" xmlns="http://www.w3.org/2000/svg">
    <!-- 全屏黑色遮罩 -->
    <rect width="100%" height="100%" fill="black" fill-opacity="0.5"/>
    
    <!-- 头部椭圆 -->
    <path 
      d="M187.5 200 a120 160 0 0 1 0 320 
         a120 160 0 0 1 0 -320"
      fill="none"
      stroke="white"
      stroke-width="2"
      fill-rule="evenodd"
    />
    
    <!-- 肩部梯形 -->
    <path
      d="M75 460 L300 460 L330 700 L45 700 Z"
      fill="none"
      stroke="white"
      stroke-width="2"
    />
    
    <!-- 辅助线 -->
    <path d="M75 460 L45 700" stroke="white" stroke-width="2"/>
    <path d="M300 460 L330 700" stroke="white" stroke-width="2"/>
  </svg>
  ''';

  @override
  void initState() {
    super.initState();
    _initializeCamera();
    _startScanAnimation();
  }

  // ... 保持之前的相机初始化、动画和状态管理代码不变 ...

  @override
  Widget build(BuildContext context) {
    if (_controller == null || !_controller!.value.isInitialized) {
      return Scaffold(body: Center(child: CircularProgressIndicator()));
    }

    return Scaffold(
      body: Stack(
        children: [
          CameraPreview(_controller!),
          _buildSvgMask(),
          _buildScanLine(),
          _buildStatusIndicator(),
          _buildInstructionText(),
        ],
      ),
    );
  }

  Widget _buildSvgMask() {
    return SizedBox.expand(
      child: SvgPicture.string(
        maskSVG,
        fit: BoxFit.cover,
        colorFilter: ColorFilter.mode(
          Colors.black.withOpacity(0.5),
          BlendMode.srcIn,
        ),
      ),
    );
  }

  // ... 其他组件保持原有实现不变 ...
}

// import 'package:camera/camera.dart';
// import 'package:flutter/material.dart';

class FaceRecognitionPage extends StatefulWidget {
  @override
  _FaceRecognitionPageState createState() => _FaceRecognitionPageState();
}

class _FaceRecognitionPageState extends State<FaceRecognitionPage> {
  CameraController? _controller;
  bool _isFaceAligned = false;
  bool _showScanLine = true;

  @override
  void initState() {
    super.initState();
    _initializeCamera();
    _startScanAnimation();
  }

  Future<void> _initializeCamera() async {
    final cameras = await availableCameras();
    _controller = CameraController(
      cameras.firstWhere((camera) => camera.lensDirection == CameraLensDirection.front),
      ResolutionPreset.medium,
    );
    await _controller!.initialize();
    if (mounted) setState(() {});
  }

  void _startScanAnimation() {
    Future.delayed(Duration(milliseconds: 1500), () {
      if (mounted) {
        setState(() => _showScanLine = !_showScanLine);
        _startScanAnimation();
      }
    });
  }

  @override
  void dispose() {
    _controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (_controller == null || !_controller!.value.isInitialized) {
      return Scaffold(body: Center(child: CircularProgressIndicator()));
    }

    return Scaffold(
      body: Stack(
        children: [
          CameraPreview(_controller!),
          _buildPositioningMask(),
          _buildScanLine(),
          _buildStatusIndicator(),
          _buildInstructionText(),
        ],
      ),
    );
  }

  Widget _buildPositioningMask() {
    return CustomPaint(
      painter: _FaceMaskPainter(),
      child: Container(),
    );
  }

  Widget _buildScanLine() {
    return AnimatedPositioned(
      duration: Duration(milliseconds: 1500),
      top: _showScanLine ? 0 : MediaQuery.of(context).size.height - 100,
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: 2,
        color: Colors.green.withOpacity(0.5),
      ),
    );
  }

  Widget _buildStatusIndicator() {
    return Align(
      alignment: Alignment.topCenter,
      child: Padding(
        padding: const EdgeInsets.only(top: 50),
        child: Icon(
          _isFaceAligned ? Icons.check_circle : Icons.person,
          color: _isFaceAligned ? Colors.green : Colors.white,
          size: 50,
        ),
      ),
    );
  }

  Widget _buildInstructionText() {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Padding(
        padding: const EdgeInsets.only(bottom: 50),
        child: Text(
          '请将面部对准框架',
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}

class _FaceMaskPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.black.withOpacity(0.5)
      ..style = PaintingStyle.fill;

    // 绘制整体遮罩
    canvas.drawRect(Rect.fromLTRB(0, 0, size.width, size.height), paint);

    // 创建透明区域路径
    final transparentPath = Path();
    
    // 头部区域（椭圆形）
    final headRect = Rect.fromCenter(
      center: Offset(size.width/2, size.height/3),
      width: size.width * 0.6,
      height: size.height * 0.4,
    );
    transparentPath.addOval(headRect);

    // 肩部区域（梯形）
    transparentPath.moveTo(size.width * 0.2, size.height * 0.5);
    transparentPath.lineTo(size.width * 0.8, size.height * 0.5);
    transparentPath.lineTo(size.width * 0.9, size.height * 0.7);
    transparentPath.lineTo(size.width * 0.1, size.height * 0.7);
    transparentPath.close();

    // 创建组合路径
    final combinedPath = Path.combine(
      PathOperation.difference,
      Path()..addRect(Rect.fromLTWH(0, 0, size.width, size.height)),
      transparentPath,
    );

    canvas.drawPath(combinedPath, paint);

    // 绘制边框
    final borderPaint = Paint()
      ..color = Colors.white
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2;

    canvas.drawOval(headRect, borderPaint);
    
    // 绘制肩部指引线
    final shoulderPaint = Paint()
      ..color = Colors.white
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2;

    canvas.drawLine(
      Offset(size.width * 0.2, size.height * 0.5),
      Offset(size.width * 0.1, size.height * 0.7),
      shoulderPaint,
    );

    canvas.drawLine(
      Offset(size.width * 0.8, size.height * 0.5),
      Offset(size.width * 0.9, size.height * 0.7),
      shoulderPaint,
    );
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
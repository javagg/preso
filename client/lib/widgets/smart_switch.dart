import 'package:flutter/material.dart';

class SmartSwitch extends StatefulWidget {
  final Size size;
  final List<bool> states;

  const SmartSwitch({
    super.key,
    this.size = const Size(172, 86),
    this.states = const [false, false, false],
  });

  @override
  _SmartSwitchState createState() => _SmartSwitchState();
}

class _SmartSwitchState extends State<SmartSwitch> {
  late List<bool> _switchStates;

  @override
  void initState() {
    super.initState();
    _switchStates = List.from(widget.states);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.size.width,
      height: widget.size.height,
      decoration: BoxDecoration(
          color: Colors.grey[200],
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Colors.black26,
              blurRadius: 8,
              offset: Offset(0, 4),
            ),
          ]),
      child: Stack(
        children: [
          // 面板本体
          _buildPanelBase(),
          // 开关按钮
          _buildSwitches(),
          // 螺丝孔
          _buildScrews(),
        ],
      ),
    );
  }

  Widget _buildPanelBase() {
    return Container(
      margin: EdgeInsets.all(8),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                Colors.grey[300]!,
                Colors.grey[100]!,
              ]),
          boxShadow: [
            BoxShadow(
                color: Colors.white.withOpacity(0.8),
                blurRadius: 16,
                offset: Offset(-4, -4)),
            BoxShadow(
                color: Colors.black.withOpacity(0.1),
                blurRadius: 8,
                offset: Offset(4, 4))
          ]),
    );
  }

  Widget _buildSwitches() {
    return Row(
      children: List.generate(
          3,
          (index) => Expanded(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 6, vertical: 12),
                  child: GestureDetector(
                    onTap: () => _toggleSwitch(index),
                    child: AnimatedContainer(
                      duration: Duration(milliseconds: 150),
                      curve: Curves.easeOut,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(6),
                        gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: _switchStates[index]
                                ? [Color(0xFF4CAF50), Color(0xFF388E3C)]
                                : [Color(0xFF616161), Color(0xFF424242)]),
                        boxShadow: [
                          if (!_switchStates[index])
                            BoxShadow(
                                color: Colors.black26,
                                blurRadius: 8,
                                offset: Offset(0, 4)),
                          BoxShadow(
                              color: Colors.white.withOpacity(0.1),
                              blurRadius: 4,
                              offset: Offset(-2, -2)),
                        ],
                      ),
                      child: Stack(
                        children: [
                          // LED指示灯
                          if (_switchStates[index])
                            Positioned(
                              top: 6,
                              right: 10,
                              child: Container(
                                width: 8,
                                height: 8,
                                decoration: BoxDecoration(
                                    color: Colors.greenAccent,
                                    shape: BoxShape.circle,
                                    boxShadow: [
                                      BoxShadow(
                                        color:
                                            Colors.greenAccent.withOpacity(0.8),
                                        blurRadius: 8,
                                      )
                                    ]),
                              ),
                            ),
                          // 开关文字
                          Center(
                            child: Text(
                              _switchStates[index] ? "ON" : "OFF",
                              style: TextStyle(
                                  color: Colors.white.withOpacity(0.9),
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                  letterSpacing: 1.2),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              )),
    );
  }

  Widget _buildScrews() {
    return Stack(
      children: [
        Positioned(
          // 左上螺丝
          left: 6,
          top: 6,
          child: _ScrewHead(),
        ),
        Positioned(
          // 右上螺丝
          right: 6,
          top: 6,
          child: _ScrewHead(),
        ),
        Positioned(
          // 左下螺丝
          left: 6,
          bottom: 6,
          child: _ScrewHead(),
        ),
        Positioned(
          // 右下螺丝
          right: 6,
          bottom: 6,
          child: _ScrewHead(),
        ),
      ],
    );
  }

  void _toggleSwitch(int index) {
    setState(() {
      _switchStates[index] = !_switchStates[index];
    });
  }
}

// 螺丝头组件
class _ScrewHead extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 10,
      height: 10,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Colors.grey[500]!,
              Colors.grey[700]!,
            ]),
      ),
    );
  }
}

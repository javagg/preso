import 'package:flutter/material.dart';

class MapExamplePage extends StatefulWidget {
  const MapExamplePage({super.key});

  @override
  State<MapExamplePage> createState() => _MapExamplePageState();
}

class _MapExamplePageState extends State<MapExamplePage> {
  LatLng _center = LatLng(39.9042, 116.4074); // 北京
  double _zoom = 15;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('腾讯地图示例')),
      body: Column(
        children: [
          Expanded(
            child: TencentMap(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height - 200,
              center: _center,
              zoom: _zoom,
              onTap: (position) {
                setState(() {
                  _center = position;
                });
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () => setState(() => _zoom++),
                  child: const Text('放大'),
                ),
                ElevatedButton(
                  onPressed: () => setState(() => _zoom--),
                  child: const Text('缩小'),
                ),
                Text('纬度: ${_center.lat.toStringAsFixed(4)}'),
                Text('经度: ${_center.lng.toStringAsFixed(4)}'),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
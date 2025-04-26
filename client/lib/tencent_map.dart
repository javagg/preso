// lib/tencent_map.dart

import 'package:flutter/material.dart';
import 'package:js/js.dart';
import 'package:web/web.dart' as web;
import 'package:js_interop/js_interop.dart';

import 'src/tencent_map_interop.dart';

class TencentMap extends StatefulWidget {
  final double width;
  final double height;
  final LatLng center;
  final double zoom;
  final bool interactive;
  final void Function(LatLng)? onTap;

  const TencentMap({
    super.key,
    required this.width,
    required this.height,
    required this.center,
    this.zoom = 15,
    this.interactive = true,
    this.onTap,
  });

  @override
  State<TencentMap> createState() => _TencentMapState();
}

class _TencentMapState extends State<TencentMap> {
  late final web.HTMLDivElement _container;
  Map? _map;

  @override
  void initState() {
    super.initState();
    _container = web.document.createElement('div') as web.HTMLDivElement;
    _container.style.width = '100%';
    _container.style.height = '100%';
  }

  @override
  void didUpdateWidget(covariant TencentMap oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (_map != null) {
      if (widget.center.lat != oldWidget.center.lat ||
          widget.center.lng != oldWidget.center.lng) {
        _map!.setCenter(widget.center);
      }
      if (widget.zoom != oldWidget.zoom) {
        _map!.setZoom(widget.zoom);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: widget.width,
      height: widget.height,
      child: HtmlElementView(
        viewType: 'tencent-map',
        onPlatformViewCreated: _initMap,
      ),
    );
  }

  void _initMap(int id) {
    // 确保 DOM 已加载
    Future.delayed(Duration.zero, () {
      final element = web.document.getElementById('tencent-map-$id');
      if (element != null) {
        element.append(_container);
        _initializeMap();
      }
    });
  }

  void _initializeMap() {
    _map = Map(
      _container,
      MapOptions(
        center: widget.center,
        zoom: widget.zoom,
        disableDefaultUI: !widget.interactive,
      ),
    );

    // 添加初始标记
    _addMarker(widget.center);

    // 添加点击事件
    if (widget.onTap != null) {
      _container.onClick.listen((event) {
        // 这里需要更精确的坐标转换逻辑
        widget.onTap!(widget.center);
      });
    }
  }

  void _addMarker(LatLng position) {
    final marker = Marker(
      MarkerOptions(
        position: position,
        map: _map,
        title: '当前位置',
      ),
    );
  }

  void _addMapListeners() {
    // 使用 js_interop 添加原生事件监听
    final map = _map!;

    // 点击事件
    map.addListener('click', allowInterop((event) {
      final lat = event.latLng.lat;
      final lng = event.latLng.lng;
      if (widget.onTap != null) {
        widget.onTap!(LatLng(lat, lng));
      }
    }));

    // 缩放变化事件
    map.addListener('zoom_changed', allowInterop(() {
      final zoom = map.getZoom();
      // 处理缩放变化
    }));
  }

  void _addMarkers(List<LatLng> positions) {
    for (final position in positions) {
      final marker = Marker(
        MarkerOptions(
          position: position,
          map: _map,
          title: '标记点',
        ),
      );
    }
  }

  @override
  void dispose() {
    _map = null;
    super.dispose();
  }
}

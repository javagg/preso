import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:preso_client/helpers/geo.dart';

// 可参考1. 有机狗微信小程序
class StoreChooser extends StatelessWidget {
  final GestureTapCallback? onTap;

  const StoreChooser({super.key, this.onTap});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) => ListTile(
        title: Text('Store $index'),
        onTap: onTap,
      ),
    );
  }
}

class StoreTileData {
  final String name;
  final String imageUrl;
  final double latitude;
  final double longitude;
  final String address;
  const StoreTileData(
    this.latitude,
    this.longitude,
    this.address, {
    required this.name,
    required this.imageUrl,
  });
}

class StoreTile extends StatelessWidget {
  final GestureTapCallback? onTap;
  final StoreTileData data;
  const StoreTile({super.key, required this.data, this.onTap});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CachedNetworkImage(imageUrl: data.imageUrl),
      title: Text(
        data.name,
        style: Get.theme.textTheme.titleMedium,
      ),
      subtitle: Text(data.address),
      onTap: onTap,
      trailing: Text(
        formatDistance(calculateDistance(0, 0, data.latitude, data.longitude)),
        style: Get.theme.textTheme.titleSmall,
      ),
    );
  }
}

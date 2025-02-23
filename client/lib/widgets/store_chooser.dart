import 'package:flutter/material.dart';
import 'package:get/get.dart';

// 可参考1. 有机狗微信小程序
class StoreChooser extends StatelessWidget {
  const StoreChooser({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) => ListTile(
        title: Text('Store $index'),
        onTap: () => Get.back(result: index),
      ),
    );
  }
}

class StoreTile extends StatelessWidget {
  const StoreTile({super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text('Store ${Get.arguments}'),
    );
  }
}

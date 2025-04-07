import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'store_controller.dart';

 class StoreView extends GetView<StoreController> {
  const StoreView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () async {}, icon: Icon(Icons.import_export_outlined))
        ],
      ),
      body: Text("stores"));
  }
}

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

class StoreListController extends GetxController {
  final allItems = [
    'Apple',
    'Banana',
    'Cherry',
    'Date',
    'Fig',
    'Grape',
    'Lemon',
    'Mango',
    'Orange',
    'Peach'
  ].obs;

  final filteredItems = <String>[].obs;
  final isSearching = false.obs;
  final searchQuery = ''.obs;

  void filter(String query) {
    searchQuery.value = query;
    if (query.isEmpty) {
      filteredItems.clear();
      isSearching.value = false;
    } else {
      filteredItems.value = allItems
          .where((item) => item.toLowerCase().contains(query.toLowerCase()))
          .toList();
      isSearching.value = true;
    }
  }

  void select(String item) {
    searchQuery.value = item;
    isSearching.value = false;
  }
}

class StoreList extends GetView<StoreListController> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SearchBar(
          controller: TextEditingController(text: controller.searchQuery.value),
          onChanged: controller.filterItems,
          leading: const Icon(Icons.search),
          trailing: [
            Obx(() => controller.isSearching.value
                ? IconButton(
                    icon: const Icon(Icons.close),
                    onPressed: () {
                      controller.filterItems('');
                    },
                  )
                : const SizedBox.shrink()),
          ],
        ),
        const SizedBox(height: 20),
        SearchAnchor(
          builder: (context, searchController) {
            return SearchBar(
              controller: searchController,
              onTap: () {
                searchController.openView();
              },
              onChanged: (value) {
                controller.filter(value);
              },
              leading: const Icon(Icons.search),
            );
          },
          suggestionsBuilder: (context, SearchController searchController) {
            return [
              Obx(() => ListView.builder(
                    shrinkWrap: true,
                    itemCount: controller.filteredItems.length,
                    itemBuilder: (context, index) {
                      final item = controller.filteredItems[index];
                      return ListTile(
                        title: Text(item),
                        onTap: () {
                          controller.select(item);
                          Navigator.of(context).pop();
                        },
                      );
                    },
                  )),
            ];
          },
        ),
        const SizedBox(height: 20),
        Obx(() {
          if (controller.searchQuery.value.isEmpty) {
            return Expanded(
              child: ListView.builder(
                itemCount: controller.allItems.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(controller.allItems[index]),
                  );
                },
              ),
            );
          } else {
            return Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      'Search results for "${controller.searchQuery.value}":',
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                  ),
                  Expanded(
                    child: ListView.builder(
                      itemCount: controller.filteredItems.length,
                      itemBuilder: (context, index) {
                        return ListTile(
                          title: Text(controller.filteredItems[index]),
                        );
                      },
                    ),
                  ),
                ],
              ),
            );
          }
        }),
      ],
    );
  }
}

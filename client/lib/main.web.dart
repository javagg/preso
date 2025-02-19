import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import 'src/app/routes/app_pages.dart';
import 'src/app/pages/not_found/not_found.dart';
import 'src/generated/locales.g.dart';
import 'src/services/auth_service.dart';

Future<void> init() async {
  await Get.put(DbService()).init();
  await Get.put(SettingsService()).init();
  await GetStorage.init();
}

class DbService extends GetxService {
  Future<DbService> init() async {
    // print('$runtimeType delays 2 sec');
    await 2.delay();
    // print('$runtimeType ready!');
    return this;
  }
}

class SettingsService extends GetxService {
  Future<void> init() async {
    // print('$runtimeType delays 1 sec');
    await 1.delay();
    // print('$runtimeType ready!');
  }
}

void main() async {
  await init();
  runApp(
    GetMaterialApp(
      key: UniqueKey(),
      title: "Application",
      binds: [
        Bind.put(AuthService()),
      ],
      getPages: AppPages.routes,
      initialRoute: AppPages.initial,
      translationsKeys: AppTranslation.translations,
      unknownRoute: GetPage(name: '/not-found', page: () => const NotFound()),
      // builder: (context, child) {
      //   return FutureBuilder<void>(
      //     key: ValueKey('initFuture'),
      //     future: Get.find<SplashService>().init(),
      //     builder: (context, snapshot) {
      //       if (snapshot.connectionState == ConnectionState.done) {
      //         return child ?? SizedBox.shrink();
      //       }
      //       return SplashView();
      //     },
      //   );
      // },
    ),
  );
}

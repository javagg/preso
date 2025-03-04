import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import 'app/routes/web/app_pages.dart';
import 'app/pages/not_found/not_found.dart';
import 'generated/locales.g.dart';
import 'services/auth_service.dart';
import 'dart:developer';
import 'serverpod_client.dart';

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


class MainMiddleware extends GetMiddleware {
  @override
  void onPageDispose() {
    log('MainMiddleware onPageDispose');
    super.onPageDispose();
  }

  @override
  Widget onPageBuilt(Widget page) {
    log('MainMiddleware onPageBuilt');
    return super.onPageBuilt(page);
  }

  @override
  GetPage? onPageCalled(GetPage? page) {
    log('MainMiddleware onPageCalled for route: ${page?.name}');
    return super.onPageCalled(page);
  }

  @override
  List<R>? onBindingsStart<R>(List<R>? bindings) {
    log('MainMiddleware onBindingsStart');
    return super.onBindingsStart(bindings);
  }

  @override
  GetPageBuilder? onPageBuildStart(GetPageBuilder? page) {
    log('MainMiddleware onPageBuildStart');

    return super.onPageBuildStart(page);
  }
}



void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await initializeServerpodClient();

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

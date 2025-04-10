import 'dart:convert';

import 'package:flutter/services.dart';

import 'app/controllers/theme_controller.dart';
import 'serverpod_client.dart';
import 'services/auth_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:json_theme/json_theme.dart';
import 'languages.dart';

import 'app/routes/mobile/app_pages.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initializeServerpodClient();
  await GetStorage.init();
  await Languages.instance.init();

  final theme = ThemeDecoder.decodeThemeData(
        json.decode((await rootBundle.loadString('assets/themes/web.json'))),
        validate: true,
      ) ??
      ThemeData();
  final themeController = Get.put(ThemeController());

  runApp(
    GetMaterialApp(
      key: UniqueKey(),
      debugShowCheckedModeBanner: false,
      title: 'app.title'.tr,
      locale: Get.deviceLocale,
      fallbackLocale: const Locale('en', 'US'),
      binds: [Bind.put(AuthService())],
      theme: theme,
      darkTheme: theme,
      themeMode: themeController.theme,
      getPages: AppPages.routes,
      initialRoute: AppPages.initial,
      translations: Languages.instance,
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
      // routeInformationParser: GetInformationParser(
      //     // initialRoute: Routes.HOME,
      //     ),
      // routerDelegate: GetDelegate(
      //   backButtonPopMode: PopMode.History,
      //   preventDuplicateHandlingMode:
      //       PreventDuplicateHandlingMode.ReorderRoutes,
      // ),
    ),
  );
}

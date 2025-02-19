import './src/widgets/account_page.dart';
import './src/serverpod_client.dart';
import './src/widgets/sign_in_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import './src/services/auth_service.dart';

import './src/app/routes/app_pages.dart';

void main() async {
  // Need to call this as SessionManager is using Flutter bindings before runApp
  // is called.
  WidgetsFlutterBinding.ensureInitialized();

  await initializeServerpodClient();

  // runApp(const MyApp());
  runApp(
    GetMaterialApp(
      title: "Application",
      binds: [
        Bind.put(AuthService()),
      ],
      getPages: AppPages.routes,
      initialRoute: AppPages.initial,
    ),
  );
}

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Auth example',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//       ),
//       home: const MyHomePage(title: 'Serverpod Example'),
//     );
//   }
// }

// class MyHomePage extends StatefulWidget {
//   const MyHomePage({super.key, required this.title});

//   final String title;

//   @override
//   MyHomePageState createState() => MyHomePageState();
// }

// class MyHomePageState extends State<MyHomePage> {
//   @override
//   void initState() {
//     super.initState();

//     // Make sure that we rebuild the page if signed in status changes.
//     sessionManager.addListener(() {
//       setState(() {});
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(widget.title),
//       ),
//       body:
//           sessionManager.isSignedIn ? const AccountPage() : const SignInPage(),
//     );
//   }
// }

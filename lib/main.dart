import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:state/crud.dart';
import 'package:state/home.dart';
import 'package:state/responsive/mobile_body.dart';
import 'package:state/responsive/responsive_layout.dart';
import 'package:state/responsive/tablet_body.dart';
import 'package:state/responsive/desktop_body.dart';
import 'page2.dart';
import 'loginPage.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.hasError) {
            return Text(snapshot.error.toString());
          }

          if (snapshot.connectionState == ConnectionState.active) {
            if (snapshot.data == null) {
              return const LoginPage();
            } else {
              return const home();
            }
          }
          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
      getPages: [
        GetPage(name: '/', page: () => const home()),
        GetPage(name: '/crud', page: () => const Crud()),
        GetPage(name: '/page2/:id', page: () => const page2()),
        GetPage(name: '/responsive', page: () => ResponsiveLayout(
          mobileBody: const MobileScaffold(),
          tabletBody: const TabletScaffold(),
          desktopBody: const DesktopScaffold(),
        )),
      ],
    );
  }
}

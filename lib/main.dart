import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:state/chatPage.dart';
import 'package:state/crud.dart';
import 'package:state/home.dart';
import 'package:state/home_responsive/mobile_body.dart';
import 'package:state/home_responsive/responsive_layout.dart';
import 'package:state/home_responsive/tablet_body.dart';
import 'package:state/home_responsive/desktop_body.dart';
import 'page2.dart';
import 'loginPage.dart';
import 'firebase_options.dart';
import 'package:permission_handler/permission_handler.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Permission.notification.isDenied.then((value) {
        if (value) {
          Permission.notification.request();
        }
      });
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  // FirebaseMessaging messaging = FirebaseMessaging.instance;

  // NotificationSettings settings = await messaging.requestPermission(
  //   alert: true,
  //   announcement: false,
  //   badge: true,
  //   carPlay: false,
  //   criticalAlert: false,
  //   provisional: false,
  //   sound: true,
  // );

  // print('User granted permission: ${settings.authorizationStatus}');

  // FirebaseMessaging.onMessage.listen((RemoteMessage message) {
  //   print('Got a message whilst in the foreground!');
  //   print('Message data: ${message.data}');

  //   if (message.notification != null) {
  //     print('Message also contained a notification: ${message.notification}');
  //   }
  // });

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
              return ResponsiveLayout(
                mobileBody: const MobileScaffold(),
                tabletBody: const TabletScaffold(),
                desktopBody: const DesktopScaffold(),
              );
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
        GetPage(name: '/chat', page: () => const chatPage()),
        GetPage(name: '/page2/:id', page: () => const page2()),
        GetPage(
            name: '/responsive',
            page: () => ResponsiveLayout(
                  mobileBody: const MobileScaffold(),
                  tabletBody: const TabletScaffold(),
                  desktopBody: const DesktopScaffold(),
                )),
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:state/responsive/desktop_body.dart';
import 'package:state/responsive/tablet_body.dart';
import 'responsive/mobile_body.dart';
import 'responsive/responsive_layout.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.green),
      home: ResponsiveLayout(
        mobileBody: const MobileScaffold(),
        tabletBody: const TabletScaffold(),
        desktopBody: const DesktopScaffold(),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class page2 extends StatefulWidget {
  const page2({super.key});

  @override
  State<page2> createState() => _page2State();
}

class _page2State extends State<page2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Page Detail ke-${Get.parameters['id']}"),
      ),
      body: Center(
        child: Text("Welcome to Page Detail ke-${Get.parameters['id']}"),
      )
    );
  }
}
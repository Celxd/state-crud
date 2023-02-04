import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'Controller.dart';

class home extends StatefulWidget {
  const home({super.key});

  @override
  State<home> createState() => _homeState();
}

class _homeState extends State<home> {
  final Controller control = Get.put(Controller());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text("Home"),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
           children: [
            Text("Jumlah "),
            Obx(() => Text("${control.count.toString()}")),
            ElevatedButton(
              onPressed: () {
                control.increment();
              },
              child: Text("Tambah"),
            ),
            ElevatedButton(
              onPressed: () {
                Get.toNamed("page1");
              },
              child: Text("Next Page"),
            ),
            Text("Dynamic detail page:"),
            ElevatedButton(
              onPressed: () {
                Get.toNamed("/page2/1");
              },
              child: Text("Detail 1"),
            ),
            ElevatedButton(
              onPressed: () {
                Get.toNamed("/page2/2",);
              },
              child: Text("Detail 2"),
            ),
            ElevatedButton(
              onPressed: () {
                Get.toNamed("/page2/3");
              },
              child: Text("Detail 3"),
            ),
            Text("Test Notification / Snack bar"),
            ElevatedButton(
              onPressed: () {
                Get.snackbar("Testing", "Ini tes snackbar");
              },
              child: Text("Show Snack Bar"),
            ),
           ],
        ),
      ),
    );
  }
}
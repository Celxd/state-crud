import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
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
        title: const Text("Home"),
      ),
      body: Center(
        child: Column(
           children: [
            const Text("Jumlah "),
            Obx(() => Text(control.count.toString())),
            ElevatedButton(
              onPressed: () {
                control.increment();
              },
              child: const Text("Tambah"),
            ),
            ElevatedButton(
              onPressed: () {
                Get.toNamed("/crud");
              },
              child: const Text("Crud Page"),
            ),
            const Text("Dynamic detail page:"),
            ElevatedButton(
              onPressed: () {
                Get.toNamed("/page2/1");
              },
              child: const Text("Detail 1"),
            ),
            ElevatedButton(
              onPressed: () {
                Get.toNamed("/page2/2",);
              },
              child: const Text("Detail 2"),
            ),
            ElevatedButton(
              onPressed: () {
                Get.toNamed("/page2/3");
              },
              child: const Text("Detail 3"),
            ),
            const Text("Test Notification / Snack bar"),
            ElevatedButton(
              onPressed: () {
                Get.snackbar("Testing", "Ini tes snackbar");
              },
              child: const Text("Show Snack Bar"),
            ),
            ElevatedButton(
              onPressed: () {
                logout();
              },
              child: const Text("Log Out"),
            ),
           ],
        ),
      ),
    );
  }

  Future logout() async {
    await FirebaseAuth.instance.signOut();
    await GoogleSignIn().signOut();
  }
}
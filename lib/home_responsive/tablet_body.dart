import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import '../Controller.dart';
import 'package:state/constants.dart';
import '../util/my_box.dart';
import '../util/my_tile.dart';

class TabletScaffold extends StatefulWidget {
  const TabletScaffold({Key? key}) : super(key: key);

  @override
  State<TabletScaffold> createState() => _TabletScaffoldState();
}

class _TabletScaffoldState extends State<TabletScaffold> {
  final Controller control = Get.put(Controller());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Responsive Layout"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
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
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {
                    Get.toNamed("/responsive");
                  },
                  child: const Text("Tes Responsive"),
                ),
                SizedBox(
                  width: 10,
                ),
                ElevatedButton(
                  onPressed: () {
                    Get.toNamed("/crud");
                  },
                  child: const Text("Crud Page"),
                ),
                // const Text("Test Notification / Snack bar"),
                SizedBox(
                  width: 10,
                ),
                ElevatedButton(
                  onPressed: () {
                    Get.snackbar("Testing", "Ini tes snackbar");
                  },
                  child: const Text("Show Snack Bar"),
                ),
              ],
            ),
            const Text("Dynamic detail page:"),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: 10,
                ),
                SizedBox(
                  width: 10,
                ),
                ElevatedButton(
                  onPressed: () {
                    Get.toNamed("/page2/1");
                  },
                  child: const Text("Detail 1"),
                ),
                SizedBox(
                  width: 10,
                ),
                ElevatedButton(
                  onPressed: () {
                    Get.toNamed(
                      "/page2/2",
                    );
                  },
                  child: const Text("Detail 2"),
                ),
                SizedBox(
                  width: 10,
                ),
                ElevatedButton(
                  onPressed: () {
                    Get.toNamed("/page2/3");
                  },
                  child: const Text("Detail 3"),
                ),
              ],
            ),
            SizedBox(
              width: 10,
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

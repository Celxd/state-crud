import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Controller extends GetxController {
  final count = 0.obs;

  void increment() => count.value++;
}
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Utils {
  static final random = Random();

  static List<Color> colors = [
    const Color.fromARGB(255, 252, 138, 138),
    const Color.fromARGB(255, 245, 207, 94),
    const Color.fromARGB(255, 103, 155, 245),
    Colors.greenAccent,
    Colors.purple,
    const Color.fromARGB(255, 249, 100, 150),
    Colors.teal,
    Colors.blueGrey,
    const Color.fromARGB(255, 248, 180, 91),
    const Color.fromARGB(255, 245, 138, 105),
  ];

  static Color randomColor() {
    return colors[random.nextInt(10)];
  }

  comingSoonMsg() {
    Get.snackbar(
      "Test Project",
      "Feature coming soon",
      snackPosition: SnackPosition.BOTTOM,
      margin: EdgeInsets.only(bottom: 12, left: 12, right: 12),
      colorText: Colors.white,
      backgroundColor: Colors.black,
    );
  }
}

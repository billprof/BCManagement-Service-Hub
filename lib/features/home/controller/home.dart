import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_project/core/constants.dart';
import 'package:test_project/features/home/models/products.dart';

class HomeController extends GetxController {
  bool loading = true;
  bool error = false;
  List<Product> products = [];
  final dio = Dio();

  getProducts() async {
    try {
      error = false;
      loading = true;
      update();

      final response = await dio.get(apiUrl);

      final items = response.data["products"] as List<dynamic>;

      products = items
          .map((e) => Product.fromJson(e as Map<String, dynamic>))
          .toList();

      loading = false;

      update();
    } catch (e) {
      error = true;
      debugPrint("Error $e");
      update();
    }
  }
}

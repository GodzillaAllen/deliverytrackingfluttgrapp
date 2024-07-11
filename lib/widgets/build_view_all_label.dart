import 'package:flutter/material.dart';
import 'package:get/get.dart';

Widget buildViewAllLabel(String route) {
  return InkWell(
    onTap: () => {Get.toNamed(route)},
    child: const Text(
      "View All",
      style: TextStyle(
        fontWeight: FontWeight.bold,
        color: Colors.black,
      ),
    ),
  );
}

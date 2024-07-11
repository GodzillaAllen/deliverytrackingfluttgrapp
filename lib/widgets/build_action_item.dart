import 'package:flutter/material.dart';
import 'package:get/get.dart';

Widget buildActionItem(IconData icon, String label, String route) {
  return InkWell(
    onTap: () => {Get.toNamed(route)},
    child: Column(
      children: [
        Icon(
          icon,
          size: 40,
          color: Colors.black,
        ),
        const SizedBox(height: 5),
        Text(
          label,
          style: const TextStyle(color: Colors.black),
        ),
      ],
    ),
  );
}

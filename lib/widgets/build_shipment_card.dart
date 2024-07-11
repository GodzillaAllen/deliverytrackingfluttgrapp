// lib/widgets/build_shipment_card.dart
import 'package:flutter/material.dart';
import 'package:get/get.dart';

Widget buildShipmentCard(String trackingNumber, String status) {
  return InkWell(
    onTap: () => {Get.toNamed('/shipment_detail')},
    child: Card(
      margin: const EdgeInsets.all(8.0),
      child: ListTile(
        tileColor: Colors.white,
        leading: const CircleAvatar(
          backgroundColor: Colors.black,
          child: Icon(Icons.local_shipping, color: Colors.white),
        ),
        title: Text(
          trackingNumber,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        subtitle: Text(status),
        trailing: const Icon(
          Icons.arrow_forward,
          color: Colors.black,
        ),
      ),
    ),
  );
}

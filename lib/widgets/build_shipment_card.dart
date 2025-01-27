// lib/widgets/build_shipment_card.dart
import 'package:deliverytrackingfluttgrapp/models/order.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../screens/order_detail_screen.dart';

Widget buildShipmentCard(
  Order order,
) {
  return InkWell(
    onTap: () {
      Get.to(OrderDetailScreen(order: order));
    },
    child: Card(
      margin: const EdgeInsets.all(8.0),
      child: ListTile(
        tileColor: Colors.white,
        leading: const CircleAvatar(
          backgroundColor: Colors.black,
          child: Icon(Icons.local_shipping, color: Colors.white),
        ),
        title: Text(
          order.orderNumber,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        subtitle: Text(order.status),
        trailing: const Icon(
          Icons.arrow_forward,
          color: Colors.black,
        ),
      ),
    ),
  );
}

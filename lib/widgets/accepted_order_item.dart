import 'package:deliverytrackingfluttgrapp/screens/accepted_order_detail_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../models/accepted_order.dart';
// Import your AcceptedOrder model

Widget acceptedOrderItem(AcceptedOrder acceptedOrder) {
  return InkWell(
    onTap: () {
      Get.to(AcceptedOrderDetailScreen(
        acceptedOrder: acceptedOrder,
      ));
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
          acceptedOrder.orderNumber,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        subtitle: Text(acceptedOrder.status),
        trailing: const Icon(
          Icons.arrow_forward,
          color: Colors.black,
        ),
      ),
    ),
  );
}

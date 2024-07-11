import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/order_controller.dart';
import '../widgets/build_shipment_card.dart';

class OrderHistoryScreen extends StatelessWidget {
  final OrderController orderController = Get.put(OrderController());

  OrderHistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Fetch user's order history from orderController
    final orders =
        orderController.orders; // Assuming orders are fetched asynchronously

    return Scaffold(
      appBar: AppBar(
        title: const Text("Order History"),
      ),
      body: orders.isEmpty
          ? const Center(
              child: Text('No orders found'),
            )
          : ListView.builder(
              itemCount: orders.length,
              itemBuilder: (context, index) {
                final order = orders[index];
                // buildShipmentCard(order.orderNumber, "${order.userLocation} · ${order.orderDate}")
                return buildShipmentCard(order.orderNumber,
                    "${order.userLocation} · ${order.orderDate}");
                // title: Text('Order ID: ${order.orderNumber}'),
                // subtitle: Text('Order Date: ${order.orderDate}'),
                // trailing: Text('Status: ${order.userLocation}'),
              },
            ),
    );
  }
}

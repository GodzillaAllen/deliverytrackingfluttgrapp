import 'package:deliverytrackingfluttgrapp/widgets/build_accept_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/order_controller.dart'; // Import your OrderController
import '../models/order.dart'; // Import your Order model

class ExploreOrdersScreen extends StatelessWidget {
  final OrderController orderController = Get.find();

  ExploreOrdersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Explore Orders'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              onChanged: (value) {
                orderController.searchOrders(value);
              },
              decoration: const InputDecoration(
                hintText: 'Search by Order Number, Phone, or Location',
                prefixIcon: Icon(Icons.search),
              ),
            ),
            const SizedBox(height: 16),
            Obx(() {
              final orders = orderController.orders;
              return Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      for (var order in orders) buildAcceptCard(order),
                    ],
                  ),
                ),
              );
            }),
          ],
        ),
      ),
    );
  }
}

class OrderDetailsWidget extends StatelessWidget {
  final Order order;

  const OrderDetailsWidget({super.key, required this.order});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8),
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Order Number: ${order.orderNumber}'),
            Text('User Phone: ${order.userPhoneNumber}'),
            Text('Location: ${order.userLocation}'),
            Text('Order Date: ${order.orderDate}'),
            Text('Order Destination: ${order.orderDestination}'),
            Text('Status: ${order.status}'),
          ],
        ),
      ),
    );
  }
}

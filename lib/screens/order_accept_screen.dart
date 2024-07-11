// screens/order_detail_screen.dart
import 'package:deliverytrackingfluttgrapp/controllers/accepted_controller.dart';
import 'package:deliverytrackingfluttgrapp/controllers/auth_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../models/order.dart';
import '../controllers/order_controller.dart';

class OrderAcceptScreen extends StatelessWidget {
  final OrderController orderController = Get.find();
  final AcceptedController acceptedController = Get.find();
  final AuthController authController = Get.find();
  final Order order;

  OrderAcceptScreen({super.key, required this.order});

  void _acceptOrder() {
    orderController.acceptOrder(order.id!, 'Accepted');
    // Get.snackbar("error", user!.id as String);
    acceptedController.createAcceptedOrder(order.userId, order.orderNumber);
    // Get.snackbar('Success', 'acbd ${acceptedController.acceptedOrders}');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Order Details'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Order Number: ${order.orderNumber}',
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Text(
              'User ID: ${order.userId}',
              style: const TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 10),
            Text(
              'User Phone Number: ${order.userPhoneNumber}',
              style: const TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 10),
            Text(
              'User Location: ${order.userLocation}',
              style: const TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 10),
            Text(
              'Order Date: ${order.orderDate}',
              style: const TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 10),
            Text(
              'Order Destination: ${order.orderDestination}',
              style: const TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 10),
            Text(
              'Status: ${order.status}',
              style: const TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () =>
                      order.status == 'Accepted' ? null : _acceptOrder(),
                  // Get.snackbar("eroor", order.status),
                  child: const Text('Accept'),
                ),
                ElevatedButton(
                  onPressed: () {
                    Get.back();
                  },
                  child: const Text('Back'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
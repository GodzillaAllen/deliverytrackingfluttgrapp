import 'package:deliverytrackingfluttgrapp/controllers/accepted_controller.dart';
import 'package:deliverytrackingfluttgrapp/models/accepted_order.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/order_controller.dart';
import '../models/order.dart';

class AcceptedOrderDetailScreen extends StatelessWidget {
  final AcceptedOrder acceptedOrder;
  // final Order order;
  final AcceptedController acceptedController = Get.find();
  final OrderController orderController = Get.find();

  AcceptedOrderDetailScreen({super.key, required this.acceptedOrder});

  _finishOrder(String s) {
    acceptedController.finishedOrder(acceptedOrder.orderNumber, s);
    Get.snackbar('Success',
        'Order status updated to Accepted${acceptedOrder.courierId}');
  }

  @override
  Widget build(BuildContext context) {
    final Order order = orderController.orders.first;
    return Scaffold(
      appBar: AppBar(
        title: Text('Order Details: ${acceptedOrder.orderNumber}'),
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
            Text(
              'Customer Phone: ${order.userPhoneNumber}',
              style: const TextStyle(fontSize: 18),
            ),
            Text(
              'Location: ${order.userLocation}',
              style: const TextStyle(fontSize: 18),
            ),
            Text(
              'Destination: ${order.orderDestination}',
              style: const TextStyle(fontSize: 18),
            ),
            Text(
              'Order Date: ${order.orderDate}',
              style: const TextStyle(fontSize: 18),
            ),
            Text(
              'Status: ${acceptedOrder.status}',
              style: const TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
                onPressed: () => acceptedOrder.status == 'Accepted'
                    ? acceptedOrder.status == "Delivering"
                    : _finishOrder("Delivering")
                        ? acceptedOrder.status == "Delivering"
                        : _finishOrder("Delivered"),
                // Get.snackbar("eroor", order.status),
                child: acceptedOrder.status == 'Accepted'
                    ? const Text("Delivering")
                    : acceptedOrder.status == "Delivering"
                        ? const Text("Delivered")
                        : null),
          ],
        ),
      ),
    );
  }
}

import 'package:deliverytrackingfluttgrapp/controllers/auth_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/accepted_controller.dart';
// Import your OrderController
import '../models/accepted_order.dart';
import '../widgets/accepted_order_item.dart'; // Import your AcceptedOrderItem widget

class AcceptedOrdersByUserScreen extends StatelessWidget {
  // final OrderController orderController = Get.find();
  final AuthController authController = Get.find();
  final AcceptedController acceptedController = Get.find();

  AcceptedOrdersByUserScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final userid = authController.user!.id;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Accepted by Me'),
      ),
      body: FutureBuilder<List<AcceptedOrder>>(
        future: acceptedController.getAcceptedOrdersByCustomerId(userid!),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text('No accepted orders found.'));
          } else {
            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                final acceptedOrder = snapshot.data![index];
                return acceptedOrderItem(
                  acceptedOrder,
                );
              },
            );
          }
        },
      ),
    );
  }
}

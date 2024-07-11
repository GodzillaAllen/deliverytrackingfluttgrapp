import 'package:deliverytrackingfluttgrapp/controllers/accepted_controller.dart';
import 'package:deliverytrackingfluttgrapp/widgets/build_shipment_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/order_controller.dart';
import '../widgets/accepted_order_item.dart';

class AllOrderHistoryScreen extends StatelessWidget {
  final AcceptedController acceptedController = Get.find();

  AllOrderHistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Order History'),
          bottom: const TabBar(
            labelStyle: TextStyle(color: Colors.white),
            tabs: [
              Tab(text: 'My Orders'),
              Tab(text: 'Accepted Orders'),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            MyOrdersView(),
            AcceptedOrdersView(),
          ],
        ),
      ),
    );
  }
}

class AcceptedOrdersView extends StatelessWidget {
  final AcceptedController acceptedController = Get.find();

  AcceptedOrdersView({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      final acceptedOrders = acceptedController.acceptedOrders
          .where((acceptedOrder) =>
              acceptedOrder.courierId ==
              acceptedController.authController.user!.id)
          .toList();
      return ListView.builder(
        itemCount: acceptedOrders.length,
        itemBuilder: (context, index) {
          final acceptedOrder = acceptedOrders[index];
          return acceptedOrderItem(
            acceptedOrder,
          );
        },
      );
    });
  }
}

class MyOrdersView extends StatelessWidget {
  final OrderController orderController = Get.find();

  MyOrdersView({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      final orders = orderController.orders
          .where((order) =>
              order.userId == orderController.authController.user!.id)
          .toList();
      return ListView.builder(
        itemCount: orders.length,
        itemBuilder: (context, index) {
          final order = orders[index];
          return buildShipmentCard(order);
        },
      );
    });
  }
}

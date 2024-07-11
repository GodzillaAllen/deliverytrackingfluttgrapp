// lib/pages/home_page.dart

import 'package:deliverytrackingfluttgrapp/controllers/auth_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../widgets/build_current_shipment_card.dart';
import '../widgets/build_shipment_card.dart';
import '../widgets/build_action_item.dart';
import '../widgets/build_view_all_label.dart';

class HomeScreen extends StatelessWidget {
  final AuthController authController = Get.find();
  HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Obx(() {
                final user = authController.user;
                // Get.snackbar("title", user!.createdAt);
                if (user == null) {
                  return const Text('No user information available');
                } else {
                  return Column(
                    children: [
                      Text('Username: ${user.username}'),
                      Text('Email: ${user.email}'),
                      Text('Phone: ${user.userPhoneNumber}'),
                    ],
                  );
                }
              }),
              const SizedBox(height: 10),
              TextField(
                decoration: InputDecoration(
                  hintText: 'Enter your tracking number',
                  filled: true,
                  fillColor: Colors.grey[200],
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  buildActionItem(Icons.create, 'Order Create', '/checkout'),
                  buildActionItem(Icons.local_shipping, 'Pick Up', '/order'),
                  buildActionItem(Icons.store, 'Drop Off', '/order'),
                  buildActionItem(Icons.history, 'History', '/history'),
                ],
              ),
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.all(7.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text("Current Shipment",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.black)),
                        buildViewAllLabel("current_shipment"),
                      ],
                    ),
                    const SizedBox(height: 8.0),
                    buildCurrentShipmentCard("#HWDSF776567DS", "Yangon,Myanmar",
                        "Hogwarts, Scotland", "on the way"),
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text("Recent Shipment",
                      style: TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.black)),
                  buildViewAllLabel("recent_shipment"),
                ],
              ),
              buildShipmentCard("#HWDSF776567DS", "On the way · 24 June"),
              buildShipmentCard("#HWDSF776567DS", "On the way · 24 June"),
            ],
          ),
        ),
      ),
    );
  }
}

// lib/pages/home_page.dart

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/auth_controller.dart';
import '../models/user.dart';
import '../widgets/build_current_shipment_card.dart';
import '../widgets/build_shipment_card.dart';
import '../widgets/build_action_item.dart';
import '../widgets/build_view_all_label.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final AuthController authController =
        Get.put(AuthController()); // Use Get.find to retrieve AuthController
    final User? user = authController.user;
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Let's Track Your Package ${user!.username}",
                style:
                    const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
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

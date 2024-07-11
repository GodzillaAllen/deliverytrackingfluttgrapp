// lib/pages/home_page.dart

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/auth_controller.dart';
import '../models/user.dart';
import '../widgets/build_current_shipment_card.dart';
import '../widgets/build_action_item.dart';
import '../widgets/build_view_all_label.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.find();
    final AuthController authController = Get.find();
    final User? user = authController.user;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Home page"),
      ),
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
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  buildActionItem(Icons.add, 'Create Order', '/create_order'),
                  buildActionItem(
                      Icons.delivery_dining, 'My Orders', '/accepted_by_user'),
                  buildActionItem(
                      Icons.check, 'Accepted Orders', '/accepted_by_courier'),
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
              buildCurrentShipmentCard("#HWDSF776567DS", "Yangon,Myanmar",
                  "Hogwarts, Scotland", "on the way"),
              buildCurrentShipmentCard("#HWDSF776567DS", "Yangon,Myanmar",
                  "Hogwarts, Scotland", "on the way"),
            ],
          ),
        ),
      ),
    );
  }
}

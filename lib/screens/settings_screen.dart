import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/auth_controller.dart';
import 'about_us_screen.dart';
import 'order_history_screen.dart'; // Ensure AuthController is imported

class SettingsScreen extends StatelessWidget {
  final AuthController authController = Get.find();

  SettingsScreen({super.key}); // Use Get.find to retrieve AuthController

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          ListTile(
            leading: const Icon(Icons.person),
            title: const Text('Edit Profile'),
            onTap: () {
              Get.toNamed('/edit_profile');
            },
          ),
          ListTile(
            leading: const Icon(Icons.history),
            title: const Text('Order History'),
            onTap: () {
              Get.to(() => OrderHistoryScreen());
            },
          ),
          ListTile(
            leading: const Icon(Icons.info),
            title: const Text('About Us'),
            onTap: () {
              Get.to(() => const AboutUsScreen());
            },
          ),
          ListTile(
            leading: const Icon(Icons.logout),
            title: const Text('Log Out'),
            onTap: () {
              authController.logout();
            },
          ),
        ],
      ),
    );
  }
}

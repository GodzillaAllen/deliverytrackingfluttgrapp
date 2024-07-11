import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/auth_controller.dart'; // Ensure AuthController is imported
import '../models/user.dart'; // Import your User model

class EditProfileScreen extends StatelessWidget {
  const EditProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final AuthController authController =
        Get.put(AuthController()); // Use Get.find to retrieve AuthController
    final User? user = authController.user;

    TextEditingController usernameController =
        TextEditingController(text: user?.username ?? '');
    TextEditingController emailController =
        TextEditingController(text: user?.email ?? '');

    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit Profile'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextFormField(
              controller: usernameController,
              decoration: const InputDecoration(labelText: 'Username'),
              onChanged: (value) {
                if (user != null) {
                  user.username = value; // Update username directly
                }
              },
            ),
            TextFormField(
              controller: emailController,
              decoration: const InputDecoration(labelText: 'Email'),
              onChanged: (value) {
                if (user != null) {
                  user.email = value; // Update email directly
                }
              },
            ),
            // Add more fields as needed
            ElevatedButton(
              onPressed: () {
                if (user != null) {
                  authController
                      .updateUser(user); // Update user in AuthController
                  Get.snackbar('Success', 'Profile updated successfully');
                }
              },
              child: const Text('Save Changes'),
            ),
          ],
        ),
      ),
    );
  }
}
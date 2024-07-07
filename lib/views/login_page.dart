import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../services/database_helper.dart'; // Adjust import path as necessary

class LoginPage extends StatelessWidget {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  void login() async {
    String username = usernameController.text.trim();
    String password = passwordController.text.trim();

    Map<String, dynamic>? user = await dbHelper.getUser(username, password);
    if (user != null) {
      // Successful login
      // Navigate to home or another page
      Get.offAllNamed('/home'); // Replace '/home' with your home route
    } else {
      // Failed login
      Get.snackbar('Error', 'Invalid username or password');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Login')),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: usernameController,
              decoration: InputDecoration(labelText: 'Username'),
            ),
            TextField(
              controller: passwordController,
              decoration: InputDecoration(labelText: 'Password'),
              obscureText: true,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: login,
              child: Text('Login'),
            ),
            TextButton(
              onPressed: () {
                Get.toNamed('/signup'); // Navigate to signup page
              },
              child: Text('Create an account'),
            ),
          ],
        ),
      ),
    );
  }
}

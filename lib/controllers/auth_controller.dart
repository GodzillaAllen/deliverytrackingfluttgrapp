import 'package:get/get.dart';
import '../services/database_helper.dart'; // Adjust import path as necessary

class AuthController extends GetxController {
  RxBool isLoggedIn = false.obs; // Observable for tracking login state

  Future<void> login(String username, String password) async {
    Map<String, dynamic>? user = await dbHelper.getUser(username, password);
    if (user != null) {
      isLoggedIn.value = true;
      // Navigate to home or another page
      Get.offAllNamed('/home'); // Replace '/home' with your home route
    } else {
      Get.snackbar('Error', 'Invalid username or password');
    }
  }

  Future<void> signUp(String username, String password) async {
    Map<String, dynamic> user = {
      'username': username,
      'password': password,
    };

    await dbHelper.insertUser(user);
    Get.back(); // Navigate back to login page
    Get.snackbar('Success', 'Account created successfully');
  }

  void logout() async {
    await dbHelper.logout();
    isLoggedIn.value = false;
    Get.offAllNamed('/login'); // Navigate to login page
  }
}

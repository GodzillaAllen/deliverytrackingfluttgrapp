import 'package:get/get.dart';
import '../models/user.dart';
import '../services/database.dart';

class AuthController extends GetxController {
  final Rxn<User> _user = Rxn<User>();

  User? get user => _user.value;

  Future<void> register(String username, String email, String password) async {
    final user = User(username: username, email: email, password: password);
    await DatabaseHelper.instance.registerUser(user);
    _user.value = user;
    Get.snackbar('Success', 'Registration successful');
  }

  Future<void> login(String email, String password) async {
    final user = await DatabaseHelper.instance.loginUser(email, password);
    if (user != null) {
      _user.value = user;
      Get.offAllNamed('/home');
    } else {
      Get.snackbar('Error', 'Invalid credentials');
    }
  }

  void logout() {
    _user.value = null;
    Get.offAllNamed('/login');
  }
}

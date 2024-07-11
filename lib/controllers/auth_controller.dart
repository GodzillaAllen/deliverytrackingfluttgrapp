import 'package:get/get.dart';
import '../models/user.dart';
import '../services/database.dart';

class AuthController extends GetxController {
  final Rxn<User> _user = Rxn<User>(); // Reactive variable for user

  User? get user => _user.value; // Getter for user

  void setUser(User user) {
    _user.value = user;
    // Get.snackbar("title", _user.value!.id.toString());
  }

  void clearUser() {
    _user.value = null;
  }

  Future<bool> login(String email, String password) async {
    try {
      final user = await DatabaseHelper.instance.loginUser(email, password);
      if (user != null) {
        setUser(user);

        Get.offAllNamed('/home');
        return true;
      } else {
        throw Exception('Invalid credentials');
      }
    } catch (e) {
      throw Exception('Login failed: $e');
    }
  }

  // Future<void> getUserbyLogin(String email, String password) async {
  //   final user = await DatabaseHelper.instance.getUser(email, password);
  //   // Get.snackbar("title", user!.username);
  //   setUser(user!);
  // }

  Future<bool> register(String username, String email, String password,
      String userAddress, String userPhoneNumber) async {
    final newUser = User(
      username: username,
      email: email,
      password: password,
      userAddress: userAddress,
      userPhoneNumber: userPhoneNumber,
      createdAt: DateTime.now().toIso8601String(),
      updatedAt: DateTime.now().toIso8601String(),
    );
    await DatabaseHelper.instance.registerUser(newUser);
    // user.value = newUser.copyWith(id: id);
    setUser(newUser);
    Get.offAllNamed('/home'); // Navigate to the home page
    return true;
  }

  void logout() {
    clearUser();
    Get.offAllNamed('/'); // Navigate to the login page
  }

  void updateUser(User user) {}
}

import 'package:get/get.dart';
import '../services/database_helper.dart';
import '../services/auth_service.dart';

class AppController extends GetxController {
  var isAuthenticated = false.obs;
  var deliveries = [].obs;

  final AuthService _authService = AuthService();
  final DatabaseHelper _databaseHelper = DatabaseHelper();

  Future<void> login(String username, String password) async {
    isAuthenticated.value = await _authService.login(username, password);
  }

  Future<void> logout() async {
    isAuthenticated.value = await _authService.logout();
  }

  Future<void> fetchDeliveries() async {
    final db = await _databaseHelper.database;
    final List<Map<String, dynamic>> maps = await db!.query('deliveries');
    deliveries.value = List.generate(maps.length, (i) {
      return {
        'id': maps[i]['id'],
        'description': maps[i]['description'],
        'latitude': maps[i]['latitude'],
        'longitude': maps[i]['longitude'],
      };
    });
  }
}

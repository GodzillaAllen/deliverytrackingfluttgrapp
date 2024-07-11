import 'package:get/get.dart';
import '../models/order.dart';
import '../services/database.dart';
import 'auth_controller.dart';

class OrderController extends GetxController {
  final RxList<Order> _orders = <Order>[].obs;
  final AuthController authController = Get.find();

  List<Order> get orders => _orders;

  @override
  void onInit() {
    super.onInit();
    _loadOrders(); // Load orders when the controller is initialized
  }

  Future<void> _loadOrders() async {
    final allOrders = await DatabaseHelper.instance.getAllOrders();
    _orders.assignAll(allOrders);
  }
  // Future<void> _loadOrders() async {
  //   final user = authController.user.value;
  //   if (user != null) {
  //     final orders = await DatabaseHelper.instance.getOrdersByUserId(user.id!);
  //     _orders.assignAll(orders);
  //   }
  // }

  Future<void> createOrder(
    String userPhoneNumber,
    String userLocation,
    String orderDestination,
  ) async {
    final user = authController.user;
    if (user != null) {
      try {
        final now = DateTime.now();
        final order = Order(
          userId: user.id!,
          orderNumber: generateOrderNumber(),
          userPhoneNumber: userPhoneNumber,
          userLocation: userLocation,
          orderDate: now.toIso8601String(),
          orderDestination: orderDestination,
        );
        await DatabaseHelper.instance.createOrder(order);
        _orders.add(order);
        Get.snackbar('Success', 'Order created successfully');
      } catch (e) {
        Get.snackbar("Fail", e.toString());
      }
    } else {
      Get.snackbar('Error', 'User is not logged in');
    }
  }

  generateOrderNumber() {
    return "12344";
  }
}

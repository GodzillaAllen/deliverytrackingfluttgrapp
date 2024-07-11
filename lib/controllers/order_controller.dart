import 'dart:math';

import 'package:get/get.dart';
import '../models/order.dart';
import '../models/user.dart';
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
    // Use Get.find to retrieve AuthController
    final User? user = authController.user;

    if (user != null) {
      try {
        final now = DateTime.now();
        final order = Order(
          userId: user.id!,
          orderNumber: "#${generateOrderNumber(10)}",
          userPhoneNumber: userPhoneNumber,
          userLocation: userLocation,
          orderDate: now.toIso8601String(),
          orderDestination: orderDestination,
          status: 'pending',
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

  generateOrderNumber(int length) {
    const String chars = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890';
    Random rnd = Random();

    return String.fromCharCodes(Iterable.generate(
      length,
      (_) => chars.codeUnitAt(rnd.nextInt(chars.length)),
    ));
  }

  Future<void> acceptOrder(int orderId, String s) async {
    await DatabaseHelper.instance.updateOrderStatus(orderId, s);
    _loadOrders(); // Reload orders to get the updated status
  }

  Future<void> fetchPendingOrders() async {
    final pendingOrders = await DatabaseHelper.instance.getPendingOrders();
    _orders.assignAll(pendingOrders);
  }

  void searchOrders(String query) {
    // Example: Filter orders based on orderNumber or user details
    final filteredOrders = _orders.where((order) =>
        order.orderNumber.toLowerCase().contains(query.toLowerCase()) ||
        order.userPhoneNumber.toLowerCase().contains(query.toLowerCase()) ||
        order.userLocation.toLowerCase().contains(query.toLowerCase()));

    _orders.assignAll(filteredOrders.toList());
  }
}

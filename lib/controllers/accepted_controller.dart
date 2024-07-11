import 'package:deliverytrackingfluttgrapp/controllers/auth_controller.dart';
import 'package:deliverytrackingfluttgrapp/models/user.dart';
import 'package:get/get.dart';
import '../models/accepted_order.dart';
import '../services/database.dart';

class AcceptedController extends GetxController {
  final RxList<AcceptedOrder> _acceptedOrders = <AcceptedOrder>[].obs;
  final AuthController authController = Get.find();

  List<AcceptedOrder> get acceptedOrders => _acceptedOrders;

  @override
  void onInit() {
    super.onInit();
    _loadOrders(); // Load orders when the controller is initialized
  }

  Future<void> _loadOrders() async {
    final allAcceptedOrders = await DatabaseHelper.instance.getAcceptedOrders();
    _acceptedOrders.assignAll(allAcceptedOrders);
  }

  Future<void> createAcceptedOrder(
    int customerId,
    String orderNumber,
  ) async {
    final User? user = authController.user;
    if (user != null) {
      try {
        final now = DateTime.now();
        final acceptedOrder = AcceptedOrder(
            customerId: customerId,
            courierId: user.id!,
            acceptedTime: now.toIso8601String(),
            departureTime: '', // Set as needed
            arrivalTime: '', // Set as needed
            orderNumber: orderNumber,
            status: 'Accepted');
        await DatabaseHelper.instance.createAcceptedOrder(acceptedOrder);
        _acceptedOrders.add(acceptedOrder);
        Get.snackbar("success", "accepted order created");
      } catch (e) {
        Get.snackbar("fail", e.toString());
      }
    }
  }

  // Future<List<AcceptedOrder>> getAllAcceptedOrders() async {
  //   Database db = await instance.database;
  //   List<Map<String, dynamic>> results = await db.query('orders');
  //   return results.map((json) => Order.fromMap(json)).toList();
  // }

  Future<List<AcceptedOrder>> getAcceptedOrdersByCustomerId(
      int customerId) async {
    final acceptedOrders =
        await DatabaseHelper.instance.getAcceptedOrdersByCustomerId(customerId);
    acceptedOrders.assignAll(acceptedOrders);
    return _acceptedOrders;
  }

  Future<List<AcceptedOrder>> getAcceptedOrders() async {
    final acceptedOrders = await DatabaseHelper.instance.getAcceptedOrders();
    acceptedOrders.assignAll(acceptedOrders);
    return _acceptedOrders;
  }

  Future<List<AcceptedOrder>> getAcceptedByCourierId(int courierId) async {
    final acceptedOrders =
        await DatabaseHelper.instance.getAcceptedOrdersByCourierId(courierId);
    acceptedOrders.assignAll(acceptedOrders);
    return _acceptedOrders;
  }

  Future<void> finishedOrder(String orderNumber, String s) async {
    await DatabaseHelper.instance.finishedOrderStatus(orderNumber, s);
    _loadOrders(); // Reload orders to get the updated status
  }
}

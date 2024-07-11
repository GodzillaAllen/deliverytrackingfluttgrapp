import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/order_controller.dart';
import '../controllers/auth_controller.dart';
import '../widgets/custom_text_field.dart';

class CreateOrderScreen extends StatelessWidget {
  final _userPhoneNumberController = TextEditingController();
  final _userLocationController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  final OrderController orderController = Get.put(OrderController());
  final AuthController authController = Get.put(AuthController());
  final _orderDestinationController = TextEditingController();

  CreateOrderScreen({super.key});

  void _createOrder() {
    if (_formKey.currentState!.validate()) {
      final userPhoneNumber = _userPhoneNumberController.text;
      final userLocation = _userLocationController.text;
      final orderDestination = _orderDestinationController.text;

      orderController.createOrder(
          userPhoneNumber, userLocation, orderDestination);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomTextField(
                controller: _userPhoneNumberController,
                labelText: 'Phone Number',
                keyboardType: TextInputType.text,
              ),
              CustomTextField(
                controller: _userLocationController,
                labelText: 'Location',
                keyboardType: TextInputType.text,
              ),
              CustomTextField(
                controller: _orderDestinationController,
                labelText: 'Destination',
                keyboardType: TextInputType.text,
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: _createOrder,
                child: const Text('Create Order'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

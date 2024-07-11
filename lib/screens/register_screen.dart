import 'package:deliverytrackingfluttgrapp/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/auth_controller.dart';
import '../widgets/custom_text_field.dart';

class RegisterScreen extends StatelessWidget {
  final _usernameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  final _userAddressController = TextEditingController();
  final _userPhoneNumberController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  final AuthController authController = Get.put(AuthController());

  RegisterScreen({super.key});

  void _register() async {
    if (_formKey.currentState!.validate()) {
      final username = _usernameController.text;
      final email = _emailController.text;
      final password = _passwordController.text;
      final confirmPassword = _confirmPasswordController.text;
      final userAddress = _userAddressController.text;
      final userPhoneNumber = _userPhoneNumberController.text;
      DateTime.now().toIso8601String();

      if (password != confirmPassword) {
        Get.snackbar('Error', 'Passwords do not match');
        return;
      }

      final result = await authController.register(
        username,
        email,
        password,
        userAddress,
        userPhoneNumber,
      );
      if (result) {
        _usernameController.clear();
        _emailController.clear();
        _passwordController.clear();
        _confirmPasswordController.clear();
        _userAddressController.clear();
        _userPhoneNumberController.clear();
      }
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
              const Text('Create your account',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
              const SizedBox(height: 20),
              CustomTextField(
                controller: _usernameController,
                labelText: 'Enter your name',
                keyboardType: TextInputType.text,
              ),
              CustomTextField(
                controller: _emailController,
                labelText: 'Email address',
                keyboardType: TextInputType.text,
              ),
              CustomTextField(
                controller: _passwordController,
                labelText: 'Password',
                obscureText: true,
                keyboardType: TextInputType.text,
              ),
              CustomTextField(
                controller: _confirmPasswordController,
                labelText: 'Confirm password',
                obscureText: true,
                keyboardType: TextInputType.text,
              ),
              CustomTextField(
                controller: _userAddressController,
                labelText: 'Address',
                keyboardType: TextInputType.text,
              ),
              CustomTextField(
                controller: _userPhoneNumberController,
                labelText: 'Phone Number',
                keyboardType: TextInputType.text,
              ),
              const SizedBox(height: 20),
              CustomButton(
                onPressed: _register,
                text: 'SIGN UP',
              ),
              TextButton(
                onPressed: () {
                  Get.back();
                },
                child: const Text('Already have an account? Log In'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

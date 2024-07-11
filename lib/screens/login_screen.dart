import 'package:deliverytrackingfluttgrapp/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'register_screen.dart';
import '../controllers/auth_controller.dart';
import '../widgets/custom_text_field.dart';

class LoginScreen extends StatelessWidget {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  final AuthController authController = Get.put(AuthController());

  LoginScreen({super.key});

  Future<void> _login() async {
    if (_formKey.currentState!.validate()) {
      final email = _emailController.text;
      final password = _passwordController.text;
      final result = await authController.login(email, password);
      if (result) {
        _emailController.clear();
        _passwordController.clear();
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
              const Text('Log into your account',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
              const SizedBox(height: 20),
              CustomTextField(
                controller: _emailController,
                labelText: 'Email address',
                keyboardType: TextInputType.text,
              ),
              CustomTextField(
                  controller: _passwordController,
                  labelText: 'Password',
                  keyboardType: TextInputType.text,
                  obscureText: true),
              const SizedBox(height: 20),
              CustomButton(
                text: 'LOG IN',
                onPressed: _login,
              ),
              TextButton(
                onPressed: () {
                  Get.to(() => RegisterScreen());
                },
                child: const Text('Don\'t have an account? Sign Up'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'controllers/auth_controller.dart'; // Adjust import path as necessary
import 'services/database_helper.dart';
import 'views/home_page.dart';
import 'views/login_page.dart';
import 'views/signup_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dbHelper.initDatabase(); // Initialize the database

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Delivery Tracking App',
      initialRoute: '/login', // Initial route
      getPages: [
        GetPage(name: '/login', page: () => LoginPage()),
        GetPage(name: '/signup', page: () => SignUpPage()),
        GetPage(name: '/home', page: () => HomePage()),
      ],
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: LoginPage(), // Optional: Use home instead of initialRoute if needed
      initialBinding: BindingsBuilder(() {
        Get.put(AuthController());
      }),
    );
  }
}

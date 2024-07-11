import 'package:deliverytrackingfluttgrapp/screens/edit_profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'screens/login_screen.dart';
import 'screens/main_screen.dart';
import 'screens/create_order_screen.dart';
import 'screens/order_history_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Delivery Tracking System',
      theme: ThemeData(
        // colorScheme: ColorScheme.fromSwatch().copyWith(
        //   primary: Colors.black,
        //   secondary: Colors.black,
        // ),
        scaffoldBackgroundColor: Colors.white,
        appBarTheme: const AppBarTheme(
            backgroundColor: Colors.black,
            iconTheme: IconThemeData(color: Colors.white),
            titleTextStyle: TextStyle(color: Colors.white)),
        // bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        //   backgroundColor: Colors.white,
        //   selectedItemColor: Colors.black,
        //   unselectedItemColor: Colors.grey,
        // ),
        // textTheme: const TextTheme(
        //   bodyLarge: TextStyle(color: Colors.black),
        //   bodyMedium: TextStyle(color: Colors.black),
        //   bodySmall: TextStyle(color: Colors.black),
        // ),
      ),
      initialRoute: '/',
      getPages: [
        GetPage(name: '/', page: () => LoginScreen()),
        GetPage(name: '/home', page: () => const MainScreen()),
        GetPage(name: '/edit_profile', page: () => const EditProfileScreen()),
        GetPage(name: '/create_order', page: () => CreateOrderScreen()),
        GetPage(name: '/order_history', page: () => OrderHistoryScreen()),
      ],
    );
  }
}

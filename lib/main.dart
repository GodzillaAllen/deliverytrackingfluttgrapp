import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'screens/login_screen.dart';
import 'screens/home_screen.dart';
import 'screens/profile_screen.dart';
import 'screens/register_screen.dart';
import 'screens/settings_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Delivery Tracking System',
      theme: ThemeData(
        brightness: Brightness.light,
        primaryColor: Colors.black, // Setting primary color to black
        hintColor: Colors.white, // Setting accent color to white
        scaffoldBackgroundColor:
            Colors.white, // Setting scaffold background color to white
        appBarTheme: const AppBarTheme(
          backgroundColor:
              Colors.black, // Setting app bar background color to black
          foregroundColor: Colors.white, // Setting app bar text color to white
        ),
      ),
      darkTheme: ThemeData(
        brightness: Brightness.dark,
        primaryColor:
            Colors.white, // Setting primary color to white in dark theme
        hintColor: Colors.black, // Setting accent color to black in dark theme
        scaffoldBackgroundColor: Colors
            .black, // Setting scaffold background color to black in dark theme
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors
              .white, // Setting app bar background color to white in dark theme
          foregroundColor:
              Colors.black, // Setting app bar text color to black in dark theme
        ),
      ),
      themeMode: ThemeMode.system, // Use system theme mode (light/dark)
      initialRoute: '/',
      getPages: [
        GetPage(name: '/', page: () => LoginScreen()),
        GetPage(name: '/register', page: () => RegisterScreen()),
        GetPage(name: '/home', page: () => const HomeScreen()),
        GetPage(name: '/profile', page: () => const ProfileScreen()),
        GetPage(name: '/settings', page: () => const SettingsScreen()),
      ],
    );
  }
}

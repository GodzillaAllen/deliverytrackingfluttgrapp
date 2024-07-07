import 'package:get/get.dart';
import 'views/login_page.dart';
import 'views/signup_page.dart';

class AppRoutes {
  static final routes = [
    GetPage(name: '/', page: () => LoginPage()),
    GetPage(name: '/signup', page: () => SignUpPage()),
  ];
}

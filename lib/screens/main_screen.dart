import 'package:deliverytrackingfluttgrapp/screens/explore_order_screen.dart';
import 'package:deliverytrackingfluttgrapp/screens/home_screen.dart';
import 'package:deliverytrackingfluttgrapp/screens/settings_screen.dart';
import 'package:flutter/material.dart';

import 'all_order_history_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  // final AuthController authController = Get.put(AuthController());
  int _selectedIndex = 0;

  static final List<Widget> _pages = <Widget>[
    const HomeScreen(),
    // CreateOrderScreen(),
    ExploreOrdersScreen(),
    AllOrderHistoryScreen(),

    // AcceptedOrdersByCourierScreen(),
    SettingsScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: const Text('Delivery Tracking App'),
      //   actions: [
      //     IconButton(
      //       icon: const Icon(Icons.notifications),
      //       onPressed: () {},
      //     ),
      //   ],
      // ),
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white,
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.grey,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          // BottomNavigationBarItem(
          //   icon: Icon(Icons.add),
          //   label: 'Create Order',
          // ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Explore Orders',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.history),
            label: 'Order History',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Setting',
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}

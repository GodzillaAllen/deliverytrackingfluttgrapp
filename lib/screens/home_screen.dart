import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/auth_controller.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final AuthController authController = Get.find();

  int _selectedIndex = 0; // Index of the selected tab

  void _onItemTapped(int index) {
    // Handle bottom navigation item tap
    setState(() {
      _selectedIndex = index;
    });

    switch (_selectedIndex) {
      case 0:
        // Handle navigation or state change for the first tab (Home)
        break;
      case 1:
        // Handle navigation or state change for the second tab (Dashboard)
        break;
      case 2:
        // Handle navigation or state change for the third tab (Profile)
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () {
              authController.logout();
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            _buildSearchBox(),
            const SizedBox(height: 20),
            Expanded(
              child: _buildCardList(),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.dashboard),
            label: 'Dashboard',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.black, // Color of selected item
        onTap: _onItemTapped,
      ),
    );
  }

  Widget _buildSearchBox() {
    return TextField(
      decoration: const InputDecoration(
        labelText: 'Search',
        prefixIcon: Icon(Icons.search),
        border: OutlineInputBorder(),
      ),
      onChanged: (value) {
        // Implement search functionality here
      },
    );
  }

  Widget _buildCardList() {
    // Example list of cards (replace with your data model)
    List<String> items = ['Item 1', 'Item 2', 'Item 3'];

    return ListView.builder(
      itemCount: items.length,
      itemBuilder: (context, index) {
        return Card(
          margin: const EdgeInsets.symmetric(vertical: 10),
          child: ListTile(
            title: Text(items[index]),
            subtitle: Text('Description of ${items[index]}'),
            onTap: () {
              // Handle tapping on a card
            },
          ),
        );
      },
    );
  }
}

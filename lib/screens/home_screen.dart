import 'package:flutter/material.dart';
import 'package:technical_test/screens/list_user_screen.dart';
import 'create_user_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: (_selectedIndex == 0) ? const ListUserScreen() : CreateUserScreen(),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.people_rounded),
            label: 'Daftar User',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_add_rounded),
            label: 'Tambah User',
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}

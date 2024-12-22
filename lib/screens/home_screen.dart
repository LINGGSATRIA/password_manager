import 'package:flutter/material.dart';
import 'password_screen.dart';
import 'profile_screen.dart';

class HomeScreen extends StatefulWidget {
  final int userId;

const HomeScreen({required this.userId, super.key});

  @override
  HomeScreenState createState() => HomeScreenState();
}

class HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0; 

  final List<Widget> _pages = [];

  @override
  void initState() {
    super.initState();
    //Initialize pages with userId
    _pages.addAll([
      PasswordScreen(userId: widget.userId),
      ProfileScreen(userId: widget.userId.toString()),
    ]);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex, 
        onTap: (index) {
          setState (() {
            _currentIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.lock),
            label: 'Passwords',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}

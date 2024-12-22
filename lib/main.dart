import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/login_screen.dart';
import 'screens/password_screen.dart';
import 'screens/profile_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Password Manager',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: HomeScreen(userId: 0),
    );
  }
}

class HomeScreen extends StatefulWidget {
  final int userId; // Tambahkan parameter userId

  const HomeScreen({super.key, required this.userId});

  @override
  HomeScreenState createState() => HomeScreenState();
}

class HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  // Daftar screen yang ada pada BottomNavigationBar
  final List<Widget> _screens = [
    HomeScreen(userId: 0),
    LoginScreen(userId: 0),
    PasswordScreen(userId: 0), // Gunakan nilai default
    ProfileScreen(userId: 'defaultUser'), // Berikan nilai string default
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Password Manager')),
      body: _screens[_selectedIndex], // Menampilkan screen sesuai index
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.login), label: 'Login'),
          BottomNavigationBarItem(icon: Icon(Icons.lock), label: 'Password'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped, // Fungsi untuk mengganti screen
      ),
    );
  }
}

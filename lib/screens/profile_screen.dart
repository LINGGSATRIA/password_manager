import 'package:flutter/material.dart';
import 'login_screen.dart';

class ProfileScreen extends StatelessWidget {
  final String userId; // Pastikan userId ini dari tipe String

 const ProfileScreen({required , super.key, required this.userId});

  Future<Map<String, dynamic>> _fetchUserData() async {
    final db = await DBHelper().database;
    final results = await db.query(
      'users',
      where: 'id = ?',
      whereArgs: [userId],
    );
    return results.isNotEmpty ? results.first : {};
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Map<String, dynamic>>(
      future: _fetchUserData(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        }
        if (!snapshot.hasData || snapshot.data!.isEmpty) {
          return Center(child: Text('User data not found.'));
        }

        final userData = snapshot.data!;
        return Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Profile',
                style: Theme.of(context).textTheme.headlineLarge,
              ),
              SizedBox(height: 20),
              Text('Username: ${userData['username']}'),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  // Clear the stack and navigate to the Login screen
                  Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(builder: (context) => LoginScreen(userId: 0,)),
                    (route) => false, // Remove all previous routes
                  );
                },
                child: Text('Logout'),
              ),
            ],
          ),
        );
      },
    );
  }
}

class DBHelper {
  get database => null;
}

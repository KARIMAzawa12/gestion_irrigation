import 'package:flutter/material.dart';
import 'package:lepfe/view/screen/mainPages/user.dart';
 import 'MessagePage.dart';

class ProfilePagee extends StatelessWidget {
  final Userr user; // Assuming User is a class representing user information

  ProfilePagee({required this.user});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile'),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 24),
            CircleAvatar(
              radius: 60,
              backgroundImage: AssetImage(user.imagePath),
            ),
            SizedBox(height: 16),
            Text(
              user.name,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
            ),
            SizedBox(height: 8),
            Text(
              user.email,
              style: TextStyle(color: Colors.grey),
            ),
            SizedBox(height: 24),
            Divider(thickness: 1, height: 20),
            SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Text(
                user.about,
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 16),
              ),
            ),
            SizedBox(height: 24),
            ElevatedButton(
              onPressed: () {
                // Navigate to message page
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => MessagePage()),
                );
              },
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.white, backgroundColor: Colors.blue[200],
                padding: EdgeInsets.symmetric(horizontal: 32, vertical: 12),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(24),
                ),
              ),
              child: Text('Contacter'),
            ),
            SizedBox(height: 24),
          ],
        ),
      ),
    );
  }
}

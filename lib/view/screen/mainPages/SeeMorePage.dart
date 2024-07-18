import 'package:flutter/material.dart';

import 'home_screen.dart';


class SeeMorePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('See More'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
           GestureDetector(
               onTap: () {
                // Naviguer vers la page de demande de conseils
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => HomeScreen()),
                );
              },
              child: CircleAvatar(
                radius: 50,
                backgroundImage: AssetImage('assets/images/conseiller.png'), // Ajoutez l'image de l'icône de personne ici
              ),
            ),
            SizedBox(height: 20), // Espace entre l'image et la description
            Text(
              'Cliquez pour demander des conseils',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}


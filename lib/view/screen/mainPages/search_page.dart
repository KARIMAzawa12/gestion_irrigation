import 'package:flutter/material.dart';
import 'package:lepfe/view/screen/mainPages/home_screen.dart';
import 'package:lepfe/view/screen/mainPages/profile_page.dart';
import 'package:lepfe/view/screen/mainPages/user.dart';

import 'OldDiscussionsPage.dart';

class SearchPage extends StatefulWidget {
  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  TextEditingController _searchController = TextEditingController();
  List<Userr> users = [
    Userr(
        name: 'Ali alami',
        email: 'Ali@1998.com',
        imagePath: 'assets/xx.png',
        about:
        'Ali Alami est un conseiller agricole chevronné avec plus de 10 ans d\'expérience en gestion des cultures et santé des sols. Il excelle dans les pratiques agricoles durables et propose des solutions sur mesure pour améliorer la productivité des exploitations agricoles. Ali est titulaire d\'un Master en Sciences Agricoles de l\'Université d\'Agriculture et se consacre à la promotion de la gestion environnementale par des techniques innovantes.',
        isDarkMode: true),
    Userr(
        name: 'Ahmed Azdoud',
        email: 'Ahmed@aaa.com',
        imagePath: 'assets/mechil.jpg',
        about:
        'Ahmed Azdoud est un expert en intégration de technologies agricoles et en agriculture de précision avec 8 ans d\'expérience dans l\'industrie. Il se spécialise dans l\'optimisation des opérations agricoles grâce à des outils de pointe et des méthodes durables. Ahmed est titulaire d\'une Licence en Agronomie de l\'Université d\'Agronomie et est passionné par l\'avancement des pratiques agricoles modernes.',
        isDarkMode: true),
    Userr(
        name: 'Karim Omari',
        email: 'karem@2002.com',
        imagePath: 'assets/wlyam.jpg',
        about:
        'Karim Omari apporte 12 ans d\'expertise en planification des exploitations, rotation des cultures et lutte antiparasitaire. Il s\'engage à améliorer la santé des sols et l\'efficacité des exploitations grâce à des services de conseil complets. Karim est titulaire d\'un Master en Science des Sols de l\'Université d\'Agriculture et est reconnu pour ses séances de formation et ateliers efficaces destinés aux agriculteurs.',
        isDarkMode: true),
  ]; // Example data
  List<Userr> filteredUsers = [];
  bool showSuggestions = false;

  @override
  void initState() {
    super.initState();
    _searchController.addListener(() {
      filterUsers();
    });
  }

  void filterUsers() {
    List<Userr> temp = [];
    temp.addAll(users);
    if (_searchController.text.isNotEmpty) {
      temp.retainWhere((user) =>
          user.name.toLowerCase().contains(_searchController.text.toLowerCase()));
    }
    setState(() {
      filteredUsers = temp;
      showSuggestions = _searchController.text.isEmpty; // Show suggestions when search bar is empty
    });
  }

  void navigateToOldDiscussions() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => HomeScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Search Users'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(10),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                child: TextField(
                  controller: _searchController,
                  decoration: InputDecoration(
                    hintText: 'Search',
                    border: InputBorder.none,
                    prefixIcon: Icon(Icons.search, color: Colors.grey),
                  ),
                  onChanged: (value) {
                    setState(() {
                      showSuggestions = value.isEmpty; // Show suggestions based on search bar text
                    });
                  },
                ),
              ),
            ),
          ),
          Visibility(
            visible: showSuggestions,
            child: SizedBox(
              height: 160,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: users.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        CircleAvatar(
                          radius: 30,
                          backgroundImage: AssetImage(users[index].imagePath),
                        ),
                        SizedBox(height: 4),
                        Text(users[index].name),
                      ],
                    ),
                  );
                },
              ),
            ),
          ),
          SizedBox(height: 16),
          Expanded(
            child: ListView.builder(
              itemCount: filteredUsers.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(filteredUsers[index].name),
                  onTap: () {
                    // Navigate to profile page with user information
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              ProfilePagee(user: filteredUsers[index])),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: navigateToOldDiscussions,
        child: Icon(Icons.chat),
        tooltip: 'View Old Discussions',
      ),
    );
  }
}



import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:lepfe/view/screen/mainPages/home.dart';
import 'package:lepfe/view/screen/mainPages/home_view.dart';
import 'package:page_transition/page_transition.dart';

import '../../main.dart';
import 'mainPages/SeeMorePage.dart';
import 'mainPages/cart_page.dart';
import 'mainPages/ChatScreen.dart';
import 'mainPages/chat_screen.dart';
import 'mainPages/favorite_page.dart';
import 'mainPages/home_page.dart';
import 'mainPages/home_screen.dart';
import 'mainPages/profile_page.dart';
import 'mainPages/scan_page.dart';
import 'mainPages/notification_page.dart';
import 'mainPages/search_page.dart';
import 'mainPages/user.dart'; // Importez la page de notification

class RootPage extends StatefulWidget {
  const RootPage({Key? key}) : super(key: key);

  @override
  State<RootPage> createState() => _RootPageState();
}

class _RootPageState extends State<RootPage> {
  int _bottomNavIndex = 0;

  final List<Widget> pages = [
    HomeView(),
    HomePage1(),
    CartPage(),
    HomePage(),
  ];

  final List<IconData> iconList = [
    Icons.home,
    Icons.article,
    Icons.eco,
    Icons.agriculture,
  ];

  final List<String> titleList = [
    '',
    '',
    'Jardin',
    'Plantes',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          titleList[_bottomNavIndex],
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.w500,
            fontSize: 24,
          ),
        ),
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        elevation: 0.0,
        // Add the hamburger icon to open the drawer
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              icon: const Icon(Icons.menu),
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
              tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
            );
          },
        ),
        actions: [ // Ajoutez cette ligne pour définir les actions desca l'AppBar

        ],
      ),
      body: IndexedStack(
        index: _bottomNavIndex,
        children: pages,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            PageTransition(
              child: CameraView(),
              type: PageTransitionType.bottomToTop,
            ),
          );
        },
        child: Image.asset(
          'assets/images/code-scan.png',
          height: 40.0,
        ),
        backgroundColor: Colors.white,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: AnimatedBottomNavigationBar(
        splashColor: Colors.blue[200],
        activeColor: Colors.blue[200],
        inactiveColor: Colors.black.withOpacity(.5),
        icons: iconList,
        activeIndex: _bottomNavIndex,
        gapLocation: GapLocation.center,
        notchSmoothness: NotchSmoothness.softEdge,
        onTap: (index) {
          setState(() {
            _bottomNavIndex = index;
          });
        },
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue[200],
              ),
              child: Text(
                'Menu',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
            ListTile(
              leading: Image.asset(
                'assets/images/conseiller.png', // Add the path to your image asset
                width: 40, // Adjust width as needed
                height: 40, // Adjust height as needed
              ),
              title: Text('Demander Conseiller'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) =>  SearchPage(), // Assuming ChatScreenn is your screen for consulting an advisor
                ));
              },
            ),


            ListTile(
              leading: Image.asset(
                'assets/images/artificial-intelligence.png', // Add the path to your image asset
                width: 40, // Adjust width as needed
                height: 40, // Adjust height as needed
              ),
              title: Text('AI Chat-Boot'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => MyHomePage()), // Assuming ChatScreenn is your screen for consulting an advisor
                );
              },
            ),

          ],
        ),
      ),
    );
  }
}




import 'package:ada_app_flutter/view/chat_screen.dart';
import 'package:flutter/material.dart';

import 'contacts_screen.dart';
import 'menu_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int currentPageIndex = 0;

  Color navBarBackground = const Color(0xFFE88C38);
  Color navBarIndicator = const Color(0xFF3F80EA);

  @override
  Widget build(BuildContext context) {
    const navBarIcon = Color(0xFFFFFFFF);
    // const navBarIconEmergency = Color(0xFFFF0000);

    const List<Widget> pages = [
      Menu(),
      ChatScreen(isEmergency: true),
      Contacts()
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Welcome to ADA'),
        automaticallyImplyLeading: false,
        foregroundColor: const Color(0xFFFFFFFF),
        backgroundColor: const Color(0xFFE88C38),
        actions: [
          IconButton(
              onPressed: () {}, icon: const Icon(Icons.notifications_outlined)),
          IconButton(
              onPressed: () {}, icon: const Icon(Icons.settings_outlined))
        ],
      ),
      body: pages[currentPageIndex],
      
      bottomNavigationBar: NavigationBar(
        onDestinationSelected: (int index) {
          setState(() {
            currentPageIndex = index;
          });
        },
        backgroundColor: navBarBackground,
        indicatorColor: navBarIndicator,
        selectedIndex: currentPageIndex,
        destinations: const <Widget>[
          NavigationDestination(
            icon: Icon(
              Icons.menu,
              color: navBarIcon,
            ),
            label: 'Main Menu',
          ),
          NavigationDestination(
            icon: Icon(
              Icons.info,
              color: navBarIcon,
            ),
            label: 'Emergency Mode',
          ),
          NavigationDestination(
            icon: Icon(
              Icons.person,
              color: navBarIcon,
            ),
            label: 'Contacts',
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../widgets/clickable_card_home.dart';
import '../widgets/notice_card.dart';
import '../widgets/preparation_card_home.dart';
import '../widgets/title_card_home.dart';
import 'quiz_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int currentPageIndex = 0;

  Color emergencyKitColor = const Color(0xFFF1B505);
  Color mapsColor = const Color(0xFF3F80EA);

  Color navBarBackground = const Color(0xFFE88C38);
  Color navBarIndicator = const Color(0xFF3F80EA);


  @override
  Widget build(BuildContext context) {
    
    const navBarIcon = Color(0xFFFFFFFF);
    // const navBarIconEmergency = Color(0xFFFF0000);
    
    return Scaffold(
      appBar: AppBar(
        title: const Text('Welcome to ADA'),
        automaticallyImplyLeading: false,
        foregroundColor: const Color(0xFFFFFFFF),
        backgroundColor: const Color(0xFFE88C38),
        actions: [
          IconButton(onPressed: (){}, icon: const Icon(Icons.notifications_outlined)),
          IconButton(onPressed: (){}, icon: const Icon(Icons.settings_outlined))
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            
            PreparationCardHome(
              onTapPreparation: (){Navigator.pushNamed(context, '/preparation');},

              onTapIntroduction: (){print('Test tap Emergency Introduction');},
              onTapPlanning: (){print('Test tap Emergency Planning');},
              onTapSimulate: (){print('Test tap Emergency Simulate');},
            ),

            ClickableCardHome(
              color: mapsColor,
              titleCard: 'Quiz', 
              image: 'lib/images/SurviveKit.png', 
              description: 'Use Gemini IA to personalize your emergency kit according to the emergency situation',
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => QuizScreen()),
              ),
            ),

            ClickableCardHome(
              color: emergencyKitColor,
              titleCard: 'Emergency Kit', 
              image: 'lib/images/SurviveKit.png', 
              description: 'Use Gemini IA to personalize your emergency kit according to the emergency situation',
              onTap: () => {Navigator.pushNamed(context, '/emergency-kit')},
            ),

            ClickableCardHome(
              color: mapsColor,
              titleCard: 'Shelter', 
              image: 'lib/images/image_maps.jpg', 
              description: 'Look for shelters nearby and define escape routes',
              onTap: (){print('Test tap Map');},
            ),

            ClickableCardHome(
              color: Colors.green,
              titleCard: 'Alerts', 
              image: 'lib/images/warning.png', 
              description: 'Look for shelters nearby and define escape routes',
              onTap: () => {Navigator.pushNamed(context, '/alerts')},
            ),

            Column(
              children: [
                const TitleCardHome(title: 'Updated News'),
                NoticeCard(
                  title: 'Earthquake on Japan',
                  description: 'Cracked street after earthquake .ADA were used to spare alerts to the population to avoid the most affected areas and roads',
                  image: 'lib/images/ex_notice1.png',
                  time: 'Today - 23min',
                  onTap: (){print('Test tap Notice 1');},
                ),
            
                NoticeCard(
                  title: 'Floods in Brazil, in Rio Grande do Sul State ',
                  description: 'Description duis aute irure dolor in reprehenderit in voluptate velit.',
                  image: 'lib/images/ex_notice2.png',
                  time: 'Today - 23min',
                  onTap: (){print('Test tap Notice 2');},
                )
            
              ],
            ),
          ],
        ),
      ),
      bottomNavigationBar: NavigationBar(
        onDestinationSelected: (int index) {
          setState(() {
            currentPageIndex = index;
          });
        },

        backgroundColor: navBarBackground,
        indicatorColor:navBarIndicator,
        selectedIndex: currentPageIndex,
        
        destinations: const <Widget>[
          NavigationDestination(
            icon: Icon(Icons.menu, color: navBarIcon,),
            label: 'Main Menu',
          ),
          NavigationDestination(
            icon: Icon(Icons.info, color: navBarIcon,),
            label: 'Emergency Mode',
          ),
          NavigationDestination(
            icon: Icon(Icons.person, color: navBarIcon,),
            label: 'Contacts',
          ),
        ],
      ),
    );
  }
}

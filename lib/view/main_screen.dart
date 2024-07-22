import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import 'kit_screen.dart';
import 'quiz_screen.dart';
import 'shelter_map_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int currentPageIndex = 0;

  @override
  Widget build(BuildContext context) {
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
            Container(
              padding: const EdgeInsets.all(15),
              child: Column(
                children: [
                  const Row(children: [
                    Text('Preparation'),
                    Icon(Icons.arrow_forward),
                  ]),
                  // CarouselSlider(
                  //   options: CarouselOptions(height: 100.0),
                  //   items: ['Introduction', 'Planning', 'Simulate'].map((i) {
                  //     return Builder(
                  //       builder: (BuildContext context) {
                  //         return Container(
                  //             width: MediaQuery.of(context).size.width,
                  //             margin:
                  //                 const EdgeInsets.symmetric(horizontal: 5.0),
                  //             // decoration: const BoxDecoration(
                  //             //   color: Colors.amber
                  //             // ),
                  //             child: Column(
                  //               children: [
                  //                 ClipRRect(
                  //                   borderRadius: BorderRadius.circular(300.0),
                  //                   child: Image.asset('lib/images/introduction.png'),
                  //                 ),
                  //                 const Text('Instroduction'),
                  //               ],
                  //             )
                  //           );
                  //       },
                  //     );
                  //   }).toList(),
                  // ),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    margin:
                        const EdgeInsets.symmetric(horizontal: 5.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Column(
                          children: [
                            ClipRRect(
                              // borderRadius: BorderRadius.circular(300.0),
                              child: Image.asset('lib/images/introduction.png'), 
                            ),
                            const Text('Introduction'),
                          ],
                        ),
                        Column(
                          children: [
                            ClipRRect(
                              // borderRadius: BorderRadius.circular(300.0),
                              child: Image.asset('lib/images/planning.png'),
                            ),
                            const Text('Planning'),
                          ],
                        ),
                        Column(
                          children: [
                            ClipRRect(
                              // borderRadius: BorderRadius.circular(300.0),
                              child: Image.asset('lib/images/simulate.png'),
                            ),
                            const Text('Simulate'),
                          ],
                        ),
                      ],
                    )
                  )
                ],
              ),
            ),
            GestureDetector(
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => QuizScreen()),
              ),
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: 100,
                color: const Color(0xFF3F80EA),
                child: const Text('Quiz'),
              ),
            ),
            GestureDetector(
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => KitScreen()),
              ),
              child: Container(
                width: MediaQuery.of(context).size.width,
                padding: const EdgeInsets.all(5),
                color: const Color(0xFFF1B505),
                child: Column(
                  children: [
                    const Row(children: [
                      Text('Emergency Kit'),
                      Icon(Icons.arrow_forward),
                    ]),
                    const SizedBox(
                      height: 10,
                    ),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Image.asset(
                        'lib/images/SurviveKit.png',
                      ),
                    ),
                    const SizedBox(
                      height:  10,
                    ),
                    const Text(
                      'Use Gemini IA to personalize your emergency kit according to the emergency situation',
                    )
                  ],
                ),
              ),
            ),
            GestureDetector(
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const ShelterMapScreen()),
              ),
              child: Container(
                width: MediaQuery.of(context).size.width,
                color: const Color(0xFF3F80EA),
                padding: const EdgeInsets.all(15),
                child: Column(
                  children: [
                    const Row(children: [
                      Text('Shelter'),
                      Icon(Icons.arrow_forward),
                    ]),
                    const SizedBox(
                      height: 10,
                    ),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Image.asset(
                        'lib/images/image_maps.jpg',
                        width: double.infinity,
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const Text(
                      'Look for shelters nearby and define escape routes',
                    )
                  ],
                ),
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              height: 100,
              child: const Text('Update news'),
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
        backgroundColor: const Color(0xFFE88C38),
        indicatorColor:const Color(0xFF3F80EA),
        selectedIndex: currentPageIndex,
        destinations: const <Widget>[
          NavigationDestination(
            icon: Icon(Icons.menu, color: Color(0xFFFFFFFF),),
            label: 'Main Menu',
          ),
          NavigationDestination(
            icon: Icon(Icons.info, color: Color(0xFFFFFFFF),),
            label: 'Emergency Mode',
          ),
          NavigationDestination(
            icon: Icon(Icons.person, color: Color(0xFFFFFFFF)),
            label: 'Contacts',
          ),
        ],
      ),
    );
  }
}

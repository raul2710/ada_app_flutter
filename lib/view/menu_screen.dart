import 'package:flutter/material.dart';

import '../widgets/clickable_card_home.dart';
import '../widgets/notice_card.dart';
import '../widgets/preparation_card_home.dart';
import '../widgets/title_card_home.dart';

class Menu extends StatefulWidget {
  const Menu({super.key});

  @override
  State<Menu> createState() => _MenuState();
}

class _MenuState extends State<Menu> {

  Color mapsColor = const Color(0xFF3F80EA);
  Color emergencyKitColor = const Color(0xFFF1B505);
  Color quizColor = const Color(0xFFE88C38);
  Color chatColor = const Color(0xFF009918);
  Color alertColor = const Color(0xFF555555);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            PreparationCardHome(
              onTapPreparation: () {
                Navigator.pushNamed(context, '/preparation');
              },
              onTapIntroduction: () {
                print('Test tap Emergency Introduction');
              },
              onTapPlanning: () {
                print('Test tap Emergency Planning');
              },
              onTapSimulate: () {
                print('Test tap Emergency Simulate');
              },
            ),
            ClickableCardHome(
              color: quizColor,
              titleCard: 'Quiz',
              image: 'lib/images/quiz_image.png',
              description:
                  'Test your knowledge about how to deal with a disaster situation',
              onTap: () => {Navigator.pushNamed(context, '/quiz')},
            ),
            ClickableCardHome(
              color: emergencyKitColor,
              titleCard: 'Emergency Kit',
              image: 'lib/images/SurviveKit.png',
              description:
                  'Learn more about important items to include in your emergency kit ',
              onTap: () => {Navigator.pushNamed(context, '/emergency-kit')},
            ),
            ClickableCardHome(
              color: chatColor,
              titleCard: 'Chat',
              image: 'lib/images/chat_image.png',
              description: "Use the Gemini IA chat for ask anything about natural disasters",
              onTap: () => {Navigator.pushNamed(context, '/chat')},
            ),
            ClickableCardHome(
              color: alertColor,
              titleCard: 'Alerts',
              image: 'lib/images/alerts_image.png',
              description: 'The most importants disasters alerts around you',
              onTap: () => {Navigator.pushNamed(context, '/alerts')},
            ),
            Column(
              children: [
                const TitleCardHome(title: 'Updated News', isWhite: false,),
                NoticeCard(
                  title: 'Floods in Brazil, in Rio Grande do Sul State ',
                  description:
                      'Cracked street after earthquake .ADA were used to spare alerts to the population to avoid the most affected areas and roads',
                  image: 'lib/images/ex_notice1.png',
                  time: 'Today - 23min',
                  onTap: () {
                    print('Test tap Notice 1');
                  },
                ),
                NoticeCard(
                  title: 'Earthquake on Japan',
                  description:
                      'Description duis aute irure dolor in reprehenderit in voluptate velit.',
                  image: 'lib/images/ex_notice2.png',
                  time: 'Today - 23min',
                  onTap: () {
                    print('Test tap Notice 2');
                  },
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
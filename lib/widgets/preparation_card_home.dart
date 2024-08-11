import 'package:flutter/material.dart';

import 'preparation_options.dart';
import 'title_card_home.dart';

class PreparationCardHome extends StatelessWidget {
  const PreparationCardHome({
    super.key, 
    required this.onTapPreparation, 
    required this.onTapIntroduction, 
    required this.onTapPlanning, 
    required this.onTapSimulate
  });

  final VoidCallback onTapPreparation;
  final VoidCallback onTapIntroduction;
  final VoidCallback onTapPlanning;
  final VoidCallback onTapSimulate;

  @override
  Widget build(BuildContext context) {
    return InkWell(
                onTap: onTapPreparation,
                child: 
            Container(
              padding: const EdgeInsets.all(15),
              child: 
                  Column(
                    children: [
                  
                      const TitleCardHome(title: 'Preparation', isWhite: false,),
                  
                      Container(
                        width: MediaQuery.of(context).size.width,
                        margin: const EdgeInsets.symmetric(horizontal: 5.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            PreparationOptions(
                              image: 'lib/images/introduction.png',
                              title: 'Introduction',
                              onTap: onTapIntroduction,
                            ),
                            PreparationOptions(
                              image: 'lib/images/planning.png',
                              title: 'Planning',
                              onTap: onTapPlanning,
                            ),
                            PreparationOptions(
                              image: 'lib/images/simulate.png',
                              title: 'Simulate',
                              onTap: onTapSimulate,
                            ),
                          ],
                        )
                      )
                    ],
                  ),
                
              ),
            );
  }
}
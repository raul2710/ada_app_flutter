import 'package:flutter/material.dart';

import '../widgets/emergency_card_kit.dart';

class EmergencyKit extends StatelessWidget {
  const EmergencyKit({super.key});
  

  @override
  Widget build(BuildContext context) {
    
    Color emergencyKitColor = const Color(0xFFF1B505);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Emergency Kits'),
        backgroundColor:emergencyKitColor,
      ),
      body: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          SizedBox(height: 25),
          Text('Hello Dear User! '),
          SizedBox(height: 25),
          Text("An emergency kit is essential to ensure your safety and well-being in the event of natural disasters. It should be light, practical and contain items that can meet your basic needs for a few days."),

          SizedBox(height: 50),

          EmergencyCardKit(
            image: 'lib/images/water.png',
            title: '1 - WATER',
            description: 'At least 4 liters per person per day. Opt for water bottles or portable water purifiers.',
          ),
          
          SizedBox(height: 25),
          
          EmergencyCardKit(
            image: 'lib/images/ceral_bars.png',
            title: '2- FOOD',
            description: 'Non-perishable foods, such as cereal bars, dried fruits, cookies, cans of tuna or sardines, and energy foods.',
          ),
          
          SizedBox(height: 25),
          
          EmergencyCardKit(
            image: 'lib/images/emergency_kit.png',
            title: '3-FIRST AID KIT',
            description: "Include bandages, gauze, antiseptic, painkillers, personal medications (with a doctor's prescription), thermometer, scissors and disposable gloves.",
          ),
        ],
      ),
    );
  }
}

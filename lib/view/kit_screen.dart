import 'package:flutter/material.dart';

class KitScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Emergency Kits')),
      body: ListView(
        children: [
          ListTile(
            title: Text('Earthquake Kit'),
            subtitle:
                Text('Recommended items: Water, non-perishable food, ...'),
          ),
          ListTile(
            title: Text('Flood Kit'),
            subtitle:
                Text('Recommended items: Water, non-perishable food, ...'),
          ),
          // Adicione outros kits aqui
        ],
      ),
    );
  }
}

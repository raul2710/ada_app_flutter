import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:universal_platform/universal_platform.dart';

class ShelterMapScreen extends StatelessWidget {
  const ShelterMapScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Shelters')),
      body: UniversalPlatform.isWindows
          ? const Center(
              child: Text(
                'The map functionality is not available on Windows.',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 18),
              ),
            )
          : const GoogleMap(
              initialCameraPosition: CameraPosition(
                target: LatLng(-23.5505, -46.6333), // São Paulo, por exemplo
                zoom: 12,
              ),
              markers: {
                // Adicione marcadores de abrigos aqui
              },
            ),
    );
  }
}

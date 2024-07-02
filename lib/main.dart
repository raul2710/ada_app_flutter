import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';

// void main() {
//   runApp(const MainApp());
// }

// class MainApp extends StatelessWidget {
//   const MainApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return const MaterialApp(
//       home: Scaffold(
//         body: Center(
//           child: Text('Hello World!'),
//         ),
//       ),
//     );
//   }
// }

void main()
{
  runApp(
    DevicePreview(
      enabled: true,
      builder: (context) => MainApp()
      ),
  );
}

//
// MainApp
//
class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Navegação',
      //
      //ROTAS DE NAVEGAÇÃO
      //
      initialRoute: 'screenLogin',
      routes: {
        // 'screenLogin' :(context) => ScreenLogin(listUsers:listUsers),
        // 'screenSubscribe' :(context) => ScreenSubscribe(),
        // 'screenListTravels' :(context) => ScreenListTravels(),
        // 'screenModifyItem' :(context) => ScreenModifyItem(),
        // 'screenAddTrip' :(context) => ScreenAddTrip(),
        // 'screenViewTrip' :(context) => ScreenViewTrip(),
        // 'screenSearchTrip' :(context) => ScreenSearchTrip(),
        // 'screenListCategory' :(context) => ScreenListCategory(),
        // 'screenSearchTripCategory' :(context) => ScreenSearchTripCategory(),
        // 'screenAbout' :(context) => ScreenAbout(),
      }
    );
  }
}
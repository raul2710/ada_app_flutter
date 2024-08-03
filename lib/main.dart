import 'package:device_preview/device_preview.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'firebase_options.dart';
import 'view/alerts_screen.dart';
import 'view/emergency_kit_screen.dart';
import 'view/first_steps_screen.dart';
import 'view/login_options_screen.dart';
import 'view/login_with_email_and_password_screen.dart';
import 'view/main_screen.dart';
import 'view/preparation_screen.dart';
import 'view/subscribe_email_password.dart';
import 'view/subscribe_screen.dart';
import 'view/verify_screen.dart';

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

// import 'package:firebase_core/firebase_core.dart';
// import 'firebase_options.dart';

// // ...

// await Firebase.initializeApp(
//     options: DefaultFirebaseOptions.currentPlatform,
// );
const clientId = '830251467767-otheok9k6qetdqnh9m7i08jjplsl92nm.apps.googleusercontent.com';

main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  
  runApp(
    DevicePreview(
      enabled: true,
      builder: (context) => const MainApp()
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
      initialRoute: '/login',
      routes: {
        '/login' :(context) => const LoginOptions(),
        '/preparation' :(context) => const Preparation(),
        '/subscribe' :(context) => const SubscribeScreen(),
        '/first-steps' :(context) => const FirstStepsScreen(),
        '/main' :(context) => const MainScreen(),
        '/verify' :(context) => const VerifyScreen(),
        '/loginwithemailandpassword' :(context) => const LoginWithEmailAndPasswordScreen(),
        '/subscribe-email-password' :(context) => const SubscribeEmailPasswordScreen(),
        '/emergency-kit' :(context) => const EmergencyKit(),
        '/alerts' :(context) => const AlertsScreen(),
        
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
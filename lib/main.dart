import 'package:device_preview/device_preview.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import '../view/chat_screen.dart';

import 'firebase_options.dart';
import 'view/alerts_screen.dart';
import 'view/emergency_kit_screen.dart';
import 'view/first_steps_screen.dart';
import 'view/login_options_screen.dart';
import 'view/login_with_email_and_password_screen.dart';
import 'view/main_screen.dart';
import 'view/preparation_screen.dart';
import 'view/quiz_screen.dart';
import 'view/subscribe_email_password.dart';
import 'view/subscribe_screen.dart';

main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(
    DevicePreview(enabled: true, builder: (context) => const MainApp()),
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
          '/login': (context) => const LoginOptions(),
          '/preparation': (context) => const Preparation(),
          '/subscribe': (context) => const SubscribeScreen(),
          '/first-steps': (context) => const FirstStepsScreen(),
          '/main': (context) => const MainScreen(),
          '/loginwithemailandpassword': (context) =>
              const LoginWithEmailAndPasswordScreen(),
          '/subscribe-email-password': (context) =>
              const SubscribeEmailPasswordScreen(),
          '/emergency-kit': (context) => const EmergencyKit(),
          '/alerts': (context) => const AlertsScreen(),
          '/chat': (context) => const ChatScreen(),
          '/quiz': (context) => QuizScreen(),
        });
  }
}

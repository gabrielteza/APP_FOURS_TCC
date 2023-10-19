import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:login_register/pages/Resgister_page.dart';
import 'package:login_register/pages/auth.dart';
import 'package:login_register/pages/chat_screen.dart';
import 'package:login_register/pages/home_page.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      home: CalculadoraPage(),
      /*initialRoute: '/auth',
      routes: {
        '/auth': (context) => AuthPage(),
        '/': (context) => EnterRoomScreen(),
       '/chat': (context) =>  ChatScreen(),
      },*/
);
  }
}

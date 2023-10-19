import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:login_register/pages/Resgister_page.dart';
import 'package:login_register/pages/fist_page.dart';
import 'package:login_register/pages/home_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Auth {

  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<void> registerWithEmailAndPassword(
      String email, String password) async {
    final user = await _auth.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );
        final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('email', email);
    print("################################### $email");
  }

  Future<UserCredential> signInWithEmailAndPassword(String email, String password) async {
    final user = await _auth.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
    //salva o usario na mememoria do celular - shared preferences
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('email', email);
    print("################################### $email");
    return user;
  }
}

class AuthPage extends StatelessWidget {
  const AuthPage({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: null,
        builder: (context, snapshot) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Firebase Auth',
            theme: ThemeData(
              primarySwatch: Colors.blue,
            ),
            home: StreamBuilder<User?>(
              stream: FirebaseAuth.instance.authStateChanges(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return FirstPage();
                } else {
                  return RegisterPage();
                }
              },
            ),
          );
        });
  }
}

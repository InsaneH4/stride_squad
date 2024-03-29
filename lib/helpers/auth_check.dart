import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../screens/login.dart';
import '/main.dart';

class AuthPage extends StatefulWidget {
  final String title;

  const AuthPage({super.key, required this.title});

  @override
  State<StatefulWidget> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          //if user is logged in, show main page
          if (snapshot.hasData) {
            return const MainPage(title: "Stride Squad");
          }
          //else, show login page
          return const LoginPage(title: "Login Page");
        },
      ),
    );
  }
}

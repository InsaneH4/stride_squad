import 'package:flutter/material.dart';
import '/services/auth_service.dart';
//import '/main.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              "Welcome to Stride Squad!",
              style: Theme.of(context).textTheme.headlineMedium,
              textAlign: TextAlign.center,
            ),
            Text(
              "Sign in to get started",
              style: Theme.of(context).textTheme.headlineSmall,
              textAlign: TextAlign.center,
            ),
            SizedBox(
              width: 300,
              height: 75,
              child: ElevatedButton(
                onPressed: () {
                  //Old onPressed for testing
                  // setState(() {
                  //   signedIn = true;
                  //   Navigator.pushReplacement(
                  //     context,
                  //     MaterialPageRoute(
                  //       builder: (context) =>
                  //           const MainPage(title: "Stride Squad"),
                  //     ),
                  //   );
                  // });

                  //New onPressed to sign in with google
                  AuthService().signInWithGoogle();
                },
                child: const Text(
                  "Sign In With Google",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 30,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

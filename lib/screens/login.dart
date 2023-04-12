import 'package:flutter/material.dart';
import 'package:stride_squad/screens/homepage.dart';
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
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 50, bottom: 20),
            child: Text(
              "Welcome to Stride Squad!",
              style: Theme.of(context).textTheme.headlineMedium,
              textAlign: TextAlign.center,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 50),
            child: Text(
              "Sign in to get started",
              style: Theme.of(context).textTheme.titleLarge,
              textAlign: TextAlign.center,
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(8, 20, 8, 20),
            child: TextField(
              style: isDark
                  ? const TextStyle(color: Colors.white)
                  : const TextStyle(color: Colors.black),
              cursorColor: Colors.blueAccent,
              keyboardType: TextInputType.emailAddress,
              controller: emailController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Email',
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(8, 0, 8, 50),
            child: TextField(
              style: isDark
                  ? const TextStyle(color: Colors.white)
                  : const TextStyle(color: Colors.black),
              obscureText: true,
              cursorColor: Colors.blueAccent,
              controller: passwordController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Password',
              ),
            ),
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
    );
  }
}

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:stride_squad/helpers/auth_check.dart';
import 'package:stride_squad/helpers/auth_service.dart';
import 'package:stride_squad/main.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({super.key, required this.title});

  final String title;

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Padding(
              padding: EdgeInsets.fromLTRB(8, 150, 8, 0),
              child: Text(
                'Welcome to Stride Squad!',
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 48,
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                'Enter your email and create a password to get started',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 28, color: Colors.black),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(8, 50, 8, 30),
              child: TextField(
                style: const TextStyle(color: Colors.black),
                keyboardType: TextInputType.emailAddress,
                controller: emailController,
                decoration: const InputDecoration(
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.teal),
                  ),
                  labelStyle: TextStyle(
                    color: Colors.black,
                  ),
                  border: OutlineInputBorder(),
                  labelText: 'Email Address',
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(8, 0, 8, 0),
              child: TextField(
                style: const TextStyle(color: Colors.black),
                obscureText: true,
                controller: passwordController,
                decoration: const InputDecoration(
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.teal),
                  ),
                  labelStyle: TextStyle(
                    color: Colors.black,
                  ),
                  border: OutlineInputBorder(),
                  labelText: 'Password',
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 30, bottom: 20),
              child: SizedBox(
                width: 200,
                height: 50,
                child: ElevatedButton(
                  onPressed: () async {
                    if (emailController.text.isEmpty ||
                        passwordController.text.isEmpty) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('Please enter an email and password'),
                        ),
                      );
                      return;
                    }
                    if (passwordController.text.length < 6) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content:
                              Text('Password must be at least 6 characters'),
                        ),
                      );
                      return;
                    }
                    //promise that goes to main app screen when resolved
                    await AuthService()
                        .signUp(emailController.text, passwordController.text)
                        .then((value) => Navigator.pop(context));
                  },
                  child: const Text("Sign Up", style: TextStyle(fontSize: 28)),
                ),
              ),
            ),
            TextButton(
              style: TextButton.styleFrom(
                foregroundColor: Colors.blueAccent,
              ),
              onPressed: () => Navigator.pop(context),
              child: const Text(
                "Back to Login",
                style: TextStyle(
                  color: Colors.teal,
                  fontSize: 20,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

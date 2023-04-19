import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:stride_squad/screens/pwd_reset.dart';
import '../helpers/auth_service.dart';
import 'homepage.dart';
import 'signup.dart';

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
      body: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 150, bottom: 20),
              child: Text(
                "Welcome back!",
                style: Theme.of(context).textTheme.headlineMedium,
                textAlign: TextAlign.center,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 20),
              child: Text(
                "It's striding time",
                style: Theme.of(context).textTheme.titleLarge,
                textAlign: TextAlign.center,
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(12, 20, 12, 20),
              child: TextField(
                style: TextStyle(color: isDark ? Colors.white : Colors.black),
                keyboardType: TextInputType.emailAddress,
                controller: emailController,
                decoration: InputDecoration(
                  focusedBorder: const OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.teal),
                  ),
                  labelStyle: TextStyle(
                    color: isDark ? Colors.white : Colors.black,
                  ),
                  border: const OutlineInputBorder(),
                  labelText: 'Email Address',
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(12, 0, 12, 0),
              child: TextField(
                style: TextStyle(color: isDark ? Colors.white : Colors.black),
                obscureText: true,
                controller: passwordController,
                decoration: InputDecoration(
                  focusedBorder: const OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.teal),
                  ),
                  labelStyle: TextStyle(
                    color: isDark ? Colors.white : Colors.black,
                  ),
                  border: const OutlineInputBorder(),
                  labelText: 'Password',
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(8, 40, 8, 20),
              child: SizedBox(
                width: 350,
                height: 50,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor:
                        isDark ? Colors.grey[900] : Colors.grey[200],
                  ),
                  onPressed: () async {
                    if (emailController.text.isEmpty ||
                        passwordController.text.isEmpty) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text("Please enter an email and password"),
                          backgroundColor: Colors.redAccent,
                        ),
                      );
                      return;
                    }
                    try {
                      await AuthService().signInEmail(
                        emailController.text,
                        passwordController.text,
                      );
                    } on FirebaseAuthException catch (e) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(e.message!),
                          backgroundColor: Colors.redAccent,
                        ),
                      );
                    }
                  },
                  child: Row(
                    children: [
                      const Icon(
                        size: 40,
                        Icons.email_outlined,
                        color: Colors.teal,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 20),
                        child: Text(
                          "Sign In With Email",
                          style: TextStyle(
                            color: isDark ? Colors.white : Colors.black,
                            fontSize: 26,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(
              width: 350,
              height: 50,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: isDark ? Colors.grey[900] : Colors.grey[200],
                ),
                onPressed: () => AuthService().signInGoogle(context),
                child: Row(children: [
                  const Image(
                    image: AssetImage("assets/goog.png"),
                    height: 40,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: Text(
                      "Sign In With Google",
                      style: TextStyle(
                        color: isDark ? Colors.white : Colors.black,
                        fontSize: 26,
                      ),
                    ),
                  ),
                ]),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 30),
              child: TextButton(
                style: TextButton.styleFrom(
                  foregroundColor: Colors.blueAccent,
                ),
                onPressed: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const SignupPage(title: "Sign Up"),
                  ),
                ),
                child: const Text(
                  "Create an account",
                  style: TextStyle(
                    color: Colors.teal,
                    fontSize: 20,
                  ),
                ),
              ),
            ),
            TextButton(
              style: TextButton.styleFrom(
                foregroundColor: Colors.blueAccent,
              ),
              onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const PasswordReset(),
                ),
              ),
              child: const Text(
                "Forgot Password?",
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

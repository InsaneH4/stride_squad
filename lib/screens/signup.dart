import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../main.dart';
import '/helpers/auth_service.dart';
import '/helpers/my_objects.dart';
import 'homepage.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({super.key, required this.title});

  final String title;

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var confirmController = TextEditingController();
  var usernameController = TextEditingController();
  var nameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(8, 50, 8, 0),
              child: Text('Welcome to Stride Squad!',
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.headlineMedium),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'Enter your email and create a password to get started',
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.titleLarge,
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(12, 50, 12, 16),
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
              padding: const EdgeInsets.fromLTRB(12, 0, 12, 16),
              child: TextField(
                style: TextStyle(color: isDark ? Colors.white : Colors.black),
                controller: nameController,
                decoration: InputDecoration(
                  focusedBorder: const OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.teal),
                  ),
                  labelStyle: TextStyle(
                    color: isDark ? Colors.white : Colors.black,
                  ),
                  border: const OutlineInputBorder(),
                  labelText: 'Full Name',
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(12, 0, 12, 16),
              child: TextField(
                style: TextStyle(color: isDark ? Colors.white : Colors.black),
                controller: usernameController,
                decoration: InputDecoration(
                  focusedBorder: const OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.teal),
                  ),
                  labelStyle: TextStyle(
                    color: isDark ? Colors.white : Colors.black,
                  ),
                  border: const OutlineInputBorder(),
                  labelText: 'Display Name',
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(12, 0, 12, 16),
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
              padding: const EdgeInsets.fromLTRB(12, 0, 12, 0),
              child: TextField(
                style: TextStyle(color: isDark ? Colors.white : Colors.black),
                obscureText: true,
                controller: confirmController,
                decoration: InputDecoration(
                  focusedBorder: const OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.teal),
                  ),
                  labelStyle: TextStyle(
                    color: isDark ? Colors.white : Colors.black,
                  ),
                  border: const OutlineInputBorder(),
                  labelText: 'Confirm Password',
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 30, bottom: 20),
              child: SizedBox(
                width: 200,
                height: 50,
                child: ElevatedButton(
                  child: const Text("Sign Up", style: TextStyle(fontSize: 28)),
                  onPressed: () async {
                    //Checks for errors before signing up

                    if (emailController.text.isEmpty ||
                        passwordController.text.isEmpty ||
                        confirmController.text.isEmpty ||
                        usernameController.text.isEmpty ||
                        nameController.text.isEmpty ||
                        nameController.text.isEmpty) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('Please fill out all fields'),
                          backgroundColor: Colors.redAccent,
                        ),
                      );
                      return;
                    }
                    if (confirmController.text != passwordController.text) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('Passwords do not match'),
                          backgroundColor: Colors.redAccent,
                        ),
                      );
                      return;
                    }

                    try {
                      var newUser = SsUser(
                        email: emailController.text,
                        username: usernameController.text,
                        password: passwordController.text,
                        joinDate: DateFormat('M/d/yy').format(DateTime.now()),
                        name: nameController.text,
                        stepsMap: {
                          DateFormat('M/d/yy').format(DateTime.now()):
                              stepsNotifier.value,
                        },
                        stepsGoal: 5000,
                      );
                      await AuthService()
                          .signUp(emailController.text, passwordController.text)
                          .then(
                        (value) {
                          database
                              .ref(
                                  "/Users/${FirebaseAuth.instance.currentUser!.uid}")
                              .set(newUser.toJson());
                          Navigator.pop(context);
                        },
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

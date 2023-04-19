import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'homepage.dart';

class PasswordReset extends StatefulWidget {
  const PasswordReset({Key? key}) : super(key: key);

  @override
  State<PasswordReset> createState() => _PasswordResetState();
}

class _PasswordResetState extends State<PasswordReset> {
  final emailController = TextEditingController();

  Future<void> resetPwd(emailAddr) async {
    try {
      await FirebaseAuth.instance
          .sendPasswordResetEmail(email: emailAddr.trim())
          .then(
            (value) => ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text("Password reset link sent to $emailAddr"),
                backgroundColor: Colors.green,
              ),
            ),
          );
    } on FirebaseAuthException catch (e) {      
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(e.message!),
          backgroundColor: Colors.redAccent,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.fromLTRB(
                  8, MediaQuery.of(context).size.height / 4, 8, 50),
              child: Text(
                "Enter your email to send a password reset link",
                style: Theme.of(context).textTheme.titleLarge,
                textAlign: TextAlign.center,
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(12, 20, 12, 0),
              child: TextField(
                controller: emailController,
                keyboardType: TextInputType.emailAddress,
                style: TextStyle(color: isDark ? Colors.white : Colors.black),
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
              padding: const EdgeInsets.only(top: 50),
              child: SizedBox(
                width: 350,
                height: 50,
                child: ElevatedButton(
                  onPressed: () {
                    if (emailController.text.isEmpty) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text("Please enter an email address"),
                          backgroundColor: Colors.redAccent,
                        ),
                      );
                      return;
                    }
                    resetPwd(emailController.text);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor:
                        isDark ? Colors.grey[900] : Colors.grey[200],
                  ),
                  child: Row(
                    children: [
                      const Icon(
                        size: 40,
                        Icons.email_outlined,
                        color: Colors.teal,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 40),
                        child: Text(
                          "Reset Password",
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
            Padding(
              padding: const EdgeInsets.only(top: 30),
              child: TextButton(
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
            ),
          ],
        ),
      ),
    );
  }
}

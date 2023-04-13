import 'package:flutter/material.dart';
import '../helpers/auth_service.dart';
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
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: false,
      body: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Padding(
              padding: EdgeInsets.only(top: 150, bottom: 20),
              child: Text(
                "Welcome back!",
                style: TextStyle(
                    fontSize: 48,
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
                textAlign: TextAlign.center,
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(bottom: 20),
              child: Text(
                "It's striding time",
                style: TextStyle(fontSize: 28, color: Colors.black),
                textAlign: TextAlign.center,
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(8, 20, 8, 20),
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
              padding: const EdgeInsets.fromLTRB(8, 40, 8, 20),
              child: SizedBox(
                width: 350,
                height: 50,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.grey[200],
                  ),
                  onPressed: () {
                    if (emailController.text.isEmpty ||
                        passwordController.text.isEmpty) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text("Please enter an email and password"),
                        ),
                      );
                      return;
                    }
                    AuthService().signInEmail(
                      emailController.text,
                      passwordController.text,
                    );
                  },
                  child: Row(children: const [
                    Icon(
                      size: 40,
                      Icons.email_outlined,
                      color: Colors.teal,
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 20),
                      child: Text(
                        "Sign In With Email",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 26,
                        ),
                      ),
                    ),
                  ]),
                ),
              ),
            ),
            SizedBox(
              width: 350,
              height: 50,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.grey[200],
                ),
                // button: Button.GoogleBlue,
                // text: "Sign in with Google",
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
                  AuthService().signInGoogle();
                },
                child: Row(children: const [
                  Image(
                    image: AssetImage("assets/goog.png"),
                    height: 40,
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 20),
                    child: Text(
                      "Sign In With Google",
                      style: TextStyle(
                        color: Colors.black,
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
          ],
        ),
      ),
    );
  }
}

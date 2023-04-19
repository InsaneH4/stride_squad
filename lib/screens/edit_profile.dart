import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:stride_squad/helpers/my_objects.dart';
import '../main.dart';
import 'homepage.dart';

class EditProfile extends StatefulWidget {
  final String title;
  final SsUser curUser;
  const EditProfile({super.key, required this.title, required this.curUser});
  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  final nameController = TextEditingController();
  final usernameController = TextEditingController();
  final oldPwdController = TextEditingController();
  final newPwdController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    nameController.text = widget.curUser.name;
    usernameController.text = widget.curUser.username;
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(12, 25, 12, 0),
              child: TextField(
                style: TextStyle(color: isDark ? Colors.white : Colors.black),
                controller: nameController,
                decoration: InputDecoration(
                  labelText: 'Name',
                  focusedBorder: const OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.teal),
                  ),
                  labelStyle: TextStyle(
                    color: isDark ? Colors.white : Colors.black,
                  ),
                  border: const OutlineInputBorder(),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(12, 25, 12, 0),
              child: TextField(
                style: TextStyle(color: isDark ? Colors.white : Colors.black),
                controller: usernameController,
                decoration: InputDecoration(
                  labelText: 'Username',
                  focusedBorder: const OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.teal),
                  ),
                  labelStyle: TextStyle(
                    color: isDark ? Colors.white : Colors.black,
                  ),
                  border: const OutlineInputBorder(),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(12, 50, 12, 0),
              child: Text("Change Password",
                  style: Theme.of(context).textTheme.titleLarge),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(12, 25, 12, 0),
              child: TextField(
                style: TextStyle(color: isDark ? Colors.white : Colors.black),
                controller: oldPwdController,
                obscureText: true,
                decoration: InputDecoration(
                  labelText: 'Old Password',
                  focusedBorder: const OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.teal),
                  ),
                  labelStyle: TextStyle(
                    color: isDark ? Colors.white : Colors.black,
                  ),
                  border: const OutlineInputBorder(),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(12, 25, 12, 0),
              child: TextField(
                style: TextStyle(color: isDark ? Colors.white : Colors.black),
                controller: newPwdController,
                obscureText: true,
                decoration: InputDecoration(
                  labelText: 'New Password',
                  focusedBorder: const OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.teal),
                  ),
                  labelStyle: TextStyle(
                    color: isDark ? Colors.white : Colors.black,
                  ),
                  border: const OutlineInputBorder(),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(12, 50, 12, 0),
              child: SizedBox(
                width: 350,
                height: 50,
                child: ElevatedButton(
                  child: const Text('Save Changes',
                      style: TextStyle(fontSize: 26, color: Colors.white)),
                  onPressed: () {
                    if (oldPwdController.text.isNotEmpty &&
                        newPwdController.text.isNotEmpty) {
                      //change password
                    } else {
                      setState(
                        () {
                          widget.curUser.name = nameController.text;
                          widget.curUser.username = usernameController.text;
                        },
                      );
                      database
                          .ref('Users/${FirebaseAuth.instance.currentUser!.uid}/username')
                          .set(widget.curUser.username);
                      database
                          .ref('Users/${FirebaseAuth.instance.currentUser!.uid}/name')
                          .set(widget.curUser.name);
                      //update database with new info
                    }
                    Navigator.pop(context);
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

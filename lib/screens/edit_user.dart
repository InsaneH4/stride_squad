import 'package:flutter/material.dart';
import 'package:stride_squad/helpers/my_objects.dart';

import 'homepage.dart';

class EditUser extends StatefulWidget {
  final String title;
  final SsUser curUser;
  const EditUser({super.key, required this.title, required this.curUser});
  @override
  State<EditUser> createState() => _EditUserState();
}

class _EditUserState extends State<EditUser> {
  final nameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    nameController.text = widget.curUser.name;
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Column(
        children: [
          TextField(
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
        ],
      ),
    );
  }
}

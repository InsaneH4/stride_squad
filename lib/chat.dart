import 'package:flutter/material.dart';

class Chat extends StatefulWidget {
  const Chat({super.key, required this.title});

  final String title;

  @override
  State<Chat> createState() => _ChatState();
}

class _ChatState extends State<Chat> {
  var counter = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              'Chat',
              style: Theme.of(context).textTheme.headlineLarge,
            ),
          ],
        ),
      ),
    );
  }
}

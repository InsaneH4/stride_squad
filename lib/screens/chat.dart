import 'package:flutter/material.dart';

class Chat extends StatefulWidget {
  const Chat({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _ChatState createState() => _ChatState();
}

class _ChatState extends State<Chat> {
  final TextEditingController _controller = TextEditingController();

  List<String> messages = [];

  void _handleSubmit(String text) {
    _controller.clear();
    setState(() {
      messages.add(text);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Chat'),
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: ListView.builder(
              itemCount: messages.length,
              itemBuilder: (BuildContext context, int index) {
                return Text(messages[index]);
              },
            ),
          ),
          TextField(
            controller: _controller,
            decoration: InputDecoration(
              hintText: 'Enter a message',
            ),
            onSubmitted: _handleSubmit,
          ),
        ],
      ),
    );
  }
}

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/src/material/colors.dart';

class Leaderboard extends StatefulWidget {
  const Leaderboard({super.key, required this.title});

  final String title;

  @override
  State<Leaderboard> createState() => _LeaderboardState();
}

class _LeaderboardState extends State<Leaderboard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: ListView(
        padding: const EdgeInsets.all(4),
        children: <Widget>[
          Ink(
            color: Colors.lightGreen,
            child: ListTile(
               title: const Text('With LightGreen Background'),
               onTap: (){print("tapped");},
               leading: const CircleAvatar(backgroundImage: AssetImage("image_assets/Stock_LeaderBoard_image.png")),
               )),

             Card(child:ListTile(
              title: Text('RedDashers'),
              leading: CircleAvatar(backgroundImage: AssetImage("image_assets/Stock_LeaderBoard_image.png")),
              )),

             Card(child:ListTile(
               title: Text('White Hills'),
              leading: CircleAvatar(backgroundImage: AssetImage("image_assets/Stock_LeaderBoard_image.png")),
              )),

             Card(
              child:ListTile(
              title: Text('Snow Climbers'),
              leading: CircleAvatar(backgroundImage: AssetImage("image_assets/Stock_LeaderBoard_image.png")),
              )),

             Card(child: ListTile(
               title: Text('Hell Cat'),
               leading: CircleAvatar(backgroundImage: AssetImage("image_assets/Stock_LeaderBoard_image.png")),
               )),

             Card(child:ListTile(
                title: Text('Bob the Bully'),
                leading: CircleAvatar(backgroundImage: AssetImage("image_assets/Stock_LeaderBoard_image.png")),
                )),

             Card(child:ListTile(
                title: Text('Test 1'),
                leading: CircleAvatar(backgroundImage: AssetImage("image_assets/Stock_LeaderBoard_image.png")),
                )),

             Card(child:ListTile(
               title: Text('Test 2'),
              leading: CircleAvatar(backgroundImage: AssetImage("image_assets/Stock_LeaderBoard_image.png")),
              )),

        ]
      ),
    );
  }
}

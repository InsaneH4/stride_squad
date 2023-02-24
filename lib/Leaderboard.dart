import 'package:flutter/material.dart';

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
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Expanded(
            child: ListView(
              children: <Widget>[
                Card(
                  color: Colors.lightGreen,
                  child: ListTile(
                    title: const Text(
                      'With LightGreen Background',
                      style: TextStyle(color: Colors.black),
                    ),
                    onTap: () {
                      debugPrint("tapped");
                    },
                    leading: const CircleAvatar(
                        backgroundImage: AssetImage(
                            "image_assets/Stock_LeaderBoard_image.png")),
                  ),
                ),
                const Card(
                  child: ListTile(
                    title: Text('RedDashers',
                        style: TextStyle(color: Colors.black)),
                    leading: CircleAvatar(
                        backgroundImage: AssetImage(
                            "image_assets/Stock_LeaderBoard_image.png")),
                  ),
                ),
                const Card(
                  child: ListTile(
                    title: Text('White Hills',
                        style: TextStyle(color: Colors.black)),
                    leading: CircleAvatar(
                        backgroundImage: AssetImage(
                            "image_assets/Stock_LeaderBoard_image.png")),
                  ),
                ),
                const Card(
                  child: ListTile(
                    title: Text('Snow Climbers',
                        style: TextStyle(color: Colors.black)),
                    leading: CircleAvatar(
                        backgroundImage: AssetImage(
                            "image_assets/Stock_LeaderBoard_image.png")),
                  ),
                ),
                const Card(
                  child: ListTile(
                    title:
                        Text('Hell Cat', style: TextStyle(color: Colors.black)),
                    leading: CircleAvatar(
                        backgroundImage: AssetImage(
                            "image_assets/Stock_LeaderBoard_image.png")),
                  ),
                ),
                const Card(
                  child: ListTile(
                    title: Text('Bob the Bully',
                        style: TextStyle(color: Colors.black)),
                    leading: CircleAvatar(
                        backgroundImage: AssetImage(
                            "image_assets/Stock_LeaderBoard_image.png")),
                  ),
                ),
                const Card(
                  child: ListTile(
                    title:
                        Text('Test 1', style: TextStyle(color: Colors.black)),
                    leading: CircleAvatar(
                        backgroundImage: AssetImage(
                            "image_assets/Stock_LeaderBoard_image.png")),
                  ),
                ),
                const Card(
                  child: ListTile(
                    title:
                        Text('Test 2', style: TextStyle(color: Colors.black)),
                    leading: CircleAvatar(
                        backgroundImage: AssetImage(
                            "image_assets/Stock_LeaderBoard_image.png")),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

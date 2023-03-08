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
        title: const Text("LeaderBoard"),
        backgroundColor: Colors.white,
        centerTitle: true,
      ),
      body: Container(
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(
                height: 75,
                child: ListView.builder(
                  itemCount: 3,
                    scrollDirection: Axis.horizontal,
                     itemBuilder:(context, index) => Container(
                      height: 100,
                      width: 100,
                      margin: const EdgeInsets.all(10),
                      child: Center(
                        child: Text(
                          "Team ${index+1}",
                          style: const TextStyle(fontSize: 25, color: Colors.black, fontWeight: FontWeight.w700),
                      ),
                    )
                  )
              )
            ),
          Flexible(
            child: ListView.builder(
              itemCount: 17,
              //controller: AdjustableScrollController(80)
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemBuilder: (context, index) => ListTile(
                title: Text('RedDashers ${index+4}', style: const TextStyle(fontSize: 25, fontWeight: FontWeight.w500 , color: Colors.black)),
                onTap: () {
                      debugPrint("tapped");
                    },
                leading: const CircleAvatar(
                        backgroundImage: AssetImage(
                            "image_assets/Stock_LeaderBoard_image.png")),
                )
              )
            )
          ]
        ),
       )
        /*children: [
          Expanded(
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: <Widget>[
                   Container(
                  width: 160.0,
                  color: Colors.red,
                ),
                   Container(
                  width: 160.0,
                  color: Colors.red,
                ),
                   Container(
                  width: 160.0,
                  color: Colors.red,
                ),
              ],
            ),
          ),
            ListView(
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
        */,
      ),
    );
  }
}

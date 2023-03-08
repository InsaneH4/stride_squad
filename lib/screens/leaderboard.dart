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
      body: SingleChildScrollView(
        child: Column(
          //mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: const EdgeInsets.all(30),
              child: Text("Leaderboard",
                  style: Theme.of(context).textTheme.headlineMedium),
            ),
            SizedBox(
              height: 125,
              child: Center(
                child: ListView.builder(
                  itemCount: 3,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) => Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Column(
                      children: [
                        const CircleAvatar(
                          backgroundImage: AssetImage(
                              "image_assets/Stock_LeaderBoard_image.png"),
                          radius: 30,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 8.0),
                          child: Text(
                            "Team ${index + 1}",
                            style: Theme.of(context).textTheme.titleMedium,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Flexible(
              child: ListView.builder(
                itemCount: 17,
                //controller: AdjustableScrollController(80),
                physics: const BouncingScrollPhysics(),
                shrinkWrap: true,
                itemBuilder: (context, index) => Card(
                  child: ListTile(
                    title: Text(
                      'RedDashers ${index + 4}',
                      style: const TextStyle(fontSize: 28, color: Colors.black),
                    ),
                    onTap: showTeamDialog,
                    leading: const CircleAvatar(
                      backgroundImage: AssetImage(
                          "image_assets/Stock_LeaderBoard_image.png"),
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Future<void> showTeamDialog() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text(
            'Team name',
            style: TextStyle(color: Colors.black),
          ),
          content: SingleChildScrollView(
            child: ListBody(
              children: const <Widget>[
                Text('Team picture and info will be here'),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('Approve'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}

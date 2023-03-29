//import 'dart:js';

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
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Container(
              padding: const EdgeInsets.only(left: 40.0, top: 30.0, right: 40.0, bottom: 4.0),
              //child: Text("Leaderboard",
                //  style: Theme.of(context).textTheme.headlineSmall),
            ),
          // Horizontal Row containing Top 3 Teams
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [ 
              Column(
                      children: [
                        const CircleAvatar(
                          backgroundImage: AssetImage(
                              "image_assets/Stock_LeaderBoard_image.png"),
                          radius: 35,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 8.0, bottom: 0.1),
                          child: Text(
                            "Team 1",
                            style: Theme.of(context).textTheme.titleSmall
                              )
                          ),
                        /*Padding(
                          padding: const EdgeInsets.only(top: 5.0, bottom: 0.1),
                          child: Text(
                            "1",
                            style: Theme.of(context).textTheme.titleMedium,
                              )
                          ),  
                          */
                      ]
              ),
              Column(
                      children: [
                        const CircleAvatar(
                          backgroundImage: AssetImage(
                              "image_assets/Stock_LeaderBoard_image.png"),
                          radius: 35,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 8.0, bottom: 0.1),
                          child: Text(
                            "Team 2",
                            style: Theme.of(context).textTheme.titleSmall,
                              )
                          ),
                          /*
                          Padding(
                          padding: const EdgeInsets.only(top: 5.0, bottom: 0.1),
                          child: Text(
                            "2",
                            style: Theme.of(context).textTheme.titleMedium,
                              )
                          ),
                          */
                      ]
              ),
              Column(
                      children: [
                        const CircleAvatar(
                          backgroundImage: AssetImage(
                              "image_assets/Stock_LeaderBoard_image.png"),
                          radius: 35,
                        ),
                      Padding(
                          padding: const EdgeInsets.only(top: 8.0, bottom: 0.1),
                            child: Text(
                              "Team 3",
                              style: Theme.of(context).textTheme.titleSmall,
                                )
                            ),
                            /*Padding(
                            padding: const EdgeInsets.only(top: 5.0, bottom: 0.1),
                            child: Text(
                              "3",
                              style: Theme.of(context).textTheme.titleMedium,
                                )
                           ), 
                           */  
                      ]
              ),
          ],),
          const Divider(
            height: 2,
          ),
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.only(top: 10),
              itemCount: 17,
              scrollDirection: Axis.vertical,
              itemBuilder: (context, index) => Card(
                  child: ListTile(
                    tileColor: Colors.white,
                    //shape:Border.all(width: 0.5),
                    trailing: Transform(
                      transform: Matrix4.translationValues(-90, 0.0, 0.0), 
                        child: const Text(
                          'RedDashers',
                          style: TextStyle(fontSize: 32, color: Colors.black), 
                        ),
                        ),
                    leading: Transform(
                      transform: Matrix4.translationValues(2, 0.0, 0.0),
                        child: Text(
                          '${index + 4}',
                          style: const TextStyle(fontSize: 26, color: Colors.black),
                        ),
                    ),
                    // onTap: showTeamDialog,
                    title: Transform(
                      transform: Matrix4.translationValues(-50, 0.0, 0.0), 
                         child: const CircleAvatar(
                          radius: 22,
                          backgroundImage: AssetImage(
                              "image_assets/Stock_LeaderBoard_image.png"),
                ),
                ),
          )
              ),
            )
                ),
              ]
        )
      ); //,
  }
} 

void alertDialog(BuildContext context){
  var alert = const AlertDialog(
    title: Text("My title"),
    content: Text("Dialog description"),
  );
  showDialog(context: context, builder: (BuildContext context) => alert);
}
  /*Future<void> showTeamDialog() async {
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
              child: const Text('Ok'),
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
*/

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:numberpicker/numberpicker.dart';
import 'package:stride_squad/helpers/my_objects.dart';
import '/helpers/auth_service.dart';
import '/main.dart';
import 'homepage.dart';

class Profile extends StatefulWidget {
  const Profile({super.key, required this.title});

  final String title;

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  final goalController = TextEditingController();
  final dateFormat = DateFormat('dd-MMMM-yyyy');

  @override
  Widget build(BuildContext context) {
    goalController.text = stepsGoal.toString();
    return FutureBuilder(
      future: database.ref('Users/$myUID').once(),
      builder: (context, AsyncSnapshot snapshot) {
        if (snapshot.hasData) {
          //gets signed in user info from db, converts from json to dart object
          final SsUser curUser = SsUser.fromJson(snapshot.data);
          var totalSteps = 0;
          for (var element in curUser.stepsMap.values) {
            totalSteps += int.parse(element as String);
          }
          debugPrint('Current User: ${curUser.toJson()}');
          return Scaffold(
            appBar: AppBar(
              title: Text(widget.title),
              actions: [
                IconButton(
                  onPressed: () {
                    //shown dialog
                    showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          backgroundColor: Colors.teal,
                          title: const Text('Edit Profile'),
                          content: const Text(
                            "Not yet implemented",
                            style: TextStyle(color: Colors.white, fontSize: 20),
                          ),
                          actions: [
                            TextButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                              child: const Text('Ok',
                                  style: TextStyle(
                                      fontSize: 20, color: Colors.white)),
                            ),
                          ],
                        );
                      },
                    );
                  },
                  icon: const Icon(Icons.edit),
                ),
              ],
            ),
            body: SingleChildScrollView(
              child: Center(
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 50, 0, 20),
                      child: Container(
                        width: 150,
                        height: 150,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          image: DecorationImage(
                            image: AssetImage('assets/default_pfp.jpg'),
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 30),
                      child: Text(
                        "@${curUser.username}",
                        style: Theme.of(context).textTheme.headlineSmall,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10),
                      child: Text(
                        'Member since: ${curUser.joinDate}',
                        style: Theme.of(context).textTheme.titleLarge,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 30),
                      child: Text(
                        'Total steps: $totalSteps',
                        style: Theme.of(context).textTheme.titleLarge,
                      ),
                    ),
                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text("Steps Goal:",
                              style: Theme.of(context).textTheme.headlineSmall),
                          NumberPicker(
                            textStyle: Theme.of(context).textTheme.titleSmall,
                            selectedTextStyle: const TextStyle(
                                color: Colors.teal, fontSize: 32),
                            itemWidth: 100,
                            itemHeight: 40,
                            step: 100,
                            minValue: 100,
                            maxValue: 25000,
                            value: stepsGoal,
                            onChanged: (value) {
                              database.ref('Users/$myUID/stepsGoal').set(value);
                              setState(() {
                                stepsGoal = value;
                              });
                            },
                          ),
                        ]),
                    Padding(
                      padding: const EdgeInsets.only(top: 50),
                      child: TextButton(
                        child: const Text(
                          'Sign Out',
                          style: TextStyle(
                            color: Colors.redAccent,
                            fontWeight: FontWeight.bold,
                            fontSize: 28,
                          ),
                        ),
                        onPressed: () {
                          AuthService().signOut();
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        }
        return const Center(
            child: CircularProgressIndicator(
          color: Colors.teal,
        ));
      },
    );
  }
}

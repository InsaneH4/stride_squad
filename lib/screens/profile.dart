import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '/helpers/auth_check.dart';
import '/helpers/auth_service.dart';
import '/main.dart';

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
                            style:
                                TextStyle(fontSize: 20, color: Colors.white)),
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
      // body: Column(
      //   crossAxisAlignment: CrossAxisAlignment.start,
      //   children: [
      //     Padding(
      //       padding: const EdgeInsets.only(left: 18.0),
      //       child: Container(
      //         decoration: BoxDecoration(
      //           color: Colors.teal,
      //           borderRadius: BorderRadius.circular(10.0),
      //         ),
      //         child: const Padding(
      //           padding: EdgeInsets.all(8.0),
      //           child: Text(
      //             'First Name: ',
      //             style: TextStyle(
      //               color: Colors.white,
      //               fontSize: 24.0,
      //               fontWeight: FontWeight.bold,
      //             ),
      //           ),
      //         ),
      //       ),
      //     ),
      //     const SizedBox(height: 5.0),
      //     Padding(
      //       padding: const EdgeInsets.only(left: 18.0),
      //       child: Container(
      //         decoration: BoxDecoration(
      //           color: Colors.teal,
      //           borderRadius: BorderRadius.circular(10.0),
      //         ),
      //         child: const Padding(
      //           padding: EdgeInsets.all(8.0),
      //           child: Text(
      //             'Last Name: ',
      //             style: TextStyle(
      //               color: Colors.white,
      //               fontSize: 24.0,
      //               fontWeight: FontWeight.bold,
      //             ),
      //           ),
      //         ),
      //       ),
      //     ),
      //     const SizedBox(height: 5.0),
      //     Padding(
      //       padding: const EdgeInsets.only(left: 18.0),
      //       child: Container(
      //         decoration: BoxDecoration(
      //           color: Colors.teal,
      //           borderRadius: BorderRadius.circular(10.0),
      //         ),
      //         child: const Padding(
      //           padding: EdgeInsets.all(8.0),
      //           child: Text(
      //             'Date Joined: ',
      //             style: TextStyle(
      //               color: Colors.white,
      //               fontSize: 24.0,
      //               fontWeight: FontWeight.bold,
      //             ),
      //           ),
      //         ),
      //       ),
      //     ),
      //     const SizedBox(height: 5.0),
      //     Padding(
      //       padding: const EdgeInsets.only(left: 18.0),
      //       child: Container(
      //         decoration: BoxDecoration(
      //           color: Colors.teal,
      //           borderRadius: BorderRadius.circular(10.0),
      //         ),
      //         child: const Padding(
      //           padding: EdgeInsets.all(8.0),
      //           child: Text(
      //             'Lifetime Steps: ',
      //             style: TextStyle(
      //               color: Colors.white,
      //               fontSize: 24.0,
      //               fontWeight: FontWeight.bold,
      //             ),
      //           ),
      //         ),
      //       ),
      //     ),
      //     const SizedBox(height: 5.0),
      //     Padding(
      //       padding: const EdgeInsets.only(left: 18.0),
      //       child: Container(
      //         decoration: BoxDecoration(
      //           color: Colors.teal,
      //           borderRadius: BorderRadius.circular(10.0),
      //         ),
      //         child: const Padding(
      //           padding: EdgeInsets.all(8.0),
      //           child: Text(
      //             'Weekly Average Steps: ',
      //             style: TextStyle(
      //               color: Colors.white,
      //               fontSize: 24.0,
      //               fontWeight: FontWeight.bold,
      //             ),
      //           ),
      //         ),
      //       ),
      //     ),
      //     /*Row(
      //       children: [
      //         Padding(
      //           padding: const EdgeInsets.only(top: 18.0, left: 18.0),
      //           child: Text(
      //             "Steps goal: ",
      //             style: Theme.of(context).textTheme.titleLarge,
      //           ),
      //         ),
      //         Padding(
      //           padding: const EdgeInsets.only(top: 18.0, left: 18.0),
      //           child: TextField(
      //             controller: goalController,
      //             decoration: const InputDecoration(
      //               border: UnderlineInputBorder(),
      //               labelText: 'Steps',
      //             ),
      //             onEditingComplete: () {
      //               setState(() {
      //                 stepsGoal = goalController.text;
      //               });
      //             },
      //           ),
      //         ),
      //       ],
      //     ),*/
      //   ],
      // ),
      body: Center(
        child: Column(
          //  mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Container(
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
            Text(
              '@StepsGod69',
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            Text(
              'Member since ${DateFormat('M/d/yy').format(DateTime.now())}',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            Text(
              'Total steps: 2,654,327',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            SizedBox(
              width: 200,
              height: 50,
              child: TextField(
                  style: const TextStyle(color: Colors.black),
                  controller: goalController,
                  decoration: InputDecoration(
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.teal),
                    ),
                    labelStyle: TextStyle(
                      color: Colors.black,
                    ),
                    border: OutlineInputBorder(),
                    labelText: 'Enter Steps Goal',
                    filled: true,
                    fillColor: Colors.white,
                  ),
                  onSubmitted: (value) {
                    setState(() {
                      stepsGoal = int.parse(value);
                    });

                    //     debugPrint('Steps Goal: $stepsGoal');
                  }),
            ),
            TextButton(
              child: const Text(
                'Sign Out',
                style: TextStyle(
                  color: Colors.teal,
                  fontSize: 28,
                ),
              ),
              onPressed: () {
                AuthService().signOut();
              },
            ),
          ],
        ),
      ),
    );
  }
}

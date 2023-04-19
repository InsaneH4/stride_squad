import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:stride_squad/helpers/my_objects.dart';
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
  final myUID = FirebaseAuth.instance.currentUser!.uid;

  @override
  Widget build(BuildContext context) {
    goalController.text = stepsGoal.toString();
    return FutureBuilder(
      future: database.ref('Users/$myUID').once(),
      builder: (context, AsyncSnapshot snapshot) {
        if (snapshot.hasData) {
          final SsUser curUser = SsUser.fromJson(snapshot.data);
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
                        '@StepsGod69',
                        style: Theme.of(context).textTheme.headlineSmall,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10),
                      child: Text(
                        'Member since ${DateFormat('M/d/yy').format(DateTime.now())}',
                        style: Theme.of(context).textTheme.titleLarge,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 30),
                      child: Text(
                        'Total steps: 2,654,327',
                        style: Theme.of(context).textTheme.titleLarge,
                      ),
                    ),
                    SizedBox(
                      width: 250,
                      height: 75,
                      child: TextField(
                          style: Theme.of(context).textTheme.titleMedium,
                          controller: goalController,
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                            focusedBorder: const OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.teal),
                            ),
                            labelStyle: Theme.of(context).textTheme.titleSmall,
                            border: const OutlineInputBorder(),
                            labelText: 'Daily Steps Goal',
                          ),
                          onSubmitted: (value) {
                            setState(() {
                              stepsGoal = int.parse(value);
                            });

                            //     debugPrint('Steps Goal: $stepsGoal');
                          }),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 50),
                      child: TextButton(
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
                    ),
                  ],
                ),
              ),
            ),
          );
        } else {
          return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}

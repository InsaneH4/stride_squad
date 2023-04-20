import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:activity_ring/activity_ring.dart';
import '../helpers/my_objects.dart';
import '/helpers/theme_conf.dart';
import '/main.dart';

var isDark = appPrefs.getString("theme") == "dark" ? true : false;
final myUID = FirebaseAuth.instance.currentUser!.uid;

class Homepage extends StatefulWidget {
  const Homepage({super.key, required this.title});

  final String title;

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  final firstDayOfWeek =
      DateTime.now().subtract(Duration(days: DateTime.now().weekday));
  var teamSteps = 38922;

  @override
  Widget build(BuildContext context) {
    debugPrint(myUID);
    // return FutureBuilder(
    //   future: database.ref('Users/$myUID').once(),
    //   builder: (context, snapshot) {
    //     if (snapshot.hasData) {
    //       final SsUser curUser = SsUser.fromJson(snapshot.data!);
    //       stepsGoal = curUser.stepsGoal;
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        actions: [
          IconButton(
            icon: isDark
                ? const Icon(Icons.brightness_high)
                : const Icon(Icons.brightness_3),
            onPressed: () {
              isDark = !isDark;
              isDark
                  ? ThemeController.of(context).setTheme("dark", isDark)
                  : ThemeController.of(context).setTheme("light", isDark);
            },
          ),
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          // Text(
          //   "Today's step's",
          //   style: Theme.of(context).textTheme.headlineSmall,
          //   textAlign: TextAlign.center,
          // ),
          FutureBuilder(
            future: database.ref('Users/$myUID').once(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                final SsUser curUser = SsUser.fromJson(snapshot.data!);
                stepsGoal = curUser.stepsGoal;
                return Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ValueListenableBuilder(
                      valueListenable: stepsNotifier,
                      builder: (context, value, child) => Text(
                        '$value',
                        style: const TextStyle(
                          color: Colors.teal,
                          fontSize: 30,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ],
                );
              } else {
                return Column(
                  children: const [
                    Text(
                      'You: ...',
                      style: TextStyle(
                        color: Colors.teal,
                        fontSize: 25,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ],
                );
              }
            },
          ),
          Padding(
            padding: const EdgeInsets.all(160),
            child: Stack(
              children: [
                ValueListenableBuilder(
                  valueListenable: stepsNotifier,
                  builder: (context, value, child) => Ring(
                    percent: int.parse(value) > stepsGoal
                        ? 100
                        : (int.parse(value) / stepsGoal) * 100,
                    // if (percent = 100)
                    // {
                    //  colo
                    //}
                    color: RingColorScheme(ringColor: Colors.teal),
                    radius: 140,
                    width: 30,
                  ),
                ),
              ],
            ),
          ),
          Text(
            'Week of ${firstDayOfWeek.month}/${firstDayOfWeek.day}',
            style: Theme.of(context).textTheme.headlineSmall,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Stack(
                alignment: Alignment.center,
                children: [
                  Text("Su", style: Theme.of(context).textTheme.titleMedium),
                  Ring(
                    percent: 70,
                    color: RingColorScheme(ringColor: Colors.teal),
                    radius: 25,
                    width: 3,
                  ),
                ],
              ),
              Stack(
                alignment: Alignment.center,
                children: [
                  Text("M", style: Theme.of(context).textTheme.titleMedium),
                  Ring(
                    percent: 70,
                    color: RingColorScheme(ringColor: Colors.teal),
                    radius: 25,
                    width: 3,
                  ),
                ],
              ),
              Stack(
                alignment: Alignment.center,
                children: [
                  Text("Tu", style: Theme.of(context).textTheme.titleMedium),
                  Ring(
                    percent: 70,
                    color: RingColorScheme(ringColor: Colors.teal),
                    radius: 25,
                    width: 3,
                  ),
                ],
              ),
              Stack(
                alignment: Alignment.center,
                children: [
                  Text("W", style: Theme.of(context).textTheme.titleMedium),
                  Ring(
                    percent: 70,
                    color: RingColorScheme(ringColor: Colors.teal),
                    radius: 25,
                    width: 3,
                  ),
                ],
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Stack(
                alignment: Alignment.center,
                children: [
                  Text("Th", style: Theme.of(context).textTheme.titleMedium),
                  Ring(
                    percent: 70,
                    color: RingColorScheme(ringColor: Colors.teal),
                    radius: 25,
                    width: 3,
                  ),
                ],
              ),
              Stack(
                alignment: Alignment.center,
                children: [
                  Text("F", style: Theme.of(context).textTheme.titleMedium),
                  Ring(
                    percent: 70,
                    color: RingColorScheme(ringColor: Colors.teal),
                    radius: 25,
                    width: 3,
                  ),
                ],
              ),
              Stack(
                alignment: Alignment.center,
                children: [
                  Text("Sa", style: Theme.of(context).textTheme.titleMedium),
                  Ring(
                    percent: 70,
                    color: RingColorScheme(ringColor: Colors.teal),
                    radius: 25,
                    width: 3,
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
  //       }
  //       return const Center(
  //           child: CircularProgressIndicator(
  //         color: Colors.teal,
  //       ));
  //     },
  //   );
  // }
  //}

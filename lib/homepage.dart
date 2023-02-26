import 'package:flutter/material.dart';
import 'package:activity_ring/activity_ring.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key, required this.title});

  final String title;

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  var firstDayOfWeek =
      DateTime.now().subtract(Duration(days: DateTime.now().weekday));
  var mySteps = 10000;
  var teamSteps = 40000;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text(
            "Today's steps",
            style: Theme.of(context).textTheme.headlineSmall,
            textAlign: TextAlign.center,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                'You: $mySteps',
                style: const TextStyle(
                  color: Colors.teal,
                  fontSize: 28,
                ),
                textAlign: TextAlign.center,
              ),
              Text(
                'Team: $teamSteps',
                style: const TextStyle(
                  color: Colors.blue,
                  fontSize: 28,
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(150),
            child: Stack(
              children: [
                Ring(
                  percent: 40,
                  color: RingColorScheme(ringColor: Colors.teal),
                  radius: 150,
                  width: 20,
                ),
                Ring(
                  percent: 70,
                  color: RingColorScheme(ringColor: Colors.blue),
                  radius: 100,
                  width: 20,
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

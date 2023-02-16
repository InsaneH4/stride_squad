import 'package:flutter/material.dart';
import 'package:activity_ring/activity_ring.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key, required this.title});

  final String title;

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  var counter = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            const Padding(
              padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
              child: Text(
                'You have pushed the button this many times:',
                style: TextStyle(fontSize: 28),
                textAlign: TextAlign.center,
              ),
            ),
            Text(
              '$counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            Ring(
              percent: counter * 5 < 100 ? counter * 5 : 100,
              color: RingColorScheme(ringColor: Colors.greenAccent),
              radius: 75,
              width: 10,
            ),
            ElevatedButton(
                onPressed: () => setState(() => counter = 0),
                child: const Text("Reset")),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => setState(() => counter++),
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}

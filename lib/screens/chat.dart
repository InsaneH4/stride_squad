import 'dart:math';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class InspirationApp extends StatefulWidget {
  @override
  _InspirationAppState createState() => _InspirationAppState();
}

class _InspirationAppState extends State<InspirationApp>
    with SingleTickerProviderStateMixin {
  String quote = "Click to get inspired!";
  Color color = Colors.blueGrey;
  late AnimationController _controller;
  late Animation<double> _animation;

  List<String> quotes = [
    "The future belongs to those who believe in the beauty of their dreams. - Eleanor Roosevelt",
    "Believe you can and you're halfway there. - Theodore Roosevelt",
    "Happiness is not something ready made. It comes from your own actions. - Dalai Lama",
    "Believe in yourself and all that you are. Know that there is something inside you that is greater than any obstacle. - Christian D. Larson",
    "You are never too old to set another goal or to dream a new dream. - C.S. Lewis"
  ];

  List<Color> colors = [
    Colors.blueGrey,
    Colors.teal,
    Colors.deepPurple,
    Colors.blue,
    Colors.indigo,
    Colors.orange,
    Colors.red,
  ];

  void changeQuote() {
    setState(() {
      quote = quotes[Random().nextInt(quotes.length)];
      color = colors[Random().nextInt(colors.length)];
    });
    _controller.reset();
    _controller.forward();
  }

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 4),
    );
    _animation = Tween(begin: 0.0, end: 1.0).animate(_controller)
      ..addListener(() {
        setState(() {});
      });
    _controller.repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final gradient = Gradient.linear(
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
      colors: [color.withOpacity(0.4), color.withOpacity(0.8)],
    );
    return Scaffold(
      body: InkWell(
        onTap: changeQuote,
        child: AnimatedContainer(
          duration: Duration(seconds: 1),
          decoration: BoxDecoration(
            gradient: gradient,
          ),
          child: Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: Text(
                quote,
                textAlign: TextAlign.center,
                style: GoogleFonts.greatVibes(
                  fontSize: 28.0,
                  color: Colors.white.withOpacity(_animation.value),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class Chat extends StatelessWidget {
  const Chat({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return InspirationApp();
  }
}

void main() {
  runApp(MaterialApp(
    title: 'My App',
    home: Chat(title: 'My Inspiration App'),
  ));
}

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
  late AnimationController _controller;
  late Animation<Color?> _colorAnimation;

  List<String> quotes = [
    "The future belongs to those who believe in the beauty of their dreams. \n\n- Eleanor Roosevelt",
    "Believe you can and you're halfway there. \n\n- Theodore Roosevelt",
    "Happiness is not something ready made. It comes from your own actions. \n\n- Dalai Lama",
    "Believe in yourself and all that you are. Know that there is something inside you that is greater than any obstacle. \n\n- Christian D. Larson",
    "You are never too old to set another goal or to dream a new dream. \n\n- C.S. Lewis"
  ];

  List<List<Color>> gradients = [
    [Colors.purple.shade200, Colors.deepPurple.shade400],
    [Colors.blue.shade200, Colors.lightBlue.shade400],
    [Colors.orange.shade200, Colors.orange.shade400],
    [Colors.yellow.shade200, Colors.amber.shade400],
    [Colors.red.shade200, Colors.red.shade400],
  ];

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 6),
    )..repeat(reverse: true);
    _colorAnimation = ColorTween(
      begin: gradients.first.first,
      end: gradients.last.last,
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut,
    ));
  }

  void changeQuote() {
    setState(() {
      quote = quotes[Random().nextInt(quotes.length)];
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: InkWell(
        onTap: changeQuote,
        child: AnimatedBuilder(
          animation: _controller,
          builder: (BuildContext context, Widget? child) {
            return Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    _colorAnimation.value!.withOpacity(0.7),
                    _colorAnimation.value!.withOpacity(0.9),
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
              ),
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24.0),
                  child: Text(
                    quote,
                    textAlign: TextAlign.center,
                    style: GoogleFonts.patrickHand(
                      fontSize: 28.0,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            );
          },
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

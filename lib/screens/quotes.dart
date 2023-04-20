import 'dart:math';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Quotes extends StatefulWidget {
  final String title;
  const Quotes({super.key, required this.title});

  @override
  State<Quotes> createState() => _QuotesState();
}

class _QuotesState extends State<Quotes> with SingleTickerProviderStateMixin {
  String quote = "Click to get inspired!";
  late AnimationController _controller;
  late Animation<Color?> _colorAnimation;

  List<String> quotes = [
    "The future belongs to those who believe in the beauty of their dreams. \n\n- Eleanor Roosevelt",
    "Believe you can and you're halfway there. \n\n- Theodore Roosevelt",
    "Happiness is not something ready made. It comes from your own actions. \n\n- Dalai Lama",
    "Believe in yourself and all that you are. Know that there is something inside you that is greater than any obstacle. \n\n- Christian D. Larson",
    "You are never too old to set another goal or to dream a new dream. \n\n- C.S. Lewis",
    "The only way to do great work is to love what you do. \n\n- Steve Jobs",
    "Success is not final, failure is not fatal: It is the courage to continue that counts. \n\n- Winston Churchill",
    "You miss 100% of the shots you don't take. \n\n- Wayne Gretzky",
    "I have not failed. I've just found 10,000 ways that won't work. \n\n- Thomas Edison",
    "Success is not how high you have climbed, but how you make a positive difference to the world. \n\n- Roy T. Bennett",
    "You can't connect the dots looking forward; you can only connect them looking backwards. So you have to trust that the dots will somehow connect in your future. \n\n- Steve Jobs",
    "If you look at what you have in life, you'll always have more. If you look at what you don't have in life, you'll never have enough. \n\n- Oprah Winfrey",
    "Believe that life is worth living and your belief will help create the fact. \n\n- William James",
    "I am not a product of my circumstances. I am a product of my decisions. \n\n- Stephen Covey",
    "Success is stumbling from failure to failure with no loss of enthusiasm. \n\n- Winston Churchill",
    "The only limit to our realization of tomorrow will be our doubts of today. \n\n- Franklin D. Roosevelt",
    "You don't have to be great to start, but you have to start to be great. \n\n- Zig Ziglar",
    "The greatest glory in living lies not in never falling, but in rising every time we fall. \n\n- Nelson Mandela",
    "Believe in the power of your dreams and the world will change because of you. \n\n- Paulo Coelho",
    "Our greatest weakness lies in giving up. The most certain way to succeed is always to try just one more time. \n\n- Thomas Edison",
    "It's not whether you get knocked down, it's whether you get up. \n\n- Vince Lombardi",
    "Chase your dreams until they become reality, and then chase new ones. \n\n- Unknown",
    "Success is not the key to happiness. Happiness is the key to success. If you love what you are doing, you will be successful. \n\n- Albert Schweitzer",
    "The best way to predict your future is to create it. \n\n- Abraham Lincoln",
    "Do not wait for opportunities, create them. \n\n- Roy T. Bennett",
  ];

  final gradients = [
    Colors.deepPurple.shade200,
    Colors.pink.shade300,
    Colors.purple.shade300,
    Color.fromARGB(255, 203, 48, 224),
    Colors.blue.shade200,
    Colors.lightBlue.shade400,
    Colors.green.shade200,
    Colors.lime.shade400,
    Colors.orange.shade300,
    Colors.red.shade200,
    Colors.deepPurple.shade200,
    Colors.pink.shade300,
    Colors.purple.shade300,
    Color.fromARGB(255, 203, 48, 224),
    Colors.blue.shade200,
    Colors.lightBlue.shade400,
    Colors.green.shade200,
    Colors.lime.shade400,
    Colors.orange.shade300,
    Colors.red.shade200,
    Colors.deepPurple.shade200,
    Colors.pink.shade300,
    Colors.purple.shade300,
    Color.fromARGB(255, 203, 48, 224),
    Colors.blue.shade200,
    Colors.lightBlue.shade400,
    Colors.green.shade200,
    Colors.lime.shade400,
    Colors.orange.shade300,
    Colors.red.shade200,
    Colors.pink.shade300,
    Colors.purple.shade300,
    Color.fromARGB(255, 203, 48, 224),
    Colors.blue.shade200,
    Colors.lightBlue.shade400,
    Colors.green.shade200,
    Colors.lime.shade400,
    Colors.orange.shade300,
    Colors.red.shade200,
    Colors.deepPurple.shade200,
    Colors.pink.shade300,
    Colors.purple.shade300,
    Color.fromARGB(255, 203, 48, 224),
    Colors.blue.shade200,
    Colors.lightBlue.shade400,
    Colors.green.shade200,
    Colors.lime.shade400,
    Colors.orange.shade300,
    Colors.red.shade200,
    Colors.pink.shade300,
    Colors.purple.shade300,
    Color.fromARGB(255, 203, 48, 224),
    Colors.blue.shade200,
    Colors.lightBlue.shade400,
    Colors.green.shade200,
    Colors.lime.shade400,
    Colors.orange.shade300,
    Colors.red.shade200,
    Colors.deepPurple.shade200,
    Colors.pink.shade300,
    Colors.purple.shade300,
    Color.fromARGB(255, 203, 48, 224),
    Colors.blue.shade200,
    Colors.lightBlue.shade400,
    Colors.green.shade200,
    Colors.lime.shade400,
    Colors.orange.shade300,
    Colors.red.shade200,
  ];

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 2),
    )..repeat(reverse: true);
    _colorAnimation = ColorTween(
      begin: gradients.first,
      end: gradients.last,
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut,
    ));
  }

  void changeQuote() {
    final quoteIndex = Random().nextInt(quotes.length);
    final colors = gradients.sublist(quoteIndex * 2, (quoteIndex + 1) * 2);
    _colorAnimation = ColorTween(
      begin: colors.first,
      end: colors.last,
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut,
    ));
    setState(() {
      quote = quotes[quoteIndex];
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
                    style: GoogleFonts.caveat(
                      fontSize: 45.0,
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

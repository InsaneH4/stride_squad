import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:logger/logger.dart';
import 'package:stride_squad/homepage.dart';

void main() {
  //Keeps device in portrait rotation
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  var logger = Logger();
  if (kReleaseMode) {
    logger.i("Stride Squad is running in release mode");
  } else if (kProfileMode) {
    logger.i("Stride Squad is running in profile mode");
  } else {
    logger.i("Stride Squad is running in debug mode");
  }
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Stride Squad',
      theme: ThemeData(
        primarySwatch: Colors.indigo,
      ),
      home: const Homepage(title: 'Home'),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:stride_squad/homepage.dart';

//Use debugPrint() to print stuff
void main() {
  //Keeps device in portrait rotation
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
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

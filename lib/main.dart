import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pedometer/pedometer.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:restart_app/restart_app.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:firebase_core/firebase_core.dart';
import 'screens/homepage.dart';
import 'screens/chat.dart';
import 'screens/leaderboard.dart';
import 'screens/profile.dart';
import 'theme_conf.dart';
import 'firebase_options.dart';

late final SharedPreferences appPrefs;
final myStepsNotifier = ValueNotifier(-1);
var stepsGoal = 5000;
//Use debugPrint() to print stuff
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  appPrefs = await SharedPreferences.getInstance();
  final themeController = ThemeController(appPrefs);
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  runApp(
    MyApp(
      themeController: themeController,
    ),
  );
}

class MyApp extends StatelessWidget {
  final ThemeController themeController;

  const MyApp({super.key, required this.themeController});

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: themeController,
      builder: (context, _) {
        return ThemeControllerProvider(
          key: key,
          controller: themeController,
          child: MaterialApp(
            title: 'Stride Squad',
            theme: buildCurrentTheme(themeController),
            home: const MainPage(title: 'Home'),
          ),
        );
      },
    );
  }
}

class MainPage extends StatefulWidget {
  const MainPage({super.key, required this.title});

  final String title;

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  // Add this eventually https://pub.dev/packages/pedometer
  var currentIndex = 0;
  var pageController = PageController(initialPage: 0);
  final screensList = [
    const Homepage(title: "Today's Steps"),
    const Leaderboard(title: "Leaderboard"),
    const Chat(title: "Chat"),
    const Profile(title: "Profile"),
  ];
  late Stream<StepCount> stepCountStream;

  void onStepCount(StepCount event) {
    myStepsNotifier.value = event.steps;
    debugPrint(myStepsNotifier.value.toString());
  }

  void onStepCountError(error) {
    debugPrint('onStepCountError: $error');
    setState(() {
      myStepsNotifier.value = -1;
    });
  }

  void initPlatformState() {
    stepCountStream = Pedometer.stepCountStream;
    stepCountStream.listen(onStepCount).onError(onStepCountError);
    if (!mounted) return;
  }

  Future<PermissionStatus> checkPermission() async {
    var status = await Permission.activityRecognition.status;
    if (status.isDenied) {
      status = await Permission.activityRecognition.request();
    }
    return status;
  }

  @override
  void initState() {
    super.initState();
    initPlatformState();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: checkPermission().isGranted,
      //snapshot is the value returned by the future
      builder: (context, AsyncSnapshot<bool> snapshot) {
        //data is the boolean value "stored" in the snapshot
        var granted = snapshot.data;
        //Checks if activity permission is granted
        if (snapshot.hasData && granted == true) {
          return Scaffold(
            bottomNavigationBar: BottomNavigationBar(
              type: BottomNavigationBarType.fixed,
              showUnselectedLabels: false,
              selectedItemColor: Colors.teal,
              unselectedItemColor: Colors.grey,
              currentIndex: currentIndex,
              onTap: (newIndex) => pageController.jumpToPage(newIndex),
              items: const [
                BottomNavigationBarItem(
                  icon: Icon(Icons.home),
                  label: 'Home',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.bar_chart),
                  label: 'Leaderboard',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.chat),
                  label: 'Chat',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.person),
                  label: 'Profile',
                ),
              ],
            ),
            body: PageView(
              controller: pageController,
              onPageChanged: (newIndex) =>
                  setState(() => currentIndex = newIndex),
              children: screensList,
            ),
          );
        } else if (!snapshot.hasData) {
          return const Scaffold(
            body: Center(
              child: CircularProgressIndicator(),
            ),
          );
        } else {
          return Scaffold(
            body: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Stride Squad needs access to your physical activity to track your steps\n",
                  style: Theme.of(context).textTheme.titleLarge,
                  textAlign: TextAlign.center,
                ),
                ElevatedButton(
                  onPressed: () async {
                    //opens the system settings for this app
                    await openAppSettings();
                  },
                  child: const Text(
                    "Open Settings",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                ElevatedButton(
                  onPressed: () => Restart.restartApp(),
                  child: const Text(
                    "Reload App",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
          );
        }
      },
    );
  }
}

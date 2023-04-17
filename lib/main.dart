import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:pedometer/pedometer.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:restart_app/restart_app.dart';
import 'package:shared_preferences/shared_preferences.dart';

//firebase imports
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'helpers/firebase_options.dart';

import 'helpers/auth_check.dart';
import 'helpers/my_objects.dart';
import 'helpers/theme_conf.dart';
import 'screens/homepage.dart';
import 'screens/chat.dart';
import 'screens/leaderboard.dart';
import 'screens/profile.dart';

var stepsGoal = 10000;
var signedIn = false;
var database = FirebaseDatabase.instance;
late final SharedPreferences appPrefs;
final themeController = ThemeController(appPrefs);
final stepsNotifier = ValueNotifier(0);
final stepsList = <StepEvent>[];

//User object
var testUser = SsUser(
  email: 'yourmom@test.com',
  password: 'hackme',
  username: '@StepsGod69',
  name: "Joe Walker",
  joinDate: DateFormat('M/d/yy').format(DateTime.now()),
  stepsMap: {
    DateFormat('M/d/yy').format(DateTime.now()): stepsNotifier.value,
  },
  stepsGoal: 10000,
);

//Use debugPrint() to print stuff
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  //initialize database
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  //gets step count from database
  appPrefs = await SharedPreferences.getInstance();
  final themeController = ThemeController(appPrefs);
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
            home: const AuthPage(title: "Auth Check"),
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
  var currentIndex = 0;
  var pageController = PageController(initialPage: 0);
  final screensList = [
    const Homepage(title: "Today's Steps"),
    const Leaderboard(title: "Leaderboard"),
    const Chat(title: "Chat"),
    const Profile(title: "Profile"),
  ];
  late Stream<StepCount> stepCountStream;

  Future<void> onStepCount(StepCount event) async {
    var thisStep = StepEvent(
      stepCount: event.steps,
      date: DateFormat("M/dd/y").format(event.timeStamp),
    );
    stepsList.add(thisStep);
    debugPrint("Steps: ${thisStep.stepCount} - At: ${thisStep.date}");
    stepsNotifier.value = event.steps;
    debugPrint("\nSteps in list:");
    for (var step in stepsList) {
      debugPrint("Steps: ${step.stepCount} - At: ${step.date}}");
      await database.ref('Steps List').push().set(step.toJson());
    }
    // await database.ref('steps').set(stepsList);
  }

  void onStepCountError(error) {
    debugPrint('onStepCountError: $error');
    setState(() {
      stepsNotifier.value = -1;
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
              iconSize: 27,
              selectedItemColor: Colors.teal,
              unselectedItemColor: Colors.grey,
              currentIndex: currentIndex,
              onTap: (newIndex) => pageController.jumpToPage(newIndex),
              items: const [
                BottomNavigationBarItem(
                  icon: Icon(Icons.directions_walk_rounded),
                  label: 'Home',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.leaderboard_rounded),
                  label: 'Leaderboard',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.message_rounded),
                  label: 'Chat',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.person_rounded),
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
              child: CircularProgressIndicator(
                color: Colors.teal,
              ),
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

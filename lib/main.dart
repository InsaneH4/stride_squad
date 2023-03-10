import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pedometer/pedometer.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'screens/homepage.dart';
import 'screens/chat.dart';
import 'screens/leaderboard.dart';
import 'screens/settings.dart';
import 'theme_conf.dart';

late final SharedPreferences appPrefs;
var myStepsNotifier = ValueNotifier('?');
//Use debugPrint() to print stuff
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  appPrefs = await SharedPreferences.getInstance();
  final themeController = ThemeController(appPrefs);
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  runApp(MyApp(
    themeController: themeController,
  ));
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
    const Homepage(title: "Home"),
    const Leaderboard(title: "Leaderboard"),
    const Chat(title: "Chat"),
    const Settings(title: "Settings"),
  ];
  late Stream<StepCount> stepCountStream;

  @override
  void initState() {
    super.initState();
    initPlatformState();
  }

  void onStepCount(StepCount event) {
    myStepsNotifier.value = event.steps.toString();
    debugPrint(myStepsNotifier.value);
  }

  void onStepCountError(error) {
    debugPrint('onStepCountError: $error');
    setState(() {
      myStepsNotifier.value = 'Step Count not available';
    });
  }

  void initPlatformState() {
    stepCountStream = Pedometer.stepCountStream;
    stepCountStream.listen(onStepCount).onError(onStepCountError);
    if (!mounted) return;
  }

  @override
  Widget build(BuildContext context) {
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
            icon: Icon(Icons.settings),
            label: 'Settings',
          ),
        ],
      ),
      body: PageView(
        controller: pageController,
        onPageChanged: (newIndex) => setState(() => currentIndex = newIndex),
        children: screensList,
      ),
    );
  }
}

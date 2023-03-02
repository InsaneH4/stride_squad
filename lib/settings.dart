import 'package:flutter/material.dart';
import 'theme_conf.dart';
import 'main.dart';
import 'profile.dart';

var isDark = appPrefs.getString("theme") == "dark" ? true : false;

class Settings extends StatefulWidget {
  const Settings({super.key, required this.title});

  final String title;

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  final MaterialStateProperty<Icon> switchIcon =
      MaterialStateProperty.resolveWith<Icon>(
    (Set<MaterialState> states) {
      if (states.contains(MaterialState.selected)) {
        return const Icon(Icons.brightness_3);
      }
      return const Icon(Icons.brightness_high);
    },
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              'In progress...',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            ElevatedButton(
              onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const Profile(title: "Profile"),
                ),
              ),
              child: const Text(
                "View Profile",
                style: TextStyle(fontSize: 26, color: Colors.white),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                isDark = !isDark;
                isDark
                    ? ThemeController.of(context).setTheme("dark", isDark)
                    : ThemeController.of(context).setTheme("light", isDark);
              },
              child: const Text('Switch Theme',
                  style: TextStyle(fontSize: 26, color: Colors.white)),
            ),
          ],
        ),
      ),
    );
  }
}

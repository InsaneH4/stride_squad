import 'package:flutter/material.dart';
import '/theme_conf.dart';
import '/main.dart';
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
      appBar: AppBar(
        title: const Text(
          'Settings',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        backgroundColor: Theme.of(context).primaryColor,
        elevation: 0,
      ),
      body: Container(
        color: Theme.of(context).primaryColor,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 24),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: const Text(
                'General',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(height: 16),
            Expanded(
              child: Container(
                color: Colors.white,
                child: ListView(
                  children: [
                    ListTile(
                      onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const Profile(title: "Profile"),
                        ),
                      ),
                      leading: Icon(
                        Icons.account_circle,
                        color: Theme.of(context).primaryColor,
                      ),
                      title: const Text(
                        'View Profile',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      trailing: const Icon(Icons.arrow_forward_ios),
                    ),
                    const Divider(),
                    ListTile(
                      onTap: () {
                        isDark = !isDark;
                        isDark
                            ? ThemeController.of(context)
                                .setTheme("dark", isDark)
                            : ThemeController.of(context)
                                .setTheme("light", isDark);
                      },
                      leading: Icon(
                        Icons.brightness_medium,
                        color: Theme.of(context).primaryColor,
                      ),
                      title: const Text(
                        'Dark Mode',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      trailing: Switch(
                        value: isDark,
                        onChanged: (value) {
                          setState(() {
                            isDark = value;
                            isDark
                                ? ThemeController.of(context)
                                    .setTheme("dark", isDark)
                                : ThemeController.of(context)
                                    .setTheme("light", isDark);
                          });
                        },
                        activeColor: Theme.of(context).primaryColor,
                      ),
                    ),
                    const Divider(),
                    ListTile(
                      onTap: () {},
                      leading: Icon(
                        Icons.logout,
                        color: Theme.of(context).primaryColor,
                      ),
                      title: const Text(
                        'Sign Out',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      trailing: const Icon(Icons.arrow_forward_ios),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

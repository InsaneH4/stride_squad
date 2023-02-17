import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

final lightTheme = ThemeData(
  useMaterial3: true,
  scaffoldBackgroundColor: Colors.white,
  primarySwatch: Colors.teal,
  textTheme: const TextTheme(
    headlineLarge: TextStyle(
      fontSize: 60,
      fontWeight: FontWeight.bold,
      color: Colors.black,
    ),
    headlineMedium: TextStyle(
      fontSize: 48,
      fontWeight: FontWeight.bold,
      color: Colors.black,
    ),
    headlineSmall: TextStyle(
      fontSize: 36,
      fontWeight: FontWeight.bold,
      color: Colors.black,
    ),
    titleLarge: TextStyle(
      fontSize: 28,
      color: Colors.black,
    ),
  ),
  floatingActionButtonTheme: const FloatingActionButtonThemeData(
    backgroundColor: Colors.teal,
    foregroundColor: Colors.white,
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      backgroundColor: Colors.teal,
      foregroundColor: Colors.white,
    ),
  ),
  appBarTheme: const AppBarTheme(
    titleTextStyle: TextStyle(
      color: Colors.black,
      fontWeight: FontWeight.bold,
      fontSize: 48,
    ),
  ),
  bottomNavigationBarTheme: const BottomNavigationBarThemeData(
    backgroundColor: Colors.white,
  ),
);

final darkTheme = ThemeData(
  useMaterial3: true,
  scaffoldBackgroundColor: Colors.black,
  primarySwatch: Colors.teal,
  textTheme: const TextTheme(
    headlineLarge: TextStyle(
      fontSize: 60,
      fontWeight: FontWeight.bold,
      color: Colors.white,
    ),
    headlineMedium: TextStyle(
      fontSize: 48,
      fontWeight: FontWeight.bold,
      color: Colors.white,
    ),
    headlineSmall: TextStyle(
      fontSize: 36,
      fontWeight: FontWeight.bold,
      color: Colors.white,
    ),
    titleLarge: TextStyle(
      fontSize: 28,
      color: Colors.white,
    ),
  ),
  floatingActionButtonTheme: const FloatingActionButtonThemeData(
    backgroundColor: Colors.teal,
    foregroundColor: Colors.white,
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      backgroundColor: Colors.teal,
      foregroundColor: Colors.white,
    ),
  ),
  appBarTheme: const AppBarTheme(
    titleTextStyle: TextStyle(
      color: Colors.white,
      fontWeight: FontWeight.bold,
      fontSize: 48,
    ),
    backgroundColor: Colors.black,
  ),
  bottomNavigationBarTheme: const BottomNavigationBarThemeData(
    backgroundColor: Colors.black,
  ),
);


ThemeData buildCurrentTheme(ThemeController themeController) {
  switch (themeController.currentTheme) {
    case "dark":
      return darkTheme;
    case "light":
      return lightTheme;
    default:
      return ThemeData();
  }
}

class ThemeController extends ChangeNotifier {
  static const themePrefKey = 'theme';
  static const isDarkPrefKey = 'isDark';

  ThemeController(this._prefs) {
    // load theme from preferences on initialization
    _currentTheme = _prefs.getString(themePrefKey) ?? 'light';
  }

  final SharedPreferences _prefs;
  late String _currentTheme;

  /// get the current theme
  String get currentTheme => _currentTheme;

  void setTheme(String theme, bool isDark) {
    _currentTheme = theme;
    // notify the app that the theme was changed
    notifyListeners();

    // store updated theme on disk
    _prefs.setString(themePrefKey, theme);
    _prefs.setBool(isDarkPrefKey, isDark);
  }

  /// get the controller from any page of your app
  static ThemeController of(BuildContext context) {
    final provider =
        context.dependOnInheritedWidgetOfExactType<ThemeControllerProvider>()
            as ThemeControllerProvider;
    return provider.controller;
  }
}

/// provides the theme controller to any page of your app
class ThemeControllerProvider extends InheritedWidget {
  const ThemeControllerProvider(
      {super.key, required this.controller, required super.child});

  final ThemeController controller;

  @override
  bool updateShouldNotify(ThemeControllerProvider oldWidget) =>
      controller != oldWidget.controller;
}

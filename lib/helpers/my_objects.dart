import 'dart:core';
import 'package:firebase_database/firebase_database.dart';

class SsUser {
  String email;
  String username;
  String password;
  String joinDate;
  String name;
  int stepsGoal;
  Map<String, String> stepsMap;

  SsUser({
    required this.email,
    required this.username,
    required this.password,
    required this.joinDate,
    required this.name,
    required this.stepsMap,
    required this.stepsGoal,
  });

  Map<String, dynamic> toJson() => {
        'email': email,
        'username': username,
        'password': password,
        'joinDate': joinDate,
        'name': name,
        'stepsGoal': stepsGoal,
        'stepDates': stepsMap.keys.toList(),
        'stepCounts': stepsMap.values.toList(),
      };

  factory SsUser.fromJson(DatabaseEvent snapshot) {
    //Converts JSON syntax from firebase to object

    //Stores the data from firebase in a map
    var fbData = snapshot.snapshot.value as Map<dynamic, dynamic>;
    //Converts the stepDates and stepCounts lists to iterables    
    Iterable<String> stepDates = Iterable.castFrom(fbData['stepDates']);
    Iterable<String> stepCounts = Iterable.castFrom(fbData['stepCounts']);
    //Creates a map from the two lists
    var stepsMap = Map<String, String>.fromIterables(stepDates, stepCounts);
    //Returns the user object
    return SsUser(
      email: fbData['email'],
      username: fbData['username'],
      password: fbData['password'],
      joinDate: fbData['joinDate'],
      name: fbData['name'],
      stepsMap: stepsMap,
      stepsGoal: fbData['stepsGoal'],
    );
  }
}

class Team {
  String teamName;
  List<SsUser> teamMembers;
  int teamSteps;
  int teamGoal;

  Team({
    required this.teamName,
    required this.teamMembers,
    required this.teamSteps,
    required this.teamGoal,
  });
}

class StepEvent {
  int stepCount;
  String date;

  StepEvent({
    required this.stepCount,
    required this.date,
  });

//Converts object to JSON syntax for firebase
  Map<String, dynamic> toJson() => {
        'stepCount': stepCount,
        'date': date.toString(),
      };
}

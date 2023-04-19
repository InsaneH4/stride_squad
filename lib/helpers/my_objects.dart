import 'dart:core';
import 'package:firebase_database/firebase_database.dart';

class SsUser {
  String email;
  String username;
  String password;
  String joinDate;
  String name;
  int stepsGoal;
  Map<Object?, Object?> stepsMap;

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
        "steps": stepsMap,
      };

  factory SsUser.fromJson(DatabaseEvent snapshot) {
    //Converts JSON syntax from firebase to object

    //Stores the data from firebase in a map
    var fbData = snapshot.snapshot.value as Map<dynamic, dynamic>;
    //Converts the stepDates and stepCounts lists to iterables
    //Creates a map from the two lists
    //Returns the user object
    return SsUser(
      //?? operator is a null check, if the value is null, it returns "error"
      email: fbData['email'] ?? "error",
      username: fbData['username'] ?? "error",
      password: fbData['password'] ?? "error",
      joinDate: fbData['joinDate'] ?? "error",
      name: fbData['name'] ?? "error",
      stepsMap: fbData['steps'] ?? "error",
      stepsGoal: fbData['stepsGoal'] ?? "error",
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
  String stepCount;
  String date;

  StepEvent({
    required this.stepCount,
    required this.date,
  });

//Converts object to JSON syntax for firebase
  Map<String, String> toJson() => {
        date: stepCount,
      };
}

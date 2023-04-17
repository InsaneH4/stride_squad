import 'dart:core';

class SsUser {
  String email;
  String username;
  String password;
  String joinDate;
  String name;
  Map<String, int> stepsMap;
  int stepsGoal;

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
        'stepDates': stepsMap.keys.toList(),
        'stepCounts': stepsMap.values.toList(),
        'stepsGoal': stepsGoal,
      };
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

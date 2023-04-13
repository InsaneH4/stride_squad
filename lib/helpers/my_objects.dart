import 'dart:core';

class User {
  String username;
  String joinDate;
  String firstName;
  String lastName;
  Map<String, int> steps;
  int stepsGoal;

  User({
    required this.username,
    required this.joinDate,
    required this.firstName,
    required this.lastName,
    required this.steps,
    required this.stepsGoal,
  });
}

class Team {
  String teamName;
  List<User> teamMembers;
  int teamSteps;
  int teamGoal;

  Team({
    required this.teamName,
    required this.teamMembers,
    required this.teamSteps,
    required this.teamGoal,
  });
}

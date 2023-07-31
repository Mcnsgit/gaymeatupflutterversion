import 'package:flutter/foundation.dart';

class User {
  final String position;
  final String lookingFor;
  final int age;
  final String location;
  final bool isOnline;

  User(this.position, this.lookingFor, this.age, this.location, this.isOnline);

  get username => null;

  applyFilters(
      {required String? position,
      required String? lookingFor,
      required int? ageRange,
      required String? location}) {}

  listUser() {}
}

class UserService extends ChangeNotifier {
  final List<User> users;

  UserService(this.users);

  List<User> filterByPosition(String? position, List<User> users) {
    if (position == null || position.isEmpty) {
      return users;
    }
    return users.where((user) => user.position == position).toList();
  }

  List<User> filterByLookingFor(String? lookingFor, List<User> users) {
    if (lookingFor == null || lookingFor.isEmpty) {
      return users;
    }
    return users.where((user) => user.lookingFor == lookingFor).toList();
  }

  List<User> filterByAgeRange( var ageRange, List<User> users) {
    if (ageRange == null) {
      return users;
    }
    return users
        .where((user) => user.age >= ageRange.start && user.age <= ageRange.end)
        .toList();
  }

  List<User> filterByLocation(String? location, List<User> users) {
    if (location == null || location.isEmpty) {
      return users;
    }
    return users.where((user) => user.location == location).toList();
  }

  List<User> filterByOnlineStatus(List<User> users) {
    return users.where((user) => user.isOnline).toList();
  }

  List<User> applyFilters({
    String? position,
    String? lookingFor,
    int? ageRange,
    String? location,
  }) {
    List<User> filteredUsers = users;
    filteredUsers = filterByPosition(position, filteredUsers);
    filteredUsers = filterByLookingFor(lookingFor, filteredUsers);
    filteredUsers = filterByAgeRange(ageRange, filteredUsers);
    filteredUsers = filterByLocation(location, filteredUsers);
    filteredUsers = filterByOnlineStatus(filteredUsers);

    notifyListeners();

    return filteredUsers;
  }

  listUser() {}
}
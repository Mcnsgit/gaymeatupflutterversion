import 'package:flutter/material.dart';
import '../services/user_service.dart';

List<User> applyFilters({
  required List<User> users,
  required String? position,
  required String? lookingFor,
  required RangeValues? ageRange,
  required String? location,
}) {
  List<User> filteredUsers = users;
  filteredUsers = filterByPosition(position, filteredUsers);
  filteredUsers = filterByLookingFor(lookingFor, filteredUsers);
  filteredUsers = filterByAgeRange(ageRange, filteredUsers);
  filteredUsers = filterByLocation(location, filteredUsers);
  return filteredUsers;
}

List<User> filterByPosition(String? position, List<User> userName) {
  if (position == null || position.isEmpty) {
    return userName;
  } else {
    return userName.where((user) => user.position == position).toList();
  }
}

List<User> filterByLookingFor(String? lookingFor, List<User> userName) {
  if (lookingFor == null || lookingFor.isEmpty) {
    return userName;
  } else {
    return userName.where((user) => user.lookingFor == lookingFor).toList();
  }
}

List<User> filterByAgeRange(RangeValues? ageRange, List<User> userName) {
  if (ageRange == null) {
    return userName;
  } else {
    return userName
        .where((user) => user.age >= ageRange.start && user.age <= ageRange.end)
        .toList();
  }
}

List<User> filterByLocation(String? location, List<User> userName) {
  if (location == null || location.isEmpty) {
    return userName;
  } else {
    return userName.where((user) => user.location == location).toList();
  }
}

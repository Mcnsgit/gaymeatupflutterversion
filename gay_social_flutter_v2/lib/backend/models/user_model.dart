// class User {
//   final String name;
//   final int age;
//   final String position;
//   final String lookingFor;
//   final String location;
//   User({
//     required this.name,
//     required this.age,
//     required this.position,
//     required this.lookingFor,
//     required this.location,
//   });
//   factory User.fromJson(Map<String, dynamic> json) {
//     return User(
//       name: json['name'],
//       age: json['age'],
//       position: json['position'],
//       lookingFor: json['lookingFor'],
//       location: json['location'],
//     );
//   }
//   String get username => name;
//   Map<String, dynamic> toJson() {
//     return {
//       'name': name,
//       'age': age,
//       'position': position,
//       'lookingFor': lookingFor,
//       'location': location,
//     };
//   }
// }

// class UserFilter {
//   final String position;
//   final String lookingFor;
//   final int age;
//   final String location;
//   final bool isOnline;
//   UserFilter(
//       this.position, this.lookingFor, this.age, this.location, this.isOnline);
//   // Removed the unnecessary getter username
//   void applyFilters(
//       {required String position,
//       required String lookingFor,
//       required var ageRange,
//       required String location}) {
//     // Implement the logic to apply filters
//   }
//   void listUser() {
//     // Implement the logic to list users
//   }
// }

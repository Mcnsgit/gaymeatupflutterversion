class User {
  final String name;
  final int age;
  final String position;
  final String lookingFor;
  final String location;

  User({
    required this.name,
    required this.age,
    required this.position,
    required this.lookingFor,
    required this.location,
  });


  // Factory method to create a User object from a map (JSON-like object)
  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      name: json['name'],
      age: json['age'],
      position: json['position'],
      lookingFor: json['lookingFor'],
      location: json['location'],
    );
  }

  // Method to convert a User object to a map (JSON-like object)
  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'age': age,
      'position': position,
      'lookingFor': lookingFor,
      'location': location,
    };
  }
}

class UserFilter {
  final String position;
  final String lookingFor;
  final int age;
  final String location;
  final bool isOnline;

  UserFilter(this.position, this.lookingFor, this.age, this.location, this.isOnline);

  get username => null;

  applyFilters({required String position, required String lookingFor, required var ageRange, required String location}) {}

  listUser() {}
}
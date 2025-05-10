class UserModel {
  final String firstName;
  final String lastName;
  final int createdAt;

  UserModel({
    required this.firstName,
    required this.lastName,
    required this.createdAt,
  });

  Map<String, dynamic> toMap() {
    return {
      'firstName': firstName,
      'lastName': lastName,
      'createdAt': createdAt,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      firstName: map['firstName'],
      lastName: map['lastName'],
      createdAt: map['createdAt'],
    );
  }
}

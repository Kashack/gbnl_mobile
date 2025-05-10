class UserModel {
  int? id;
  final String firstName;
  final String lastName;
  final int createdAt;

  UserModel({
    this.id,
    required this.firstName,
    required this.lastName,
    required this.createdAt,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'firstName': firstName,
      'lastName': lastName,
      'createdAt': createdAt,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      id: map['id'],
      firstName: map['firstName'],
      lastName: map['lastName'],
      createdAt: map['createdAt'],
    );
  }
}

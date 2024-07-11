class User {
  final int? id;
  late final String username;
  late final String email;
  final String password;
  final String userAddress;
  final String userPhoneNumber;
  final String createdAt;
  final String updatedAt;

  User({
    this.id,
    required this.username,
    required this.email,
    required this.password,
    required this.userAddress,
    required this.userPhoneNumber,
    required this.createdAt,
    required this.updatedAt,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'username': username,
      'email': email,
      'password': password,
      'userAddress': userAddress,
      'userPhoneNumber': userPhoneNumber,
      'createdAt': createdAt,
      'updatedAt': updatedAt,
    };
  }

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      id: map['id'],
      username: map['username'],
      email: map['email'],
      password: map['password'],
      userAddress: map['userAddress'],
      userPhoneNumber: map['userPhoneNumber'],
      createdAt: map['createdAt'],
      updatedAt: map['updatedAt'],
    );
  }
}

class AuthCredentials {
  final String email;
  final String password;

  AuthCredentials({
    required this.email,
    required this.password,
  });

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> map = {};

    map['email'] = email;
    map['password'] = password;

    return map;
  }
}

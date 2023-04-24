class User {
  String username;
  String password;
  String token;

  User({required this.username, required this.password, required this.token});

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      username: json['username'],
      password: json['password'],
      token: json['token'],
    );
  }

  void setUser(param0) {}
}

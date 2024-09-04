class User {
  int id;
  String email;
  String firstName;
  String lastName;
  String avatar;

  User(
      {required this.id,
      required this.email,
      required this.firstName,
      required this.lastName,
      required this.avatar});

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'],
      email: json['email'],
      firstName: json['first_name'],
      lastName: json['last_name'],
      avatar: json['avatar'],
    );
  }
}

class UserData {
  List<User>? data;

  UserData({
    this.data,
  });

  UserData.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <User>[];
      json['data'].forEach((v) {
        data!.add(User.fromJson(v));
      });
    }
  }
}

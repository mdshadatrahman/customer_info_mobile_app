// To parse this JSON data, do
//
//     final user = userFromJson(jsonString);

import 'dart:convert';

User userFromJson(String str) => User.fromJson(json.decode(str));

String userToJson(User data) => json.encode(data.toJson());

class User {
  User({
    this.user,
  });

  UserClass? user;

  factory User.fromJson(Map<String, dynamic> json) => User(
        user: json["user"] == null ? null : UserClass.fromJson(json["user"]),
      );

  Map<String, dynamic> toJson() => {
        "user": user?.toJson(),
      };
}

class UserClass {
  UserClass({
    this.id,
    this.power,
    this.name,
    this.phone,
    this.token,
  });

  int? id;
  int? power;
  String? name;
  String? phone;
  String? token;

  factory UserClass.fromJson(Map<String, dynamic> json) => UserClass(
        id: json["id"],
        power: json["power"],
        name: json["name"],
        phone: json["phone"],
        token: json["token"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "power": power,
        "name": name,
        "phone": phone,
        "token": token,
      };
}

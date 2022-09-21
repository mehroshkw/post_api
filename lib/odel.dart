// To parse this JSON data, do
//
//     final loginPost = loginPostFromJson(jsonString);

import 'dart:convert';

LoginPost loginPostFromJson(String str) => LoginPost.fromJson(json.decode(str));

String loginPostToJson(LoginPost data) => json.encode(data.toJson());

class LoginPost {
  LoginPost({
    this.status,
    this.data,
    this.hobbies,
    this.sports,
    this.foods,
  });

  String? status;
  Data? data;
  List<dynamic>? hobbies;
  List<dynamic>? sports;
  List<dynamic>? foods;

  factory LoginPost.fromJson(Map<String, dynamic> json) => LoginPost(
        status: json["status"],
        data: Data.fromJson(json["data"]),
        hobbies: List<dynamic>.from(json["hobbies"].map((x) => x)),
        sports: List<dynamic>.from(json["sports"].map((x) => x)),
        foods: List<dynamic>.from(json["foods"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "data": data!.toJson(),
        "hobbies": List<dynamic>.from(hobbies!.map((x) => x)),
        "sports": List<dynamic>.from(sports!.map((x) => x)),
        "foods": List<dynamic>.from(foods!.map((x) => x)),
      };
}

class Data {
  Data({
    this.id,
    this.name,
    this.email,
    this.isSocial,
    this.profileImage,
  });

  int? id;
  dynamic? name;
  String? email;
  dynamic? isSocial;
  dynamic? profileImage;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        id: json["id"],
        name: json["name"],
        email: json["email"],
        isSocial: json["is_social"],
        profileImage: json["profile_image"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "email": email,
        "is_social": isSocial,
        "profile_image": profileImage,
      };
}

import 'dart:convert';

import 'package:api_register_login/odel.dart';
import 'package:http/http.dart' as http;

class ApiServices {
  String registerURL = "https://btrlaravel.stepinnsolution.com/api/register";
  String loginURL = "https://btrlaravel.stepinnsolution.com/api/login";

  Future<void> registerApi(
      String email, String password, String name, String confirm_pass) async {
    final response = await http.post(Uri.parse(registerURL),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String, String>{
          "name": name,
          "confirm_password": confirm_pass,
          "email": email,
          "password": password
        }));
    print(response.body.toString());
  }

  Future<LoginPost?> loginApi(String email, String password) async {
    final response = await http.post(Uri.parse(loginURL),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(
          <String, String>{"email": email, "password": password},
        ));
    if (response.statusCode == 200) {
      print(response.body);
      return LoginPost.fromJson(jsonDecode(response.body));
    }

    print(response.body.toString());
  }
}

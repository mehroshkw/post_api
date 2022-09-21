import 'package:api_register_login/api_services.dart';
import 'package:api_register_login/getcontroller.dart';
import 'package:api_register_login/odel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class MyWidget extends StatefulWidget {
  @override
  State<MyWidget> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> {
  @override
  Widget build(BuildContext context) {
    HomeController my = Get.find<HomeController>();
    return Scaffold(
        body: FutureBuilder<LoginPost?>(
            future: ApiServices().loginApi(
                my.emailController.value.text, my.passController.value.text),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                var data = snapshot.data;
                return Center(
                  child: ListTile(
                    leading:
                        Text('Welcome back  ${data!.data!.email.toString()}'),
                  ),
                );
              }
              return Center(child: CircularProgressIndicator());
            }));
  }
}

import 'package:api_register_login/api_services.dart';
import 'package:api_register_login/getcontroller.dart';
import 'package:api_register_login/home.dart';
import 'package:api_register_login/register.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/get_instance.dart';

class Login extends StatefulWidget {
  Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    HomeController myC = Get.put(HomeController());
    return Scaffold(
      appBar: AppBar(
        title: const Text("Register"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(children: [
          const SizedBox(
            height: 40,
          ),
          const Text(
            "Login Your Account",
            style: TextStyle(
                color: Colors.blue, fontSize: 24, fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            height: 20.0,
          ),
          TextFormField(
            controller: myC.emailController.value,
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              hintText: 'Enter Your Email',
            ),
          ),
          const SizedBox(
            height: 10.0,
          ),
          TextFormField(
            controller: myC.passController.value,
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              hintText: 'Enter Your Password',
            ),
          ),
          const SizedBox(
            height: 10.0,
          ),
          ElevatedButton(
              onPressed: () {
                ApiServices().loginApi(myC.emailController.value.text,
                    myC.passController.value.text);
                // Fluttertoast.showToast(
                //     msg: "Login Successful",
                //     toastLength: Toast.LENGTH_SHORT,
                //     gravity: ToastGravity.BOTTOM,
                //     textColor: Colors.white,
                //     fontSize: 16.0);

                if (ApiServices().loginApi(myC.emailController.value.text,
                        myC.passController.value.text) !=
                    null) {
                  Fluttertoast.showToast(
                      msg: "Welcome ${myC.emailController.value.text}",
                      toastLength: Toast.LENGTH_SHORT,
                      gravity: ToastGravity.BOTTOM,
                      textColor: Colors.white,
                      fontSize: 16.0);
                  Navigator.push(context, MaterialPageRoute(builder: (_) {
                    return MyWidget();
                  }));
                } else {
                  Fluttertoast.showToast(
                      msg: "An Error Occured Please Try Again",
                      toastLength: Toast.LENGTH_SHORT,
                      gravity: ToastGravity.BOTTOM,
                      textColor: Colors.white,
                      fontSize: 16.0);
                }
              },
              child: const Text("Login")),
          const SizedBox(
            height: 30.0,
          ),
          TextButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (_) {
                  return Register();
                }));
              },
              child: const Text(
                "Don't Have an Account?  Register",
                style: TextStyle(
                  color: Colors.blue,
                ),
              ))
        ]),
      ),
    );
  }
}

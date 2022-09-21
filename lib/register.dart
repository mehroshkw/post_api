import 'package:api_register_login/api_services.dart';
import 'package:api_register_login/images_picker/homepage.dart';
import 'package:api_register_login/login.dart';
import 'package:flutter/material.dart';

class Register extends StatefulWidget {
  Register({Key? key}) : super(key: key);

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passController = TextEditingController();
  TextEditingController cpassController = TextEditingController();

  @override
  Widget build(BuildContext context) {
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
            "Create An Account",
            style: TextStyle(
                color: Colors.blue, fontSize: 24, fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            height: 20.0,
          ),
          TextFormField(
            controller: nameController,
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              hintText: 'Name',
            ),
          ),
          const SizedBox(
            height: 10.0,
          ),
          TextFormField(
            controller: emailController,
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              hintText: 'Enter Your Email',
            ),
          ),
          const SizedBox(
            height: 10.0,
          ),
          TextFormField(
            controller: passController,
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              hintText: 'Enter Your Password',
            ),
          ),
          const SizedBox(
            height: 10.0,
          ),
          TextFormField(
            controller: cpassController,
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              hintText: 'Re-Enter Your Password',
            ),
          ),
          ElevatedButton(
              onPressed: () {
                ApiServices().registerApi(
                    emailController.text,
                    passController.text,
                    nameController.text,
                    cpassController.text);
              },
              child: const Text("Register")),
          const SizedBox(
            height: 30.0,
          ),
          TextButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (_) {
                  return Login();
                }));
              },
              child: const Text(
                "Already have an Account?  Login",
                style: TextStyle(
                  color: Colors.blue,
                ),
              )),
               const SizedBox(
            height: 30.0,
          ),
          TextButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (_) {
                  return const MediaHome();
                }));
              },
              child: const Text(
                "Click Here to Go to Media Upload Form",
                style: TextStyle(
                  color: Colors.blue,
                ),
              ))
        ]),
      ),
    );
  }
}

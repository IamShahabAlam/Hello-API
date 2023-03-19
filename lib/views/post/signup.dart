import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:hello_api_app/components/appbar.dart';
import 'package:hello_api_app/constants/constants.dart';
import 'package:hello_api_app/views/post/login.dart';
import 'package:http/http.dart';

class SignUpPage extends StatefulWidget {
  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  void signUp(String email, password) async {
    try {
      Response response = await post(Uri.parse(kRegisterURL), body: {
        "email": email,  // keys must be same as API
        "password": password,
      });

      if (response.statusCode == 200) {
        var data = jsonDecode(response.body.toString());
        print(data);
        print("TOKEN : " + data["token"]);
        print("ID : " + data["id"].toString());
        print("******\nAccount Created Successfully\n******");
      } else {
        print("******\nFAILED\n******");
      }
    } catch (e) {
      print(e.toString()); // printing msg if error found
    }
  }

  @override
  Widget build(BuildContext context) {
    HeightWidth(context);
    return Scaffold(
      appBar: appBar("Sign Up Page"),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              0.1.ph,
              TextField(
                controller: emailController,
                decoration: const InputDecoration(
                    enabled: true,
                    enabledBorder: OutlineInputBorder(),
                    prefixIcon: Icon(Icons.email),
                    hintText: "Email"),
              ),
              0.05.ph,
              TextField(
                obscureText: true,
                controller: passwordController,
                decoration: const InputDecoration(
                    enabled: true,
                    enabledBorder: OutlineInputBorder(),
                    prefixIcon: Icon(Icons.key),
                    hintText: "Password"),
              ),
              0.1.ph,
              ElevatedButton(
                  style: ElevatedButton.styleFrom(shape: StadiumBorder()),
                  onPressed: () {
                    signUp(emailController.text.toString(),
                        passwordController.text.toString());
                  },
                  child: Text("Sign Up")),
              0.05.ph,
              ElevatedButton(
                  style: ElevatedButton.styleFrom(shape: StadiumBorder()),
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => SignIn(email_c: emailController, password_c: passwordController,)));
                  },
                  child: Text("Sign IN")),
            ],
          ),
        ),
      ),
    );
  }
}

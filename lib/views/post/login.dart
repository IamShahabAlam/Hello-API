import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:hello_api_app/constants/constants.dart';
import 'package:http/http.dart';

import '../../components/appbar.dart';

class SignIn extends StatefulWidget {
  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  void signIn(String email, password) async {
    try {
      Response response = await post(Uri.parse(kLoginURL), body: {
        "email": email,
        "password": password,
      });

      if (response.statusCode == 200) {
        var data = jsonDecode(response.body.toString());
        print(data);
        print(data["token"]);
        print("Login Successfully");
      } else
        print("FAILED");
    } catch (e) {
      print(e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    HeightWidth(context);
    return Scaffold(
      appBar: appBar("Sign IN Page"),
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
                    signIn(emailController.text.toString(),
                        passwordController.text.toString());
                  },
                  child: Text("Sign IN"))
            ],
          ),
        ),
      ),
    );
  }
}

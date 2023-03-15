import 'package:flutter/material.dart';
import 'package:hello_api_app/components/appbar.dart';
import 'package:hello_api_app/constants/constants.dart';

class SignUpPage extends StatefulWidget {
  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
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
                  onPressed: () {},
                  child: Text("Sign Up"))
            ],
          ),
        ),
      ),
    );
  }
}

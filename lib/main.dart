import 'package:flutter/material.dart';
import 'package:hello_api_app/views/posts.dart';
import 'package:hello_api_app/views/photos.dart';
import 'package:hello_api_app/views/all_data.dart';
import 'package:hello_api_app/views/users.dart';
import 'package:hello_api_app/views/users_woModel.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        
        primarySwatch: Colors.blue,
      ),
      home: 
      AllDataPage(),
      // UsersPage(),
      // UsersWoModelPage(),
      // PhotosPage(),
      //  Home(),
    );
  }
}


import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hello_api_app/views/posts.dart';
import 'package:hello_api_app/views/photos.dart';
import 'package:hello_api_app/views/all_data.dart';
import 'package:hello_api_app/views/shops_data.dart';
import 'package:hello_api_app/views/users.dart';
import 'package:hello_api_app/views/users_woModel.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  ByteData data = await PlatformAssetBundle().load('assets/ca/lets-encrypt-r3.pem');
  SecurityContext.defaultContext.setTrustedCertificatesBytes(data.buffer.asUint8List());

  
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
      ShopsDataPage(),
      // AllDataPage(),
      // UsersPage(),
      // UsersWoModelPage(),
      // PhotosPage(),
      //  Home(),
    );
  }
}

// class MyHttpOverrides extends HttpOverrides {
//   @override
//   HttpClient createHttpClient(SecurityContext? context) {
//     return super.createHttpClient(context)
//       ..badCertificateCallback =
//           (X509Certificate cert, String host, int port) => true;
//   }
// }
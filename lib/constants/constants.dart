import 'package:flutter/material.dart';

// Constants ----------------------------------------------

const String kBaseURL = "https://jsonplaceholder.typicode.com";
const String kPostsURL = "/posts";
const String kPhotosURL = "/photos";
const String kUsersURL = '/users';
const String kAllDataURL =
    ''; //'https://eob48atlrf4pfn8.m.pipedream.net';  //iamshahabalam
const String kShopsDataURL =
    ''; // 'https://eo7jnkqb4wj8xpn.m.pipedream.net';  //shbsync

// POST API ------------

const String kRegisterURL = "https://reqres.in/api/register";
const String kLoginURL = "https://reqres.in/api/login";
const String kImageUpload = "https://fakestoreapi.com/products";

// Constant Text

const String kLoading = "Loading";
const String kDescription = "Description :";

// Colors ----------------------------------------------

const Color kTransparent = Colors.transparent;
const Color kRed = Colors.red;
const Color kBlueMain = Color(0xFF2196F3);
const Color kBlue1 = Color(0xFFCAE2F7);
const Color kBlue2 = Color(0xFF90CAF9);

// TextStyling ----------------------------------------------

const TextStyle kTextbold = TextStyle(fontWeight: FontWeight.bold);
const TextAlign kTextCenter = TextAlign.center;
const TextStyle kTextDisable = TextStyle(
    decoration: TextDecoration.lineThrough,
    fontWeight: FontWeight.bold,
    color: Color(0xFF9E9E9E));
const BoxShadow kShadow = BoxShadow(
    offset: Offset(2, 3),
    blurRadius: 6.0,
    spreadRadius: 1.0,
    color: Colors.grey);

// MediaQuery ----------------------------------------------

late double h, w;

void HeightWidth(BuildContext context) {
  h = MediaQuery.of(context).size.height;
  w = MediaQuery.of(context).size.width;
}

// Sized Box ----------------------------------------------

//  must call HeightWidth(context);
// Usage:  0.2.ph
extension EmptyPadding on num {
  SizedBox get ph => SizedBox(
        height: h * toDouble(),
      );

  SizedBox get pw => SizedBox(
        width: w * toDouble(),
      );
}
// String Casing ----------------------------------------------

extension StringCasingExtension on String {
  String toCapitalized() =>
      length > 0 ? '${this[0].toUpperCase()}${substring(1).toLowerCase()}' : '';
  String toTitleCase() => replaceAll(RegExp(' +'), ' ')
      .split(' ')
      .map((str) => str.toCapitalized())
      .join(' ');
}

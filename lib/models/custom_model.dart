
import 'package:flutter/material.dart';

class CustomModel {
  IconData? icon;
  Color? bgcolor, boxcolor;
  CustomModel({this.icon, this.bgcolor, this.boxcolor});
}

List customList = [
  CustomModel(
      icon: Icons.abc, bgcolor: Colors.redAccent, boxcolor: Colors.black),
  CustomModel(
      icon: Icons.ac_unit, bgcolor: Colors.amberAccent, boxcolor: Colors.green),
  CustomModel(
      icon: Icons.access_alarm, bgcolor: Colors.black12, boxcolor: Colors.pink),
  CustomModel(
      icon: Icons.zoom_out_sharp,
      bgcolor: Colors.yellowAccent,
      boxcolor: Colors.red),
  CustomModel(
      icon: Icons.youtube_searched_for_rounded,
      bgcolor: Colors.lightGreenAccent,
      boxcolor: Colors.brown),
  CustomModel(
      icon: Icons.safety_check,
      bgcolor: Colors.blueAccent,
      boxcolor: Colors.yellow),
  CustomModel(
      icon: Icons.dangerous, bgcolor: Colors.white70, boxcolor: Colors.purple),
  CustomModel(
      icon: Icons.wallet, bgcolor: Colors.amberAccent, boxcolor: Colors.lime),
  CustomModel(
      icon: Icons.qr_code,
      bgcolor: Colors.tealAccent,
      boxcolor: Colors.lightGreen),
  CustomModel(
      icon: Icons.face, bgcolor: Colors.redAccent, boxcolor: Colors.black),
  CustomModel(
      icon: Icons.radar,
      bgcolor: Colors.orangeAccent,
      boxcolor: Colors.blueGrey),
  CustomModel(
      icon: Icons.gamepad, bgcolor: Colors.blueAccent, boxcolor: Colors.yellow),
  CustomModel(
      icon: Icons.tab, bgcolor: Colors.cyanAccent, boxcolor: Colors.red),
];
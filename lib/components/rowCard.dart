import 'package:flutter/material.dart';

Widget rowCard(String type , value) {
  return Padding(
    padding: const EdgeInsets.all(5.0),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(type),
        Text(value),
      ],
    ),
  );
}

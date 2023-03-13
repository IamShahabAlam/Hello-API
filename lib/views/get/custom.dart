import 'package:flutter/material.dart';
import 'package:hello_api_app/components/appbar.dart';
import 'package:hello_api_app/constants/constants.dart';

import '../../models/get/custom_model.dart';


class CustomPage extends StatefulWidget {
  @override
  State<CustomPage> createState() => _CustomPageState();
}

class _CustomPageState extends State<CustomPage> {
  @override
  Widget build(BuildContext context) {
    HeightWidth(context);
    return Scaffold(
      backgroundColor: Colors.grey,
      appBar: appBar("Custom Page"),
      body: Column(
        children: [
          Expanded(
              child: ListView.builder(
            itemCount: customList.length,
            itemBuilder: ((context, i) {
              return Container(
                margin: EdgeInsets.all(10.0),
                height: h * 0.1,
                width: w * 1,
                color: customList[i].bgcolor,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    CircleAvatar(
                      backgroundColor: customList[i].boxcolor,
                      radius: 20.0,
                      child: Icon(customList[i].icon),
                    ),
                    Text(i.toString()),
                  ],
                ),
              );
            }),
          ))
        ],
      ),
    );
  }
}

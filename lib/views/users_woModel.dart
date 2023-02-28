import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:hello_api_app/components/appbar.dart';
import 'package:hello_api_app/components/rowCard.dart';
import 'package:hello_api_app/constants/constants.dart';
import 'package:http/http.dart' as http;

class UsersWoModelPage extends StatefulWidget {
  @override
  State<UsersWoModelPage> createState() => _UsersWoModelPageState();
}

class _UsersWoModelPageState extends State<UsersWoModelPage> {
  var data;
  Future<void> getUsersAPIwoModel() async {
    final response = await http.get(Uri.parse(kBaseURL + kUsersURL));

    if (response.statusCode == 200) {
      data = jsonDecode(response.body.toString());
    } else {
      return data;
    }
    return data;
  }

  @override
  Widget build(BuildContext context) {
    HeightWidth(context);
    return Scaffold(
      appBar: appBar("Users API Without Model"),
      body: Column(
        children: [
          FutureBuilder(
            future: getUsersAPIwoModel(),
            builder: ((context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Text("Loading");
              } else {
                return Expanded(
                  child: ListView.builder(
                    itemCount: data.length,
                    itemBuilder: ((context, i) {
                      return Card(
                        child: Column(
                          children: [
                            rowCard("Name", data[i]["name"]),
                            rowCard("Email", data[i]['email']),
                            rowCard("Phone", data[i]['phone']),
                            rowCard("Address",
                                   " ${data[i]['address']['street']} , ${data[i]['address']['city']} , ${data[i]['address']['zipcode']} "
                                    ),
                            rowCard("Company", data[i]['company']['name']),
                          ],
                        ),
                      );
                    }),
                  ),
                );
              }
            }),
          )
        ],
      ),
    );
  }
}

import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:hello_api_app/components/appbar.dart';
import 'package:hello_api_app/constants/constants.dart';
import 'package:http/http.dart' as http;

import '../../models/get/users_model.dart';

class UsersPage extends StatefulWidget {
  @override
  State<UsersPage> createState() => _UsersPageState();
}

class _UsersPageState extends State<UsersPage> {
  List<UsersModel> usersList = [];

  Future<List<UsersModel>> getUsersApi() async {
    final response = await http.get(Uri.parse(kBaseURL + kUsersURL));
    var data = jsonDecode(response.body.toString());

    if (response.statusCode == 200) {
      for (var i in data) {
        usersList.add(UsersModel.fromJson(i));
      }
      return usersList;
    } else {
      return usersList;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar("Users API"),
      body: Column(
        children: [
          FutureBuilder(
              future: getUsersApi(),
              builder: ((context, AsyncSnapshot<List<UsersModel>> snapshot) {
                if (!snapshot.hasData) {
                  return AlertDialog(
                    title: CircularProgressIndicator(),
                  );
                } else {
                  return Expanded(
                    child: ListView.builder(
                      itemCount: usersList.length,
                      itemBuilder: ((context, i) {
                        return ListTile(
                          trailing: Text(usersList[i].id.toString()),
                          title: Text("CITY: " + usersList[i].address!.city.toString()),
                          subtitle: Text("GEO: "+usersList[i].address!.geo!.lng.toString()),
                        );
                      }),
                    ),
                  );
                }
              })),
        ],
      ),
    );
  }
}

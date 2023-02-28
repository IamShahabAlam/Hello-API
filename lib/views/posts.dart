import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:hello_api_app/components/appbar.dart';
import 'package:hello_api_app/models/posts_model.dart';
import 'package:hello_api_app/constants/constants.dart';
import 'package:http/http.dart' as http;

class PostsPage extends StatefulWidget {
  @override
  State<PostsPage> createState() => _PostsPageState();
}

class _PostsPageState extends State<PostsPage> {
  // var baseURL = "https://jsonplaceholder.typicode.com/posts";
  List<PostsModel> postsList = [];

  Future<List<PostsModel>> getPostApi() async {
    final response = await http.get(Uri.parse(kBaseURL+kPostsURL));
    var data = jsonDecode(response.body.toString());
    if (response.statusCode == 200) {
      for (var i in data) {
        postsList.add(PostsModel.fromJson(i));
      }
      return postsList;
    } else {
      return postsList;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar("Posts API"),
      body: Column(
        children: [
          FutureBuilder(
            future: getPostApi(),
            builder: (context, snapshot) {
              if (!snapshot.hasData) {
                return Center(
                  child: AlertDialog(title: SizedBox(
                    height: 50, width: 50.0,
                    child: CircularProgressIndicator()),
                  content: Text("Getting Data from API...", textAlign: TextAlign.center,),)
                );
              } else {
                return Expanded(
                  child: ListView.builder(
                    shrinkWrap: true,
                    physics: ScrollPhysics(),
                    itemCount: 5,
                    itemBuilder: ((context, i) {
                      return ListTile(
                        leading: CircleAvatar(
                          backgroundColor: Colors.grey[300],
                          child: Text(postsList[i].id.toString())),
                        title: Text(postsList[i].title.toString().toCapitalized()),
                        subtitle: Text(postsList[i].body.toString()),
                      );
                    }),
                  ),
                );
              }
            },
          )
        ],
      ),
    );
  }
}

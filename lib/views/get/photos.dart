import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:hello_api_app/components/appbar.dart';
import 'package:hello_api_app/constants/constants.dart';
import 'package:http/http.dart' as http;

import '../../models/get/photos_model.dart';

class PhotosPage extends StatefulWidget {
  @override
  State<PhotosPage> createState() => _PhotosPageState();
}

class _PhotosPageState extends State<PhotosPage> {
  List<PhotosModel> photosList = [];

  Future<List<PhotosModel>> getPhotosApi() async {
    final response = await http.get(Uri.parse(kBaseURL + kPhotosURL));
    var data = jsonDecode(response.body.toString());
    if (response.statusCode == 200) {
      for (Map i in data) {
        PhotosModel photos = PhotosModel(id: i["id"], title: i['title'], url: i['url']);
        photosList.add(photos);
      }
    } else {
      return photosList;
    }
    return photosList;
  }

  @override
  Widget build(BuildContext context) {
    HeightWidth(context);
    return Scaffold(
      appBar: appBar("Photos API"),
      body: Column(
        children: [
          Expanded(
              child: FutureBuilder(
            future: getPhotosApi(),
            builder: ((context, AsyncSnapshot<List<PhotosModel>> snapshot) {
              if (!snapshot.hasData) {
                AlertDialog(
                  title: CircularProgressIndicator(),
                );
              } else {
                return ListView.builder(
                  itemCount: photosList.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      trailing: CircleAvatar(
                        backgroundImage:
                            NetworkImage(snapshot.data![index].url.toString()),
                      ),
                      title: Text(snapshot.data![index].title.toString()),
                    );
                  },
                );
              }
              return AlertDialog(
                title: CircularProgressIndicator(),
              );
            }),
          ))
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';

// Creating a Custom model 
// it can be used when got error from JsonToDart

class PhotosModel{
  PhotosModel({this.id, this.title, this.url});

  String? title , url ;
  int? id ;
}

// ----------------------------------------------------

// Model From JsonToDart https://javiercbk.github.io/json_to_dart/ ---------------------------------------

/*

class PhotosModel {
  int? albumId;
  int? id;
  String? title;
  String? url;
  String? thumbnailUrl;

  PhotosModel({this.albumId, this.id, this.title, this.url, this.thumbnailUrl});

  PhotosModel.fromJson(Map<String, dynamic> json) {
    albumId = json['albumId'];
    id = json['id'];
    title = json['title'];
    url = json['url'];
    thumbnailUrl = json['thumbnailUrl'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['albumId'] = this.albumId;
    data['id'] = this.id;
    data['title'] = this.title;
    data['url'] = this.url;
    data['thumbnailUrl'] = this.thumbnailUrl;
    return data;
  }
}

*/
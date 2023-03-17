import 'dart:io';
import 'package:flutter/material.dart';
import 'package:hello_api_app/components/appbar.dart';
import 'package:image_picker/image_picker.dart';

class ImagePage extends StatefulWidget {
  @override
  State<ImagePage> createState() => _ImagePageState();
}

class _ImagePageState extends State<ImagePage> {
  File? image; // for Image Path
  final _picker = ImagePicker();
  bool showSpinner = false;

 // getting the Image from gallery
  Future getImage() async {
    final pickedImage = await _picker.pickImage(
       
        source: ImageSource.gallery,
        imageQuality: 80);


// saving pickedImage's path in image File
    if (pickedImage != null) {
      image = File(pickedImage.path); 
      setState((){});
    } else {
      print("Error in Image Selection");
    }
  }

  //  Uploading image on server

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar("Upload Image Page"),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            child: image == null
                ? Center(child: Text("Image path is Null"))
                : Container(
                    child: Center(
                        child: Image.file(
                    File(// it shows image to user
                        image!.path).absolute, // dart:io
                    height: 100,
                    width: 100,
                    fit: BoxFit.cover,
                  ))),
          )
        ],
      ),
    );
  }
}

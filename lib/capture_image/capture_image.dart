
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:gal/gal.dart';
import 'package:image_picker/image_picker.dart';

class CaptureImage extends StatefulWidget {
  const CaptureImage({super.key});

  @override
  State<CaptureImage> createState() => _CaptureImageState();
}

class _CaptureImageState extends State<CaptureImage> {
  // String? _imagePath;


  XFile ? _image;


  //pick image
  PickImage() async {
    var image = await ImagePicker().pickImage(source: ImageSource.camera);
    setState(() {
      _image = image;
      print(_image!.path);
    });
  }

  //save image
  saveImage(url)async{
    await Gal.putImage(url, ).then((value) =>

    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content:Text( "success")))
    );

  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Capture Image"),
      ),
      body: Center(
        child: Column(

          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 40,),

            ClipOval(
              child: _image != null ? Image.file(File(_image!.path), fit: BoxFit.cover, height: 120, width: 120,) : Image.network(
                "https://www.w3schools.com/howto/img_avatar.png", height: 120, width: 120, fit: BoxFit.cover,),
            ),
            SizedBox(height: 20,),
            TextButton(
                onPressed: () {
                  PickImage();
                }, child: Text("Pick Image")),

            SizedBox(height: 20,),
            TextButton(onPressed: () {
              saveImage(_image!.path);

            }, child: Text("Save"))
          ],
        ),
      ),
    );
  }


}

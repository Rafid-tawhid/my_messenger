

import 'dart:io';
import 'dart:typed_data';

import 'package:camera/camera.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:gal/gal.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:ui' as ui;

import 'package:path_provider/path_provider.dart';
class CameraScreen extends StatefulWidget {
  @override
  _CameraScreenState createState() => _CameraScreenState();
}

class _CameraScreenState extends State<CameraScreen> {
  File? _image;

  final picker = ImagePicker();
  GlobalKey _globalKey = GlobalKey();

  Future<void> _getImageFromCamera() async {
    final pickedFile = await picker.pickImage(source: ImageSource.camera);

    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
        _showImageDialog(context);
      } else {
        print('No image selected.');
      }
    });
  }

  Future<void> _showImageDialog(BuildContext context) async {
    TextEditingController _textFieldController = TextEditingController();
    String imageName = '';
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Captured Image'),
          content: SingleChildScrollView(
            child: Column(
              children: [
                Image.file(_image!,height: 100,width: 100,fit: BoxFit.cover,),
            TextField(
              controller: _textFieldController,
              decoration: InputDecoration(
                labelText: 'Enter Image Name',
              ),
              onChanged: (value) {
                imageName = value;
              },
            )],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: Text('Save'),
              onPressed: () async {
        if (_image != null) {
          final directory = (await getApplicationDocumentsDirectory()).path;
          final File newImage = await _image!.copy('$directory/$imageName.png');
          await Gal.putImage(newImage.path);

        ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
        content: Text('Image saved as $imageName.png'),
        ),
        );}
        Navigator.pop(context);
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Camera Demo'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              onPressed: _getImageFromCamera,
              child: Text('Open Camera'),
            ),
            SizedBox(height: 20),
            // ElevatedButton(
            //   onPressed: () {
            //     if (_image != null) {
            //       _showImageDialog(context);
            //     } else {
            //       ScaffoldMessenger.of(context).showSnackBar(
            //         SnackBar(
            //           content: Text('Please capture an image first.'),
            //         ),
            //       );
            //     }
            //   },
            //   child: Text('Show Image'),
            // ),
          ],
        ),
      ),
    );
  }
  Future<String> getFilePath(String path) async {
    final byteData = await rootBundle.load(path);
    final file = await File(
        'HELLO')
        .create();
    await file.writeAsBytes(byteData.buffer
        .asUint8List(byteData.offsetInBytes, byteData.lengthInBytes));
    return file.path;
  }
}
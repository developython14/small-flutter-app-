import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'dart:io';
import 'dart:async';

class belk extends StatefulWidget {
  @override
  State<belk> createState() => _belkState();
}

class _belkState extends State<belk> {
  File? myfile;

  @override
  Widget build(BuildContext context) {
    return Builder(builder: (context) {
      return Center(
        child: Padding(
          padding: const EdgeInsets.only(top: 50.0),
          child: Column(children: [
            ElevatedButton(
                onPressed: () async {
                  FilePickerResult? result =
                      await FilePicker.platform.pickFiles();

                  if (result != null) {
                    File myfile = File(result.files.single.path!);
                  } else {
                    // User canceled the picker
                  }
                },
                child: Text(
                  "Upload mustapha Files",
                  style: TextStyle(color: Colors.green),
                ))
          ]),
        ),
      );
    });
  }
}

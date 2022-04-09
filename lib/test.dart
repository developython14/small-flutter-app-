import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';

class belk extends StatefulWidget {
  @override
  State<belk> createState() => _belkState();
}

class _belkState extends State<belk> {
  File myfile = null;
  @override
  Widget build(BuildContext context) {
    return Builder(builder: (context) {
      return Center(
        child: Column(children: [
          ElevatedButton(
              onPressed: () async {
                FilePickerResult? result =
                    await FilePicker.platform.pickFiles();
                if (result != null) {
                  File file = File(result.files.single.path);
                } else {
                  // User canceled the picker
                }
              },
              child: Text("Upload file"))
        ]),
      );
    });
  }
}

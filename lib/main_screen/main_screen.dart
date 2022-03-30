import 'package:flutter/material.dart';
import 'package:mustapha/main_screen/models/data_models.dart';
import 'dart:convert' as convert;
import 'package:http/http.dart' as http;

class univs extends StatefulWidget {
  const univs({Key? key}) : super(key: key);

  @override
  State<univs> createState() => _univsState();
}

class _univsState extends State<univs> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("mustapha toma app ")),
      body: Center(
          child: Column(
        children: [
          Text('haad test api '),
          FlatButton(
              onPressed: () {
                print('salam alikom mustapha');
              },
              child: Text("on click here")),
          ListTile(
            leading: Icon(Icons.facebook, size: 50, color: Colors.blue),
            title: Text('my first app'),
            subtitle: Text("yes im mustapha"),
            trailing: Icon(Icons.person),
          ),
        ],
      )),
    );
  }
}

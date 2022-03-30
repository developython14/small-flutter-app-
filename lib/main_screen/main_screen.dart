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
  final List<String> entries = <String>['A', 'B', 'C'];
  final List<int> colorCodes = <int>[600, 500, 100];

  @override
  void initState() {
    getdata();
    // TODO: implement initState
    super.initState();
  }

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
                print("hi mustapha ");
              },
              child: Text("on musta here")),
          ListTile(
            leading: Icon(Icons.facebook, size: 50, color: Colors.blue),
            title: Text('my first app'),
            subtitle: Text("yes im mustapha"),
            trailing: Icon(Icons.person),
          ),
          ListView.separated(
            padding: const EdgeInsets.all(8),
            itemCount: entries.length,
            itemBuilder: (BuildContext context, int index) {
              return Container(
                height: 50,
                color: Colors.amber[colorCodes[index]],
                child: Center(child: Text('Entry ${entries[index]}')),
              );
            },
            separatorBuilder: (BuildContext context, int index) =>
                const Divider(),
          )
        ],
      )),
    );
  }
}

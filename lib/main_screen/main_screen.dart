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
  final List<int> colorCodes = <int>[600, 500, 100];
  final List<String> entries = <String>[];

  @override
  void initState() {
    getdata();
    // TODO: implement initState
    super.initState();
  }

  getdata() async {
    var test = Uri.parse(
        'https://evening-savannah-43647.herokuapp.com/api/list_countries');
    var response = await http.get(test);
    if (response.statusCode == 200) {
      var jsonResponse = convert.jsonDecode(response.body);
      for (var i = 0; i < jsonResponse.length; i++) {
        entries.add(jsonResponse[i]["country"]);
        colorCodes.add(800);
      }
      print('do it');
    } else {
      print('Request failed with status: ${response.statusCode}.');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("mustapha belkor ")),
        body: ListView.separated(
          padding: const EdgeInsets.all(8),
          itemCount: entries.length,
          itemBuilder: (BuildContext context, int index) {
            return Container(
              height: 50,
              color: Colors.amber[colorCodes[index]],
              child: Center(
                  child: ElevatedButton(
                      onPressed: () {
                        Navigator.pushNamed(context, '/login');
                      },
                      child: Text('${entries[index]}'))),
            );
          },
          separatorBuilder: (BuildContext context, int index) =>
              const Divider(),
        ));
  }
}

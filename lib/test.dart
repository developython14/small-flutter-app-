import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'dart:io';
import 'dart:async';
import 'package:multi_select_flutter/multi_select_flutter.dart';
import 'dart:convert' as convert;
import 'package:http/http.dart' as http;

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Multi Select',
      theme: ThemeData(
        primarySwatch: Colors.purple,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Flutter Multi Select'),
    );
  }
}

class Service {
  final int id;
  final String name;

  Service({
    required this.id,
    required this.name,
  });
}

class MyHomePage extends StatefulWidget {
  MyHomePage({required this.title});
  final String title;
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  static List<Service> _services = [];
  List _selectedAnimals2 = [];
  final _multiSelectKey = GlobalKey<FormFieldState>();

  getdataserives() async {
    var test = Uri.parse(
        'https://evening-savannah-43647.herokuapp.com/api/ls_services');
    var response = await http.get(test);
    if (response.statusCode == 200) {
      var jsonResponse = convert.jsonDecode(response.body);
      for (var i = 0; i < jsonResponse.length; i++) {
        Service serv = Service(id: i, name: jsonResponse[i]);
        _services.add(serv);
      }
    } else {
      print('Request failed with status: ${response.statusCode}.');
    }
  }

  @override
  void initState() {
    getdataserives();
    print('services hado from api');
    print(_services);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: SingleChildScrollView(
        child: Container(
          alignment: Alignment.center,
          padding: EdgeInsets.all(20),
          child: Column(
            children: <Widget>[
              SizedBox(height: 40),
              //################################################################################################
              // Rounded blue MultiSelectDialogField
              //################################################################################################
              //################################################################################################
              // This MultiSelectBottomSheetField has no decoration, but is instead wrapped in a Container that has
              // decoration applied. This allows the ChipDisplay to render inside the same Container.
              //################################################################################################
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(
                    color: Theme.of(context).primaryColor,
                    width: 2,
                  ),
                ),
                child: Column(
                  children: <Widget>[
                    MultiSelectBottomSheetField(
                      initialChildSize: 0.4,
                      listType: MultiSelectListType.CHIP,
                      searchable: true,
                      buttonText: Text("Services Provided:"),
                      title: Text("Services"),
                      items: _services
                          .map((service) =>
                              MultiSelectItem<Service>(service, service.name))
                          .toList(),
                      onConfirm: (values) {
                        _selectedAnimals2 = values;
                        print(_selectedAnimals2.map((e) => e.name));
                      },
                      chipDisplay: MultiSelectChipDisplay(
                        onTap: (value) {
                          setState(() {
                            _selectedAnimals2.remove(value);
                          });
                        },
                      ),
                    ),
                    _selectedAnimals2 == null || _selectedAnimals2.isEmpty
                        ? Container(
                            padding: EdgeInsets.all(10),
                            alignment: Alignment.centerLeft,
                            child: Text(
                              "None selected",
                              style: TextStyle(color: Colors.black54),
                            ))
                        : Container(),
                  ],
                ),
              ),
              //################################################################################################
              // MultiSelectBottomSheetField with validators
              //################################################################################################

              //################################################################################################
              // MultiSelectChipField
              //################################################################################################
            ],
          ),
        ),
      ),
    );
  }
}

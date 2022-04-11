import 'package:flutter/material.dart';
import 'package:getwidget/getwidget.dart';
import 'dart:convert' as convert;
import 'package:http/http.dart' as http;


class signup extends StatefulWidget {
  const signup({Key? key}) : super(key: key);

  @override
  State<signup> createState() => _signupState();
}

class _signupState extends State<signup> {
  String? country = '';
  String? email = '';
  String? faculty = '';
  bool? gender = true;
  bool is_pass = true;
  String? level = '';
  final list_countries = ["Bac+1"];
  final list_faculties = ["Bac+1"];
  final list_levels = ["Bac+1", "Bac+2", "Bac+3", "Bac+4", "Bac+5"];
  final list_spicialities = ["Bac+1"];
  String? name = '';
  String? password = '';
  String? phone = '';
  String? spiciality = '';

  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    getdatacountries();
    getdatafaculties();
    getdataspiciality();

    // TODO: implement initState
    super.initState();
  }

  getdatacountries() async {
    var test = Uri.parse(
        'https://evening-savannah-43647.herokuapp.com/api/list_countries');
    var response = await http.get(test);
    if (response.statusCode == 200) {
      var jsonResponse = convert.jsonDecode(response.body);
      for (var i = 0; i < jsonResponse.length; i++) {
        list_countries.add(jsonResponse[i]["country"]);
      }
    } else {
      print('Request failed with status: ${response.statusCode}.');
    }
  }

  getdatafaculties() async {
    var test = Uri.parse(
        'https://evening-savannah-43647.herokuapp.com/api/list_faculties');
    var response = await http.get(test);
    if (response.statusCode == 200) {
      var jsonResponse = convert.jsonDecode(response.body);
      for (var i = 0; i < jsonResponse.length; i++) {
        list_faculties.add(jsonResponse[i]["faculty"]);
      }
    } else {
      print('Request failed with status: ${response.statusCode}.');
    }
  }

  getdataspiciality() async {
    var test = Uri.parse(
        'https://evening-savannah-43647.herokuapp.com/api/list_faculties');
    var response = await http.get(test);
    if (response.statusCode == 200) {
      var jsonResponse = convert.jsonDecode(response.body);
      for (var i = 0; i < jsonResponse.length; i++) {
        list_spicialities.add(jsonResponse[i]["faculty"]);
      }
    } else {
      print('Request failed with status: ${response.statusCode}.');
    }
  }

  @override
  Widget build(BuildContext context) {
    double wid = MediaQuery.of(context).size.width;
    return Scaffold(
        body: SingleChildScrollView(
      child: Container(
        width: wid,
        color: Color.fromARGB(255, 255, 255, 255),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ClipRRect(
                borderRadius: BorderRadius.circular(50),
                child: Image.asset('assets/start_app/2.jpg')),
            SizedBox(height: 25),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 35.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text('Signup',
                      style:
                          TextStyle(fontSize: 30, fontWeight: FontWeight.bold)),
                ],
              ),
            ),
            SizedBox(height: 25),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 35.0),
              child: Form(
                  child: Column(
                children: [
                  TextFormField(
                    decoration: InputDecoration(
                        hintText: 'Name complete',
                        prefixIcon: Icon(Icons.person),
                        border: OutlineInputBorder()),
                    onSaved: (text) {
                      name = text;
                    },
                  ),
                  SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text("Select Gender:"),
                    ],
                  ),
                  SizedBox(height: 10),
                  Row(
                    children: [
                      Text("Male"),
                      Radio(
                          groupValue: 25,
                          value: true,
                          onChanged: (text) {
                            setState(() {});
                          })
                    ],
                  ),
                  Row(
                    children: [
                      Text("Female"),
                      Radio(
                          groupValue: 14,
                          value: false,
                          onChanged: (text) {
                            setState(() {});
                          })
                    ],
                  ),
                  SizedBox(height: 20),
                  Row(
                    children: [
                      Text("Select country"),
                      DropdownButton(
                          hint: Text('$country'),
                          items: list_countries.map(buildmen).toList(),
                          onChanged: (String? text) {
                            setState(() {
                              country = text ?? "";
                            });
                          })
                    ],
                  ),
                  SizedBox(height: 20),
                  Row(
                    children: [
                      Text("Select Faculty"),
                      DropdownButton(
                          hint: Text('$faculty'),
                          items: list_faculties.map(buildmen).toList(),
                          onChanged: (String? text) {
                            setState(() {
                              faculty = text ?? "";
                            });
                          })
                    ],
                  ),
                  SizedBox(height: 20),
                  Row(
                    children: [
                      Text("Select Speciality "),
                      DropdownButton(
                          hint: Text('$spiciality'),
                          items: list_spicialities.map(buildmen).toList(),
                          onChanged: (String? text) {
                            setState(() {
                              spiciality = text ?? "";
                            });
                          })
                    ],
                  ),
                  SizedBox(height: 20),
                  Row(
                    children: [
                      Text("Select Level"),
                      DropdownButton(
                          hint: Text('$level'),
                          items: list_levels.map(buildmen).toList(),
                          onChanged: (String? text) {
                            setState(() {
                              level = text ?? "";
                            });
                          })
                    ],
                  ),
                  SizedBox(height: 20),
                  TextFormField(
                    decoration: InputDecoration(
                        hintText: 'Email',
                        prefixIcon: Icon(Icons.email),
                        border: OutlineInputBorder()),
                    onSaved: (text) {
                      email = text;
                    },
                  ),
                  SizedBox(height: 20),
                  TextFormField(
                    obscureText: is_pass,
                    decoration: InputDecoration(
                        hintText: 'Password',
                        prefixIcon: Icon(Icons.lock),
                        suffixIcon: IconButton(
                          icon: Icon(Icons.password),
                          onPressed: () {
                            setState(() {
                              is_pass = !is_pass;
                            });
                          },
                        ),
                        border: OutlineInputBorder()),
                    onSaved: (text) {
                      password = text;
                    },
                  ),
                  SizedBox(height: 20),
                  TextFormField(
                    obscureText: is_pass,
                    decoration: InputDecoration(
                        hintText: 'Repeat Password',
                        prefixIcon: Icon(Icons.lock),
                        suffixIcon: IconButton(
                          icon: Icon(Icons.password),
                          onPressed: () {
                            setState(() {
                              is_pass = !is_pass;
                            });
                          },
                        ),
                        border: OutlineInputBorder()),
                    onSaved: (text) {},
                  ),
                  SizedBox(height: 20),
                  TextFormField(
                    decoration: InputDecoration(
                        hintText: 'Phone number',
                        prefixIcon: Icon(Icons.phone),
                        border: OutlineInputBorder()),
                    onSaved: (text) {
                      phone = text;
                    },
                  ),
                  SizedBox(height: 20),
                  GFButton(
                    onPressed: () {},
                    text: "Signup",
                    shape: GFButtonShape.pills,
                    fullWidthButton: true,
                  ),
                ],
              )),
            )
          ],
        ),
      ),
    ));
  }
}

DropdownMenuItem<String> buildmen(String item) =>
    DropdownMenuItem(value: item, child: Text('$item'));

import 'package:flutter/material.dart';
import 'package:getwidget/getwidget.dart';
import 'dart:convert' as convert;
import 'package:http/http.dart' as http;

class signupmod extends StatefulWidget {
  const signupmod({Key? key}) : super(key: key);

  @override
  State<signupmod> createState() => _signupmodState();
}

class _signupmodState extends State<signupmod> {
  final _formKey = GlobalKey<FormState>();
  String? name = '';
  bool? gender = true;
  String? country = '';
  String? city = '';
  String? faculty = '';
  String? participation = '';
  String? spiciality = '';
  String? degree_title = '';
  String? email = '';
  String? password = '';
  String? phone = '';
  String? phone_second = '';
  String? avalibality = '';

  bool is_pass = true;
  final list_countries = ["Bac+1"];
  final list_faculties = ["Bac+1"];
  final list_spicialities = ["Bac+1"];
  final list_levels = ["Moderator", "Professeur"];

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
  void initState() {
    getdatacountries();
    getdatafaculties();
    getdataspiciality();

    // TODO: implement initState
    super.initState();
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
                      Text("Select City"),
                      DropdownButton(
                          hint: Text('$country'),
                          items: list_countries.map(buildmen).toList(),
                          onChanged: (String? text) {
                            setState(() {
                              city = text ?? "";
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
                  TextFormField(
                    decoration: InputDecoration(
                        hintText: 'Degree',
                        prefixIcon: Icon(Icons.grade),
                        border: OutlineInputBorder()),
                    onSaved: (text) {
                      degree_title = text;
                    },
                  ),
                  SizedBox(height: 20),
                  TextFormField(
                    decoration: InputDecoration(
                        hintText: 'exaxctly spiciality',
                        prefixIcon: Icon(Icons.science),
                        border: OutlineInputBorder()),
                    onSaved: (text) {
                      name = text;
                    },
                  ),
                  SizedBox(height: 20),
                  Row(
                    children: [
                      Text("Participation as"),
                      DropdownButton(
                          hint: Text('$participation'),
                          items: list_levels.map(buildmen).toList(),
                          onChanged: (String? text) {
                            setState(() {
                              participation = text ?? "";
                            });
                          })
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text("Availibality:"),
                    ],
                  ),
                  SizedBox(height: 10),
                  Row(
                    children: [
                      Text("5H"),
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
                      Text("10H"),
                      Radio(
                          groupValue: 14,
                          value: false,
                          onChanged: (text) {
                            setState(() {});
                          })
                    ],
                  ),
                  Row(
                    children: [
                      Text("15H"),
                      Radio(
                          groupValue: 14,
                          value: false,
                          onChanged: (text) {
                            setState(() {});
                          })
                    ],
                  ),
                  Row(
                    children: [
                      Text("20H"),
                      Radio(
                          groupValue: 14,
                          value: false,
                          onChanged: (text) {
                            setState(() {});
                          })
                    ],
                  ),
                  Row(
                    children: [
                      Text("+25H"),
                      Radio(
                          groupValue: 14,
                          value: false,
                          onChanged: (text) {
                            setState(() {});
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
                  TextFormField(
                    decoration: InputDecoration(
                        hintText: 'Second Phone number',
                        prefixIcon: Icon(Icons.phone),
                        border: OutlineInputBorder()),
                    onSaved: (text) {
                      phone_second = text;
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

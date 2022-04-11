import 'package:flutter/material.dart';
import 'package:getwidget/getwidget.dart';
import 'package:getwidget/size/gf_size.dart';
import 'dart:convert' as convert;
import 'package:http/http.dart' as http;
import 'package:file_picker/file_picker.dart';
import 'dart:io';
import 'dart:async';
import 'package:multi_select_flutter/multi_select_flutter.dart';

class Service {
  final int id;
  final String name;

  Service({
    required this.id,
    required this.name,
  });
}

class signupmod extends StatefulWidget {
  const signupmod({Key? key}) : super(key: key);

  @override
  State<signupmod> createState() => _signupmodState();
}

class _signupmodState extends State<signupmod> {
  final _formKey = GlobalKey<FormState>();
  static List<Service> _services = [];
  List _selectedservices = [];
  final _multiSelectKey = GlobalKey<FormFieldState>();
  String? name = '';
  String? gender = '';
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
  String? date_of_birth = '';
  DateTime data = DateTime(4, 17, 1998);
  File? cv;
  File? degree;
  File? experience;
  File? identity;

  bool is_pass = true;
  final list_countries = ["Bac+1"];
  final list_faculties = ["Bac+1"];
  final list_spicialities = ["Bac+1"];
  final list_levels = ["Moderator", "Professeur"];
  final list_services = ["Moderator", "Professeur"];

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

  getdataserives() async {
    var test = Uri.parse(
        'https://evening-savannah-43647.herokuapp.com/api/ls_services');
    var response = await http.get(test);
    if (response.statusCode == 200) {
      var jsonResponse = convert.jsonDecode(response.body);
      for (var i = 0; i < jsonResponse.length; i++) {
        print(jsonResponse[i]);
        Service serv = Service(id: i, name: jsonResponse[i]);
        _services.add(serv);
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
    getdataserives();
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
                      Text('Date Of Birth : '),
                      Text("${data.year}/${data.month}/${data.day}"),
                    ],
                  ),
                  ElevatedButton(
                      onPressed: () async {
                        DateTime? date = await showDatePicker(
                            context: context,
                            initialDate: DateTime(2000),
                            firstDate: DateTime(1950),
                            lastDate: DateTime(2100));
                        if (date == null) return;
                        setState(() {
                          data = date;
                        });
                      },
                      child: Text("choose your date ")),
                  SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text("Select Gender:"),
                    ],
                  ),
                  SizedBox(height: 10),
                  ListTile(
                      title: Text('Male'),
                      leading: Radio(
                          value: "Male",
                          groupValue: gender,
                          onChanged: (String? text) {
                            setState(() {
                              gender = text;
                            });
                            print('gender is $gender');
                          })),
                  SizedBox(height: 10),
                  ListTile(
                      title: Text('Female'),
                      leading: Radio(
                          value: "Female",
                          groupValue: gender,
                          onChanged: (String? text) {
                            setState(() {
                              gender = text;
                            });
                            print('gender is $gender');
                          })),
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
                  ListTile(
                      title: Text('5H'),
                      leading: Radio(
                          value: "5H",
                          groupValue: avalibality,
                          onChanged: (String? text) {
                            setState(() {
                              avalibality = '5H';
                            });
                            print('avalibality is $avalibality');
                          })),
                  ListTile(
                      title: Text('10H'),
                      leading: Radio(
                          value: "10H",
                          groupValue: avalibality,
                          onChanged: (String? text) {
                            setState(() {
                              avalibality = '10H';
                            });
                            print('avalibality is $avalibality');
                          })),
                  ListTile(
                      title: Text('15H'),
                      leading: Radio(
                          value: "15H",
                          groupValue: avalibality,
                          onChanged: (String? text) {
                            setState(() {
                              avalibality = '15H';
                            });
                            print('avalibality is $avalibality');
                          })),
                  ListTile(
                      title: Text('20H'),
                      leading: Radio(
                          value: "20H",
                          groupValue: avalibality,
                          onChanged: (String? text) {
                            setState(() {
                              avalibality = '20H';
                            });
                            print('avalibality is $avalibality');
                          })),
                  ListTile(
                      title: Text('+25H'),
                      leading: Radio(
                          value: "+25H",
                          groupValue: avalibality,
                          onChanged: (String? text) {
                            setState(() {
                              avalibality = '+25H';
                            });
                            print('avalibality is $avalibality');
                          })),
                  SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text('File Required',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 26)),
                    ],
                  ),
                  SizedBox(height: 20),
                  Row(
                    children: [
                      Text('your Cv'),
                    ],
                  ),
                  ElevatedButton(
                      onPressed: () async {
                        FilePickerResult? result =
                            await FilePicker.platform.pickFiles();

                        if (result != null) {
                          File cv = File(result.files.single.path!);
                        } else {
                          // User canceled the picker
                        }
                      },
                      child: Column(
                        children: [Icon(Icons.upload_file), Text('upload Cv')],
                      )),
                  SizedBox(height: 20),
                  Row(
                    children: [
                      Text('your Degree'),
                    ],
                  ),
                  ElevatedButton(
                      onPressed: () async {
                        FilePickerResult? result =
                            await FilePicker.platform.pickFiles();

                        if (result != null) {
                          File degree = File(result.files.single.path!);
                        } else {
                          // User canceled the picker
                        }
                      },
                      child: Column(
                        children: [
                          Icon(Icons.upload_file),
                          Text('upload degree')
                        ],
                      )),
                  SizedBox(height: 20),
                  Row(
                    children: [
                      Text('your experience province'),
                    ],
                  ),
                  ElevatedButton(
                      onPressed: () async {
                        FilePickerResult? result =
                            await FilePicker.platform.pickFiles();

                        if (result != null) {
                          File experience = File(result.files.single.path!);
                        } else {
                          // User canceled the picker
                        }
                      },
                      child: Column(
                        children: [
                          Icon(Icons.upload_file),
                          Text('upload experience proove')
                        ],
                      )),
                  SizedBox(height: 20),
                  Row(
                    children: [
                      Text('your identify card'),
                    ],
                  ),
                  ElevatedButton(
                      onPressed: () async {
                        FilePickerResult? result =
                            await FilePicker.platform.pickFiles();

                        if (result != null) {
                          File identity = File(result.files.single.path!);
                        } else {
                          // User canceled the picker
                        }
                      },
                      child: Column(
                        children: [
                          Icon(Icons.upload_file),
                          Text('upload identity')
                        ],
                      )),
                  SizedBox(height: 20),
                  Row(
                    children: [
                      Text('Services your provided'),
                    ],
                  ),
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
                              .map((service) => MultiSelectItem<Service>(
                                  service, service.name))
                              .toList(),
                          onConfirm: (values) {
                            _selectedservices = values;
                            print(_selectedservices.map((e) => e.name));
                          },
                          chipDisplay: MultiSelectChipDisplay(
                            onTap: (value) {
                              setState(() {
                                _selectedservices.remove(value);
                              });
                            },
                          ),
                        ),
                        _selectedservices == null || _selectedservices.isEmpty
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
                    size: GFSize.LARGE,
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

import 'package:flutter/material.dart';
import 'package:getwidget/getwidget.dart';

class signup extends StatefulWidget {
  const signup({Key? key}) : super(key: key);

  @override
  State<signup> createState() => _signupState();
}

class _signupState extends State<signup> {
  final _formKey = GlobalKey<FormState>();
  bool is_pass = true;
  int groupValue = 0;
  final list_countries = ["mustapha", "belkassem", "allo", "paris"];
  final list_faculties = ["mustapha", "belkassem", "allo", "paris"];
  final list_spicialities = ["mustapha", "belkassem", "allo", "paris"];
  final list_levels = ["mustapha", "belkassem", "allo", "paris"];

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
                        hintText: 'Name',
                        prefixIcon: Icon(Icons.email),
                        border: OutlineInputBorder()),
                    onSaved: (text) {},
                  ),
                  SizedBox(height: 20),
                  GFRadioListTile(
                    titleText: 'Arthur Shelby',
                    subTitleText: 'By order of the peaky blinders',
                   
                    ),
                    size: 25,
                    activeBorderColor: Colors.green,
                    focusColor: Colors.green,
                    type: GFRadioType.square,
                    value: 0,
                    groupValue: groupValue,
                    onChanged: (value) {
                      setState(() {
                        groupValue = value;
                      });
                    },
                    inactiveIcon: null,
                  ),
                  GFRadioListTile(
                    titleText: 'Arthur Shelby',
                    subTitleText: 'By order of the peaky blinders',
                   GFAvatar(
    backgroundImage: AssetImage('Assets image here'),
  ),
                    size: 25,
                    activeBorderColor: Colors.green,
                    focusColor: Colors.green,
                    type: GFRadioType.square,
                    value: 1,
                    groupValue: groupValue,
                    onChanged: (value) {
                      setState(() {
                        groupValue = value;
                      });
                    },
                    inactiveIcon: null,
                  ),
                  SizedBox(height: 20),
                  Row(
                    children: [
                      Text("Select country"),
                      DropdownButton(
                          items: list_countries.map(buildmen).toList(),
                          onChanged: (text) {})
                    ],
                  ),
                  SizedBox(height: 20),
                  Row(
                    children: [Text("Select Faculty"), DropdownButton(
                          items: list_faculties.map(buildmen).toList(),
                          onChanged: (text) {})],
                  ),
                  SizedBox(height: 20),
                  Row(
                    children: [Text("Select Speciality "),DropdownButton(
                          items: list_spicialities.map(buildmen).toList(),
                          onChanged: (text) {})],
                  ),
                  SizedBox(height: 20),
                  Row(
                    children: [Text("Select Level")],DropdownButton(
                          items: list_levels.map(buildmen).toList(),
                          onChanged: (text) {}),
                  ),
                  SizedBox(height: 20),
                  TextFormField(
                    decoration: InputDecoration(
                        hintText: 'Email',
                        prefixIcon: Icon(Icons.email),
                        border: OutlineInputBorder()),
                    onSaved: (text) {},
                  ),
                  SizedBox(height: 20),
                  TextFormField(
                    decoration: InputDecoration(
                        hintText: 'Password',
                        prefixIcon: Icon(Icons.email),
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
                        hintText: 'Repeat Password',
                        prefixIcon: Icon(Icons.email),
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
                        prefixIcon: Icon(Icons.email),
                        border: OutlineInputBorder()),
                    onSaved: (text) {},
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

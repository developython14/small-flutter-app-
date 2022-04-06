import 'package:flutter/material.dart';
import 'package:getwidget/getwidget.dart';

class signup extends StatefulWidget {
  const signup({Key? key}) : super(key: key);

  @override
  State<signup> createState() => _signupState();
}

class _signupState extends State<signup> {
  final _formKey = GlobalKey<FormState>();
  int groupValue = 0;

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
                    avatar: GFAvatar(
                      backgroundImage: AssetImage('assets/0.jpg'),
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
                    avatar: GFAvatar(
                      backgroundImage: AssetImage('assets/0.jpg'),
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
                    ],
                  ),
                  SizedBox(height: 20),
                  Row(
                    children: [Text("Select Faculty")],
                  ),
                  SizedBox(height: 20),
                  Row(
                    children: [Text("Select Speciality ")],
                  ),
                  SizedBox(height: 20),
                  Row(
                    children: [Text("Select Level")],
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
                        border: OutlineInputBorder()),
                    onSaved: (text) {},
                  ),
                  SizedBox(height: 20),
                  TextFormField(
                    decoration: InputDecoration(
                        hintText: 'Repeat Password',
                        prefixIcon: Icon(Icons.email),
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
                    text: "primary",
                    shape: GFButtonShape.pills,
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

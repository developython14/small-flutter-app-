import 'dart:ffi';
import 'package:flutter_signin_button/flutter_signin_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:getwidget/getwidget.dart';

class login extends StatefulWidget {
  @override
  State<login> createState() => _loginState();
}

class _loginState extends State<login> {
  final _formKey = GlobalKey<FormState>();
  String? name = '';
  String? password = '';
  bool is_pass = true;
  final Color facebookColor = const Color(0xff39579A);

  Future<void> _savingdata() async {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
    }
  }

  Future<void> _showMyDialog() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('AlertDialog Title'),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text('This is a demo alert dialog. $name'),
                Text('Would you like to approve of this message? $password'),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('Approve'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    double wid = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          width: wid,
          color: Color.fromARGB(255, 255, 255, 255),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
            ClipRRect(
                borderRadius: BorderRadius.circular(50),
                child: Image.asset('assets/start_app/0.jpg')),
            SizedBox(height: 25),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 35.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text('Login',
                      style:
                          TextStyle(fontSize: 30, fontWeight: FontWeight.bold)),
                ],
              ),
            ),
            SizedBox(height: 25),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 35.0),
              child: Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      TextFormField(
                        decoration: InputDecoration(
                            hintText: 'Email',
                            prefixIcon: Icon(Icons.email),
                            border: OutlineInputBorder()),
                        onSaved: (text) {
                          name = text;
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
                          border: OutlineInputBorder(),
                        ),
                        onSaved: (text) {
                          password = text;
                        },
                      ),
                      Align(
                        alignment: Alignment.centerRight,
                        child: TextButton(
                          onPressed: () {},
                          child: const Text(
                            "Forgot Password?",
                            style: TextStyle(
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 25),
                      SizedBox(
                        width: 220,
                        child: ElevatedButton(
                            onPressed: () {
                              _savingdata();
                              // Validate returns true if the form is valid, or false otherwise.
                              _showMyDialog();
                            },
                            child: const Text(
                              'Login',
                            )),
                      ),
                      SizedBox(height: 15),
                      Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("Or Login Using social media ",
                                style: TextStyle(color: Colors.grey))
                          ]),
                      SizedBox(height: 30),
                      SignInButton(
                        Buttons.Google,
                        text: "Sign up with Google",
                        onPressed: () {},
                      ),
                      SignInButton(
                        Buttons.Facebook,
                        text: "Sign up with facebook",
                        onPressed: () {},
                      ),
                      SignInButton(
                        Buttons.Twitter,
                        text: "Sign up with facebook",
                        onPressed: () {},
                      ),
                      SizedBox(height: 20),
                      Text('your are new to right !!'),
                      SizedBox(height: 20),
                      SizedBox(
                        width: 220,
                        child: ElevatedButton(
                          child: Text('registre'),
                          onPressed: () {
                            Navigator.pushNamed(context, '/signup');
                          },
                        ),
                      )
                    ],
                  )),
            )
          ]),
        ),
      ),
    );
  }
}

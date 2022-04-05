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
      body: Container(
        width: wid,
        color: Color.fromARGB(255, 176, 216, 198),
        child: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
          ClipRRect(
              borderRadius: BorderRadius.circular(50),
              child: Image.asset('assets/start_app/0.jpg')),
          SizedBox(height: 25),
          Text('Login',
              style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold)),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 35.0),
            child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    TextFormField(
                      decoration: InputDecoration(
                          hintText: 'name', icon: Icon(Icons.person)),
                      onSaved: (text) {
                        name = text;
                      },
                    ),
                    TextFormField(
                      decoration: InputDecoration(
                          hintText: 'pass', icon: Icon(Icons.lock)),
                      onSaved: (text) {
                        password = text;
                      },
                    ),
                    ElevatedButton(
                      onPressed: () {
                        // Validate returns true if the form is valid, or false otherwise.
                        _showMyDialog();
                      },
                      child: const Text('login'),
                    ),
                  ],
                )),
          )
        ]),
      ),
    );
  }
}

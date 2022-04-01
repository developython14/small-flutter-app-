import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:getwidget/getwidget.dart';

class login extends StatefulWidget {
  @override
  State<login> createState() => _loginState();
}

class _loginState extends State<login> {
  final _formKey = GlobalKey<FormState>();
  String name = 'mus';
  var password = 'free';

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
          Form(
              key: _formKey,
              child: Column(
                children: [
                  TextFormField(
                    decoration: InputDecoration(hintText: 'name'),
                  ),
                  TextFormField(
                    decoration: InputDecoration(hintText: 'pass'),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      // Validate returns true if the form is valid, or false otherwise.
                      if (_formKey.currentState!.validate()) {
                        // If the form is valid, display a snackbar. In the real world,
                        // you'd often call a server or save the information in a database.
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('Processing Data')),
                        );
                      }
                    },
                    child: const Text('Submit'),
                  ),
                ],
              ))
        ]),
      ),
    );
  }
}

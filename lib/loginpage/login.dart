import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:getwidget/getwidget.dart';

class login extends StatefulWidget {
  @override
  State<login> createState() => _loginState();
}

class _loginState extends State<login> {
  final _formKey = GlobalKey<FormState>();

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
          SizedBox(height: 25),
          TextField(
            decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: BorderSide(
                        color: Color.fromARGB(255, 230, 230, 230), width: 1)),
                hintText: "email or username",
                icon: Icon(
                  Icons.email,
                  color: Colors.black,
                )),
          ),
          SizedBox(height: 25),
          Container(
            child: TextField(
              obscureText: true,
              decoration: InputDecoration(
                  hintText: "password",
                  suffixIcon:
                      IconButton(onPressed: () {}, icon: Icon(Icons.password)),
                  icon: Icon(
                    Icons.lock,
                    color: Colors.black,
                  )),
            ),
          ),
          SizedBox(height: 25),
          RaisedButton(
            onPressed: () {},
            child: Text("login"),
            color: Colors.blue,
          ),
          SizedBox(height: 25),
          Text("or login using "),
          SizedBox(height: 25),
          Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            GFIconButton(
              onPressed: () {},
              icon: Icon(Icons.facebook),
            ),
            SizedBox(width: 25),
            GFIconButton(
              onPressed: () {},
              icon: Icon(Icons.web),
            ),
            SizedBox(width: 25),
            GFIconButton(
              onPressed: () {},
              icon: Icon(Icons.mail),
            ),
          ]),
          SizedBox(
            width: 200,
            child: TextField(
              autofocus: true,
              decoration: InputDecoration(hintText: "write test text"),
              onChanged: (text) {
                print("raho katteb $text");
              },
            ),
          )
        ]),
      ),
    );
  }
}

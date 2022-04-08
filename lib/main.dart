import 'package:flutter/material.dart';
import 'package:mustapha/main_screen/main_screen.dart';
import 'package:mustapha/loginpage/login.dart';
import 'package:mustapha/intro_screen/intro.dart';
import 'package:mustapha/intro_screen/wait.dart';
import 'package:mustapha/signup_pages/signup.dart';
import 'package:mustapha/signup_pages/signup_mod.dart';
import 'package:mustapha/test.dart';

void main() {
  runApp(MaterialApp(
      title: 'mustapha developper ',
      initialRoute: '/test',
      routes: {
        '/login': (context) => login(),
        '/signup': (context) => signup(),
        '/signupmod': (context) => signupmod(),
        '/intro': (context) => toma(),
        '/wait': (context) => wait(),
        '/free': (context) => univs(),
        '/test': (context) => MyApp(),
      }));
}

import 'package:flutter/material.dart';
import 'package:mustapha/main_screen/main_screen.dart';
import 'package:mustapha/loginpage/login.dart';
import 'package:mustapha/intro_screen/intro.dart';
import 'package:mustapha/intro_screen/wait.dart';
import 'package:mustapha/signup_pages/signup.dart';

void main() {
  runApp(MaterialApp(
      title: 'mustapha developper ',
      initialRoute: '/signup',
      routes: {
        '/login': (context) => login(),
        '/signup': (context) => signup(),
        '/intro': (context) => toma(),
        '/wait': (context) => wait(),
        '/free': (context) => univs(),
      }));
}

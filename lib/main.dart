import 'package:flutter/material.dart';
import 'package:mustapha/main_screen/main_screen.dart';
import 'package:mustapha/loginpage/login.dart';
import 'package:mustapha/intro_screen/intro.dart';
import 'package:mustapha/intro_screen/wait.dart';

void main() {
  runApp(MaterialApp(
      title: 'mustapha developper ',
      initialRoute: '/wait',
      routes: {
        '/': (context) => univs(),
        '/login': (context) => login(),
        '/intro': (context) => toma(),
        '/wait': (context) => wait(),
      }));
}

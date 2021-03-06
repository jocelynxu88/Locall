import 'package:flutter/material.dart';
//import 'RandomWords.dart';
import 'Home.dart';
import 'Login.dart';
import 'Post.dart';
import 'Detailed.dart';
import 'homepage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(title: "HI", initialRoute: '/HomePage', routes: {
      '/Login': (context) => Login(),
      '/Home': (context) => Home(),
      '/Post': (context) => Post(),
      '/Detailed': (context) => Detailed(),
      '/HomePage': (context) => HomepageWidget()
    });
  }
}

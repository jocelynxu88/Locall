import 'package:flutter/material.dart';
//import 'RandomWords.dart';
import 'BottomBar.dart';
import 'Login.dart';
import 'Post.dart';
import 'Detailed.dart';
import 'homepage.dart';
import "Services.dart";
import 'Temp.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(title: "HI", 
    initialRoute: '/Login', 
    routes: {
      '/Login': (context) => Login(),
      '/BottomBar': (context) => BottomBar(),
      '/Post': (context) => Post(),
      '/Detailed': (context) => Detailed(),
      '/HomePage': (context) => HomepageWidget(),
      '/Services' : (context) => Services(),
      '/Temp' : (context) => Temp()
    });
  }
}

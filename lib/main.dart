import 'package:flutter/material.dart';
import 'RandomWords.dart';
import 'Home.dart';
import 'Login.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    /*return MaterialApp(
      home : Scaffold(appBar: 
      AppBar(
        title: Text("HELLO"),
        ),
        )
    );*/
    /*return MaterialApp(
      title: "Hello",
      home: RandomWords(),
    );*/
    /*return MaterialApp(
      title: "HI",
      home: Home()
    );*/
    /*return MaterialApp(
      title: "HI",
      home: Login()
    );*/
    return MaterialApp(
      title: "HI",
      initialRoute: '/Login',
      routes : {
        '/Login' : (context) => Login(),
        '/Home' : (context) => Home(),
      }
    );
  }
}
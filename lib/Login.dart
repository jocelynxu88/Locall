import "package:flutter/material.dart";
import "package:flutter_svg/flutter_svg.dart";

class Login extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
            child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          "WELCOME TO",
          style : TextStyle(fontSize: 40)
        ),
        SvgPicture.asset(
          'assets/logo.svg',
          semanticsLabel: "LOGO",
        ),
        SizedBox(height: 50),
        FractionallySizedBox(
          widthFactor: 0.8,
          child: TextField(
            maxLength: 20,
            decoration: const InputDecoration(
                icon: Icon(Icons.person), hintText: "username"),
          ),
        ),
        FractionallySizedBox(
          widthFactor: 0.8,
          child: TextField(
            obscureText: true,
            onSubmitted: (void v) {
              print("HI");
              return "ehl";
            },
            maxLength: 20,
            decoration: const InputDecoration(
                icon: Icon(Icons.lock_rounded), hintText: "password"),
          ),
        ),
        ElevatedButton(
            onPressed: () {
              print("pressed");
              Navigator.pushNamed(context, '/Post');
            },
            child: Text("Login"))
      ],
    )));
  }
}

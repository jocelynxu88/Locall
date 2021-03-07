import "package:flutter/material.dart";
import "package:flutter_svg/flutter_svg.dart";

class Login extends StatelessWidget {
  final Color defaultGreen = Color(0xEF8EB699);
  final Color buttonGrey = Color(0xFFF2F1F1);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: Center(
            child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [Color.fromRGBO(181, 0, 0, 1), Color.fromRGBO(251, 255, 5, 0.5)])),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text("WELCOME TO", style: TextStyle(fontSize: 40)),
                    SvgPicture.asset(
                      'assets/logo.svg',
                      semanticsLabel: "LOGO",
                    ),
                    SizedBox(height: 50),
                    FractionallySizedBox(
                      widthFactor: 0.8,
                      child: TextField(
                        //maxLength: 20,
                        decoration: const InputDecoration(
                            icon: Icon(Icons.person), hintText: "Username"),
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
                        //maxLength: 20,
                        decoration: const InputDecoration(
                            icon: Icon(Icons.lock_rounded),
                            hintText: "Password"),
                      ),
                    ),
                    SizedBox(height: 70),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.pushNamed(context, '/HomePage');
                      },
                      style: ElevatedButton.styleFrom(
                        side: BorderSide(width: 3.0, color: defaultGreen),
                        primary: buttonGrey,
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0))
                      ),
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(32, 11, 32, 11),
                        child: Text("Login", style: TextStyle(fontSize: 24, fontWeight: FontWeight.w300, color: defaultGreen)),
                      )
                    )
                  ],
                ))));
  }
}

import "package:flutter/material.dart";
import "package:flutter_svg/flutter_svg.dart";
import 'package:url_launcher/url_launcher.dart';
import "BottomBar.dart";
import "Topbar.dart";

class Detailed extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        //bottomNavigationBar: BottomBar(),
        appBar: AppBarScreen(),
        body: SingleChildScrollView(
            child: Align(
                alignment: Alignment.topCenter,
                child: Column(
                  children: [
                    Stack(
                      children: [
                        Image(
                            height: 250.00,
                            fit: BoxFit.fill,
                            image: NetworkImage(
                                'https://scontent.fyzd1-2.fna.fbcdn.net/v/t1.15752-9/157811451_2849217182024767_5430775160607186163_n.jpg?_nc_cat=102&ccb=1-3&_nc_sid=ae9488&_nc_ohc=VDaP_LB4JRcAX_6TCIx&_nc_ht=scontent.fyzd1-2.fna&oh=3895a4baa8b280eb510acbe90377952d&oe=606A8F48')),
                        Positioned(
                            top: 15,
                            right: 15,
                            child: MaterialButton(
                                onPressed: () {},
                                padding: EdgeInsets.all(0.0),
                                height: 60,
                                shape: CircleBorder(),
                                color: Color.fromRGBO(136, 170, 143, 1),
                                child: Text("\$10",
                                    style: TextStyle(
                                        fontSize: 20, color: Colors.white))))
                      ],
                    ),
                    SizedBox(height: 20),
                    FractionallySizedBox(
                        //
                        widthFactor: 0.8,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                                child: Text(
                                    "Take Felix on a Nice Hunt in the Park",
                                    textAlign: TextAlign.left,
                                    style: TextStyle(fontSize: 20))),
                          ],
                        )),
                    SizedBox(height: 10),
                    FractionallySizedBox(
                        widthFactor: 0.8,
                        child: TagThings(tags: ["Dog", "Walking", "Fluffy"])),
                    SizedBox(height: 20),
                    FractionallySizedBox(
                        widthFactor: 0.8,
                        child: Row(
                          children: [
                            Icon(Icons.location_on_sharp,
                                color: Color.fromRGBO(136, 170, 143, 1)),
                            Text("1.0 km",
                                style: TextStyle(
                                    color: Color.fromRGBO(136, 170, 143, 1))),
                          ],
                        )),
                    SizedBox(height: 20),
                    FractionallySizedBox(
                        widthFactor: 0.8,
                        child: Row(
                          children: [
                            Icon(Icons.person,
                                color: Color.fromRGBO(136, 170, 143, 1)),
                            Text("Catherine Burns",
                                style: TextStyle(
                                    color: Color.fromRGBO(136, 170, 143, 1))),
                          ],
                        )),
                    SizedBox(height: 20),
                    FractionallySizedBox(
                        widthFactor: 0.8,
                        child: Text(
                            "I sprained my ankle and can’t walk poor Felix! Could someone give him a short walk around the neighbourhood? He doesn’t pull on the leash and is very gentle with people/dogs.",
                            style: TextStyle(height: 1.5))),
                    SizedBox(height: 30),
                    FractionallySizedBox(
                        widthFactor: 0.9,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Spacer(),
                            Text("Send a text or call",
                                style: TextStyle(fontSize: 12)),
                            MaterialButton(
                                color: Color.fromRGBO(229, 229, 229, 1),
                                height: 50,
                                onPressed: () async {
                                  print("Pressed Me");
                                  const url = 'sms:5550101234';
                                  
                                  bool goLaunch = await canLaunch(url);
                                  if(goLaunch) 
                                  await launch(url);
                                  else {
                                    throw 'Could not launch $url';
                                  }
                                },
                                shape: CircleBorder(),
                                child: SvgPicture.asset('assets/sendIcon.svg',
                                    semanticsLabel: "callIcon"))
                          ],
                        )),
                    SizedBox(height: 30),
                    FractionallySizedBox(
                        widthFactor: 0.9,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Spacer(),
                            Text("Send an email",
                                style: TextStyle(fontSize: 12)),
                            MaterialButton(
                                color: Color.fromRGBO(229, 229, 229, 1),
                                height: 50,
                                onPressed: () {
                                  print("Pressed Me");
                                },
                                shape: CircleBorder(),
                                child: Icon(Icons.email_outlined,
                                    color: Color.fromRGBO(136, 170, 143, 1)))
                          ],
                        ))
                  ],
                ))));
  }
}

class TagThings extends StatelessWidget {
  final List<String> tags;
  TagThings({this.tags});

  Widget build(BuildContext context) {
    final List<Widget> tags = new List<Widget>();
    final Color defaultGreen = Color(0xEF8EB699);

    for (int i = 0; i < this.tags.length; i++) {
      tags.add(
        Padding(
            child: Container(
                height: 22,
                decoration: new BoxDecoration(
                    color: defaultGreen,
                    borderRadius: BorderRadius.circular(10)),
                child: Padding(
                    child: Center(
                        child: Text(this.tags[i],
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: 13.0, color: Colors.white))),
                    padding: const EdgeInsets.fromLTRB(13, 3, 13, 2))),
            padding: const EdgeInsets.fromLTRB(0, 0, 8, 0)),
      );
    }
    return Row(children: tags);
  }
}

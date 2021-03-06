import "package:flutter/material.dart";
import "package:flutter_svg/flutter_svg.dart";
import "BottomBar.dart";

class Detailed extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: BottomBar(),
        appBar: AppBar(title: Text("Some Header")),
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
                                'https://media.wired.com/photos/5dd593a829b9c40008b179b3/191:100/w_2338,h_1224,c_limit/Cul-BabyYoda_mandalorian-thechild-1_af408bfd.jpg')),
                      ],
                    ),
                    SizedBox(height: 20),
                    FractionallySizedBox( //
                        widthFactor: 0.8,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                            child: Text("Take Felix for a nice walk in the park",
                                textAlign: TextAlign.left,
                                style: TextStyle(fontSize: 20))),
                            Container(
                              alignment: Alignment.topLeft,
                            child: MaterialButton(
                                onPressed: () {},
                                padding: EdgeInsets.all(0.0),
                                minWidth: 30,
                                height: 60,
                                shape: CircleBorder(),
                                color: Color.fromRGBO(136, 170, 143, 1),
                                child: Text("\$10",
                                    style: TextStyle(
                                        fontSize: 20, color: Colors.white)))),
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
                            onPressed: () {
                              print("Pressed Me");
                            },
                            shape: CircleBorder(),
                            child: SvgPicture.asset('assets/sendIcon.svg',
                                semanticsLabel: "callIcon"))
                      ],
                    )),
                    SizedBox(height: 30),
                    FractionallySizedBox(
                      widthFactor: 0.9,
                      child:
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Spacer(),
                        Text("Send an email", style: TextStyle(fontSize: 12)),
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

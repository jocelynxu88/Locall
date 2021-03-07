import 'package:flutter/material.dart';
import 'BottomBar.dart';
import 'Topbar.dart';

class Services extends StatefulWidget{
  @override
  _ServicesState createState() => _ServicesState();
}

class _ServicesState extends State<Services>{
  List<ServiceItem> _items = [
    new ServiceItem('https://www.sciencemag.org/sites/default/files/styles/article_main_large/public/dogs_1280p_0.jpg?itok=cnRk0HYq', 'Lawn Mowing', 'name', 11, ['Grass', 'Weed']),
    new ServiceItem('https://flutter.github.io/assets-for-api-docs/assets/widgets/owl.jpg', 'title2', 'name2', 12, ['tag2', 'tagg2']),
    new ServiceItem('https://www.sciencemag.org/sites/default/files/styles/article_main_large/public/dogs_1280p_0.jpg?itok=cnRk0HYq', 'Bark', 'Clifford', 12, ['Rawr', 'Woof'])
  ];

    List<ServiceItem> _reqItems = [
    new ServiceItem('https://static.rogerebert.com/uploads/review/primary_image/reviews/ice-age-the-meltdown-2006/EB20060330REVIEWS60323007AR.jpg', 'title1', 'name', 1, ['tag1', 'tagg1']),
    new ServiceItem('https://i.kym-cdn.com/entries/icons/facebook/000/028/727/Screen_Shot_2019-02-26_at_3.38.50_PM.jpg', 'Get Acorn', 'Johnny', 120, ['Food', 'Exercise']),
    new ServiceItem('https://s.yimg.com/ny/api/res/1.2/WYmIUWk5U3ELBqRdkKdPFQ--/YXBwaWQ9aGlnaGxhbmRlcjt3PTk2MDtoPTUzOS43OTIzODc1NDMyNTI2/https://media-mbst-pub-ue1.s3.amazonaws.com/creatr-uploaded-images/2020-03/56bb7aa0-6a95-11ea-9cd7-6b04cf075a28', 'title3', 'name3', 3, ['tag3', 'tagg3'])
  ];

  bool isOfferedList = true;

  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBarScreen(),
      bottomNavigationBar: BottomBar(),
      body:
        SingleChildScrollView (
          child: Center(
          child: Column(
          //crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 50),
          
          FractionallySizedBox(
            widthFactor: 0.9,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [Text("Services", style : TextStyle(fontSize: 50)),
              ]),
          ),
          SizedBox(height: 50),

          FractionallySizedBox(
            widthFactor: 0.9,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [Text(isOfferedList ? "Offered" : "Requested", style : TextStyle(fontSize: 30)), 
              Switch(
                value: isOfferedList,
                onChanged : (value) {setState((){isOfferedList = !isOfferedList;});}
              )]),
          ),

          FractionallySizedBox(
            widthFactor: 0.9,
            child: Align(
              alignment: Alignment.centerLeft,
              child : ServiceItem("https://www.unitedwayjwc.org/sites/unitedwayjwc.org/files/reading%20buddies%20with%20name.png", "title", "name", 10, ["tag1", "tag2"])
            )
          ),
          for(var item in (isOfferedList ? _items : _reqItems)) FractionallySizedBox(
            widthFactor: 0.9, child: Container(margin: const EdgeInsets.only(top: 20.0), child: item))
        ],),
      )));
  }
}

class ServiceItem extends StatelessWidget{
  final String imgUrl;
  final String title;
  final String name;
  final double price;
  final List<String> tags;

  ServiceItem(this.imgUrl, this.title, this.name, this.price, this.tags);

  Widget build(BuildContext context){
    return(Row(
          children: [
            Image(height: 100, width: 100, image: NetworkImage(this.imgUrl)),
            SizedBox(width: 10),
            Expanded(
            child: Column(
              children: [
              Align(alignment: Alignment.topLeft, child: Text(this.title, style: TextStyle(fontSize: 20))),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                    Align(alignment: Alignment.topLeft, child: 
                    Row(children: [
                      Icon(Icons.person, color: Color.fromRGBO(136, 170, 143, 1)),
                      Text(this.name)])),
                      SizedBox(height: 5),
                      TagThings(tags: this.tags)
                  ],),
                   MaterialButton(
                                onPressed: () {},
                                padding: EdgeInsets.all(0.0),
                                height: 60,
                                shape: CircleBorder(),
                                color: Color.fromRGBO(136, 170, 143, 0.5),
                                child: Text("\$"+this.price.toStringAsFixed(2),
                                    style: TextStyle(
                                        fontSize: 15, color: Colors.white)))
                ],
                )
            ],))
          ],
        )
    );
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
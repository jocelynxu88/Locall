import 'package:flutter/material.dart';
import 'BottomBar.dart';
import 'Topbar.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Services extends StatefulWidget {
  @override
  _ServicesState createState() => _ServicesState();
}

class _ServicesState extends State<Services> {
  List<Map<String, Object>> _items = [
    {
      'url':
          'https://www.sciencemag.org/sites/default/files/styles/article_main_large/public/dogs_1280p_0.jpg?itok=cnRk0HYq',
      'title': 'Lawn Mowing',
      'name': 'name',
      'price': 11.0,
      'tags': ['Grass', 'Weed']
    },
    {
      'url':
          'https://flutter.github.io/assets-for-api-docs/assets/widgets/owl.jpg',
      'title': 'title2',
      'name': 'name2',
      'price': 12.0,
      'tags': ['tag2', 'tagg2']
    },
    {
      'url':
          'https://www.sciencemag.org/sites/default/files/styles/article_main_large/public/dogs_1280p_0.jpg?itok=cnRk0HYq',
      'title': 'Bark',
      'name': 'Clifford',
      'price': 12.0,
      'tags': ['Rawr', 'Woof']
    }
  ];

  List<Map<String, Object>> _reqItems = [
    {
      'url':
          'https://static.rogerebert.com/uploads/review/primary_image/reviews/ice-age-the-meltdown-2006/EB20060330REVIEWS60323007AR.jpg',
      'title': 'My Squirrel is Trapped on an Iceberg!',
      'name': 'John Green',
      'price': 1.0,
      'tags': ['Rescue', 'Ice']
    },
    {
      'url':
          'https://nypost.com/wp-content/uploads/sites/2/2017/05/cat-tree-feature.jpg?quality=80&strip=all&w=618&h=410&crop=1',
      'title': 'My cat is Stuck in a tree',
      'name': 'John Green',
      'price': 99.0,
      'tags': ['Cat', 'Tree']
    },
    {
      'url':
          'https://cdn.harvesttotable.com/htt/2009/07/23190753/Apple-tree-with-fruit1.jpg',
      'title': 'Plant an Apple Tree',
      'name': 'John Green',
      'price': 3.0,
      'tags': ['Apple', 'Tree']
    }
  ];

  final CollectionReference _storeDocs = Firestore.instance.collection('users');

  Future prevServices;

  _ServicesState() {
    print("SERVICE STATE CONSTRUCTOR");
    try {
      prevServices = _storeDocs.getDocuments();
    } catch (e) {
      print(e.toString());
    }
    /*for(int i=0; i<_items.length; i++){
    _storeDocs.add({
      'url' : _items[i]['url'],
      'title' : _items[i]['title'],
      'name' : _items[i]['name'],
      'description' : _items[i]['description'],
      'tags' : _items[i]['tags'],
      'price' : _items[i]['price']
    });*/
    /*for(int i=0; i<_reqItems.length; i++){
    _storeDocs.add({
      'url' : _items[i]['url'],
      'title' : _items[i]['title'],
      'name' : _items[i]['name'],
      'description' : _items[i]['description'],
      'tags' : _items[i]['tags'],
      'price' : _items[i]['price']
    });
    /*print(_items[i]); 
    print(_items[i]['url']);
    print("\n");*/
    }*/
  }

  bool isOfferedList = true;

  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBarScreen(),
        bottomNavigationBar: BottomBar(),
        body: SingleChildScrollView(
            child: Center(
          child: Column(
            //crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 50),
              FractionallySizedBox(
                widthFactor: 0.9,
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Services", style: TextStyle(fontSize: 50)),
                    ]),
              ),
              SizedBox(height: 50),
              FractionallySizedBox(
                widthFactor: 0.9,
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(isOfferedList ? "Offered" : "Requested",
                          style: TextStyle(fontSize: 30)),
                      Switch(
                          value: isOfferedList,
                          onChanged: (value) {
                            setState(() {
                              isOfferedList = !isOfferedList;
                            });
                          })
                    ]),
              ),
              /*FractionallySizedBox(
                  widthFactor: 0.9,
                  child: Align(
                      alignment: Alignment.centerLeft,
                      child: ServiceItem(
                          "https://www.unitedwayjwc.org/sites/unitedwayjwc.org/files/reading%20buddies%20with%20name.png",
                          "title",
                          "name",
                          10,
                          ["tag1", "tag2"]))),*/

                  /*for (var item in (isOfferedList ? _items : _reqItems))
                    FractionallySizedBox(
                        widthFactor: 0.9,
                        child: Container(
                            margin: const EdgeInsets.only(top: 20.0),
                            child: new ServiceItem(item['url'], item['title'],
                                item['name'], item['price'], item['tags']))),*/
                      (isOfferedList ?  FutureWidget() : Column(children: _reqItems.map((item) => 
                        FractionallySizedBox(
                        widthFactor: 0.9,
                        child: Container(
                            margin: const EdgeInsets.only(top: 20.0),
                            child: new ServiceItem(item['url'], item['title'],
                                item['name'], item['price'], item['tags'])))).toList()))
                  
            ],
          ),
        )));
  }
}

/*class FutureWidget extends StatelessWidget{
  final CollectionReference _storeDocs = Firestore.instance.collection('users');

  Future<QuerySnapshot> getDocs () {return _storeDocs.getDocuments();} 

  @override 
  Widget build(BuildContext context){
    return new StreamBuilder<QuerySnapshot>(
      stream: _storeDocs.snapshots(),
      builder: (BuildContext context, AsyncSnapshot <QuerySnapshot> snapshot){
        if(!snapshot.hasData) return LinearProgressIndicator();
        else return getItems(snapshot);
      }
    );
  }

  getItems(AsyncSnapshot<QuerySnapshot> snapshot){
    return Column(children: snapshot.data.documents.map((doc)=> ServiceItem(doc['url'], doc['title'], doc['name'], doc['price'].toDouble(), doc['tag'])).toList());
  }
}*/

class FutureWidget extends StatelessWidget{
  final CollectionReference _storeDocs = Firestore.instance.collection('users');

  @override 
  Widget build(BuildContext context){
    return StreamBuilder<QuerySnapshot>(
      stream: _storeDocs.snapshots(),
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot){
        if(!snapshot.hasData) return new Text("No items");
        return new Column(children : 
        snapshot.data.documents.map((doc)=> FractionallySizedBox(
      widthFactor: 0.9, child: ServiceItem(doc['url'], doc['title'], doc['name'], doc['price'].toDouble(), doc['tags']))).toList()
        //snapshot.data.documents.map((doc) => Text(doc['title'])).toList()
        );
      });
  }
}

class ServiceItem extends StatelessWidget {
  final String imgUrl;
  final String title;
  final String name;
  final double price;
  final List tags;

  ServiceItem(this.imgUrl, this.title, this.name, this.price, this.tags){
    print("^^^^^");
    print(this.imgUrl);
    print(this.title);
    print(this.name);
    print(this.price);
    print(this.tags);
    print(this.tags.toList());
    print(this.tags.toString());
    print(this.tags is List<String>);
    print("@######\n");
  }

  Widget build(BuildContext context) {
    return (Row(
      children: [
        GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, '/Detailed');
            },
            child: Image(
                height: 100, width: 100, 
                image: NetworkImage(this.imgUrl))),
        SizedBox(width: 10),
        Expanded(
          child: Column(
          children: [
            Align(
                alignment: Alignment.topLeft,
                child: Text(this.title, style: TextStyle(fontSize: 20))),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Align(
                        alignment: Alignment.topLeft,
                        child: Row(children: [
                          Icon(Icons.person,
                              color: Color.fromRGBO(136, 170, 143, 1)),
                          Text(this.name)
                        ])),
                    SizedBox(height: 5),
                    TagThings(tags: this.tags)
                  ],
                ),
                MaterialButton(
                    onPressed: () {},
                    padding: EdgeInsets.all(0.0),
                    height: 60,
                    shape: CircleBorder(),
                    color: Color.fromRGBO(136, 170, 143, 0.5),
                    child: Text("\$" + this.price.toStringAsFixed(2),
                        style: TextStyle(fontSize: 15, color: Colors.white)))
              ],
            )
          ],
        ))
      ],
    ));
  }
}

class TagThings extends StatelessWidget {
  final List tags;
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

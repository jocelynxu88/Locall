import 'package:flutter/material.dart';
import "Search.dart";
import 'BottomBar.dart';
import "Topbar.dart";

class HomepageWidget extends StatefulWidget {
  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<HomepageWidget> {
  
  List<JobData> _jobs = [
    new JobData(
        price: 10.00,
        poster: 'Catherine Burns',
        description: "Take Felix on a Nice Hunt in the Park.",
        id: "123",
        imageUrl:
            'https://www.sciencemag.org/sites/default/files/styles/article_main_large/public/dogs_1280p_0.jpg?itok=cnRk0HYq',
        tags: ["Dog", "Walking"]),
    new JobData(
        price: 11.00,
        poster: 'Owl of Perdue',
        description: "I Lost My Pet Owl! Help find him!",
        id: "yay",
        imageUrl:
            'https://flutter.github.io/assets-for-api-docs/assets/widgets/owl.jpg',
        tags: ["Owl", "Bite"]),
    new JobData(
        price: 12.00,
        poster: 'Johnny Appleseed',
        description: "Please Mow My Lawn",
        id: "141",
        imageUrl:
            'https://dynamicmedia.zuza.com/zz/m/original_/0/7/07f717b3-3c7c-4c9f-accb-66428cd6acb9/20170605_153258_resized___Super_Portrait.jpg',
        tags: ["Lawn"]),
    new JobData(
        price: 2.00,
        poster: 'Justin Trudeau',
        description: "Please Shovel My Driveway",
        id: "141",
        imageUrl:
            "https://s3.amazonaws.com/newhobbyfarms.com/wp-content/uploads/2019/03/29203824/winter-snow-driveway.jpg",
        tags: ["Snow", "Shovel"]),
    new JobData(
        price: 15.00,
        poster: 'Billy',
        description: "I need a Math Tutor Quick!",
        id: "141",
        imageUrl:
            'https://d2r55xnwy6nx47.cloudfront.net/uploads/2020/09/Impossible-Math_2880x1220_LHPA.jpg',
        tags: ["Tutor", "Math", "Highschool"]),
    new JobData(
        price: 99.00,
        poster: 'Alvin Dai',
        description: "Make me a Nice Shed so I can watch Disney",
        id: "141",
        imageUrl:
            'https://summitsheds.com/wp-content/uploads/2020/09/Than-min.jpg',
        tags: ["Shed", "Building", "Construction"]),
    new JobData(
        price: 25.00,
        poster: 'Gran Ma',
        description: "Fix My Printer! It's Broken!",
        id: "141",
        imageUrl:
            'https://cdn.thewirecutter.com/wp-content/uploads/2020/03/allinoneprinters-lowres-5889.jpg',
        tags: ["Printer", "Broken", "Fix", "Tech"]),
    new JobData(
        price: 25.00,
        poster: 'Reid',
        description: "I'm Bored! Someone come read with me",
        id: "141",
        imageUrl:
            'https://www.unitedwayjwc.org/sites/unitedwayjwc.org/files/reading%20buddies%20with%20name.png',
        tags: ["Buddy", "Fun", "Reading"]),
  ];

  final Color defaultGreen = Color(0xEF8EB699);


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarScreen(),
      bottomNavigationBar: BottomBar(), body: _buildJobList());
  }

    Widget _buildJobList(){
        return ListView.builder(
            padding: EdgeInsets.fromLTRB(16.0,42.0,16.0,16.0),
            itemBuilder: (context, i){
                if(i >= _jobs.length){ //or fetch more jobs I guess
                    return null;
                }
                return _buildJob(_jobs[i]);
            }
        );
    }
    
    Widget _buildJob(JobData job){
        return Container(child: Padding(
            padding: const EdgeInsets.fromLTRB(0,0,0,20),
            child:  Column(
                children: <Widget>[
                    ClipRRect(
                        child:  Stack(
                            children: <Widget>[
                                GestureDetector(
                                onTap: (){Navigator.pushNamed(context, '/Detailed');},
                                child: Image( height: 200, width: 400, image: NetworkImage(job.imageUrl), fit: BoxFit.fitWidth, alignment:FractionalOffset.topCenter)),
                                Positioned(
                                    top: 15,
                                    right: 15,
                                    child: Container( 
                                        width: 60, height: 60, decoration: new BoxDecoration(color: defaultGreen, borderRadius: BorderRadius.circular(30.0)),
                                        child: Center(child: Text(
                                            '\$'+job.price.toStringAsFixed(0),
                                            textAlign: TextAlign.center,
                                            style: TextStyle(fontSize: 24.0, color: Colors.white)
                                        ))
                                    ),
                                )
                            ]
                        ),
                        borderRadius: BorderRadius.circular(2.0)
                    ),
                    Row(
                        children: <Widget>[
                            Padding(
                                padding: const EdgeInsets.fromLTRB(0,8,0,8),
                                child: Text(job.description, style: TextStyle(fontSize: 18), textAlign: TextAlign.left),
                            )
                        ]
                    ),
                    Row(
                        children: <Widget>[
                            Icon(Icons.account_circle_outlined, color: defaultGreen, size: 18),
                            Padding(
                                padding: const EdgeInsets.fromLTRB(3,0,0,0),
                                child: Text(job.poster, style: TextStyle(fontSize: 13))
                            )
                        ]
                    ),
                    Padding(
                        padding: const EdgeInsets.fromLTRB(0,5,0,3),
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                                job.buildTags(),
                                Row(
                                    children: <Widget>[
                                        Icon(Icons.location_pin, color: defaultGreen, size: 20),
                                        Text('1.0km', style: TextStyle(fontSize: 13.0))
                                    ]
                                )
                            ]
                        )
                    )
                ]
            )
        ));
    }
}

class JobData {
  String description;
  String id;
  double price;
  String imageUrl;
  String poster;
  List<String> tags;

  JobData(
      {this.price,
      this.description,
      this.id,
      this.imageUrl,
      this.poster,
      this.tags});

  Widget buildTags() {
    List<Widget> tags = new List<Widget>();
    final Color defaultGreen = Color(0xEF8EB699);

        for(int i = 0;i < this.tags.length;i++){
            tags.add(
                Padding( child:
                    GestureDetector(
                    child:
                    Container(
                        height: 22, decoration: new BoxDecoration(color: defaultGreen, borderRadius: BorderRadius.circular(10)),
                        child: Padding(
                            child: Center(child: Text(
                                    this.tags[i],
                                    textAlign: TextAlign.center,
                                    style: TextStyle(fontSize: 13.0, color: Colors.white)
                                    )),
                            padding: const EdgeInsets.fromLTRB(13,3,13,2)
                            )
                    )),
                    padding: const EdgeInsets.fromLTRB(0,0,8,0)
                ),
           );
        }
        return Row(children: tags);
    }
}

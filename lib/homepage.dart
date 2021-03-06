import 'package:flutter/material.dart';
import 'BottomBar.dart';

class HomepageWidget extends StatefulWidget{
    @override
    _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<HomepageWidget>{
    final Color defaultGreen = Color(0xEF8EB699);

    final List<JobData> _jobs = [
        new JobData(price: 10.00, poster: 'Catherine Burns', description: "Walk felix pls", id: "123", imageUrl:'https://www.sciencemag.org/sites/default/files/styles/article_main_large/public/dogs_1280p_0.jpg?itok=cnRk0HYq', tags:["Dog", "Walking"]),
        new JobData(price: 11.00, poster: 'Owl of Perdue', description: "Something here", id: "yay", imageUrl:'https://flutter.github.io/assets-for-api-docs/assets/widgets/owl.jpg', tags:["Owl", "Bite"]),
        new JobData(price: 12.00, poster: 'Alvin Dai', description: "Mow Lawn", id: "141", imageUrl:'https://flutter.github.io/assets-for-api-docs/assets/widgets/owl-2.jpg', tags: ["Lawn"]),
    ];

    @override
    Widget build(BuildContext context) {
        return Scaffold(
            bottomNavigationBar: BottomBar(),
            body: _buildJobList()
        );
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
                                Image( height: 200, width: 400, image: NetworkImage(job.imageUrl), fit: BoxFit.fitWidth, alignment:FractionalOffset.topCenter),
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

    JobData({this.price, this.description, this.id, this.imageUrl, this.poster, this.tags}); 

    Widget buildTags(){
        List <Widget> tags = new List<Widget>();
        final Color defaultGreen = Color(0xEF8EB699);

        for(int i = 0;i < this.tags.length;i++){
            tags.add(
                Padding( child:
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
                    ),
                    padding: const EdgeInsets.fromLTRB(0,0,8,0)
                ),
           );
        }
        return Row(children: tags);
    }
}

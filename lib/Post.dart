import 'dart:convert';
import 'dart:io' as Io;

import 'package:flutter/material.dart';
import 'package:flutter_tagging/flutter_tagging.dart';
import 'package:image_picker/image_picker.dart';
import 'Topbar.dart';
import 'dart:async';
import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:my_app/Topbar.dart';

class Post extends StatefulWidget {
  @override
  _PostState createState() => _PostState();
}

class _PostState extends State<Post> {
  final Color defaultGreen = Color(0xEF8EB699);
  final Color buttonGrey = Color(0xFFF2F1F1);
  final picker = ImagePicker();
  File _image;
  final titleController = TextEditingController();
  final priceController = TextEditingController();
  final descriptionController = TextEditingController();
  final tagController = TextEditingController();
  final CollectionReference _storeDocs = Firestore.instance.collection('users');

  List<Language> _selectedLanguages = [];
  bool _isFree = false;

  _openPicker() async {
    final pickedFile = await picker.getImage(
        source: ImageSource.gallery, imageQuality: 60
    );

    setState(() { _image = File(pickedFile.path); });
  }

  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBarScreen(),
      body: SingleChildScrollView(
          padding: const EdgeInsets.only(top: 50),
          child: Align(
            alignment: Alignment.topCenter,
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text("Post Job", style: TextStyle(fontSize: 40)),
                  SizedBox(height: 30),
                  FractionallySizedBox(
                    widthFactor: 0.8,
                    child: TextField(
                      controller: titleController,
                      decoration:
                          const InputDecoration(hintText: "Title of Service"),
                    ),
                  ),
                  SizedBox(height: 10),
                  FractionallySizedBox(
                    widthFactor: 0.8,
                    child: Row(
                      children: [
                        Text("\$ "),
                        Flexible(
                            child: TextFormField(
                              enabled: !_isFree,
                              controller: priceController,
                          decoration:
                              const InputDecoration(hintText: "Offer Price"),
                        )),
                        Checkbox(
                            value: _isFree,
                            onChanged: (int) {
                              setState(() {_isFree = !_isFree;});
                              if(_isFree){
                                priceController.clear();
                                priceController.text = '0';
                              }
                              return 0;
                            }),
                        Text("Free")
                      ],
                    ),
                  ),
                  SizedBox(height: 10),
                  FractionallySizedBox(
                    widthFactor: 0.8,
                    child: TextField(
                      controller: descriptionController,
                      decoration:
                          const InputDecoration(hintText: "Description"),
                    ),
                  ),
                  SizedBox(height: 10),
                  FractionallySizedBox(
                    widthFactor: 0.8,
                    child: TextField(
                      controller: tagController,
                      decoration: const InputDecoration(hintText: "Tags"),
                    ),
                  ),
                  /*FractionallySizedBox(
                      widthFactor: 0.8,
                      child: FlutterTagging<Language>(
                          initialItems: _selectedLanguages,
                          textFieldConfiguration: TextFieldConfiguration(
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              filled: true,
                              fillColor: Colors.green.withAlpha(30),
                              hintText: 'Search Tags',
                              labelText: 'Select Tags',
                            ),
                          ),
                          findSuggestions: LanguageService.getLanguages,
                          additionCallback: (value) {
                            return Language(
                              name: value,
                              position: 0,
                            );
                          },
                          onAdded: (language) {
                            // api calls here, triggered when add to tag button is pressed
                            return Language();
                          },
                          configureSuggestion: (lang) {
                            return SuggestionConfiguration(
                              title: Text(lang.name),
                              subtitle: Text(lang.position.toString()),
                              additionWidget: Chip(
                                avatar: Icon(
                                  Icons.add_circle,
                                  color: Colors.white,
                                ),
                                label: Text('Add New Tag'),
                                labelStyle: TextStyle(
                                  color: Colors.white,
                                  fontSize: 14.0,
                                  fontWeight: FontWeight.w300,
                                ),
                                backgroundColor: Colors.green,
                              ),
                            );
                          },
                          configureChip: (lang) {
                            return ChipConfiguration(
                              label: Text(lang.name),
                              backgroundColor: Colors.green,
                              labelStyle: TextStyle(color: Colors.white),
                              deleteIconColor: Colors.white,
                            );
                          },
                          onChanged: () {
                            print("");
                          })),*/
                  SizedBox(height: 50),
                  GestureDetector(
                        child: Container(
                              height: 200,
                              width: 350,
                              decoration: new BoxDecoration(borderRadius: BorderRadius.circular(10), color: Color(0xFFE5E5E5)),
                              child: _image != null ?
                              Image.file(_image, height: 200, width: 350, fit: BoxFit.fitWidth, alignment: FractionalOffset.topCenter)
                              : Center(
                                  child: Icon(Icons.camera_alt, color: Colors.white, size:90)
                              )
                          ),
                        onTap: () {
                            _openPicker();
                        }
                  ),
                  SizedBox(height: 50),
                  ElevatedButton(
                      onPressed: () async {
                        var a = titleController.text;
                        var b = descriptionController.text;
                        var c = tagController.text;
                        var d = priceController.text;
                        var e;
                        String f;
                        if(titleController.text.isEmpty) a = "No Title";
                        if(descriptionController.text.isEmpty) b = "No Description";
                        if(tagController.text.isEmpty) c = "No Tags";
                        if(priceController.text.isEmpty) d = "No Price";
                        if(_image == null) f = "None";
                        else{
                          //f = base64Encode(_image.readAsBytesSync());
                          f = _image.path;
                        }
                        print(a);
                        print(b);
                        print(c);
                        print(d);
                        print(f);
                        
                        try{
                          await _storeDocs.add({'title': a, 'description' : b, 'tag' : c, 'price' : d, 'image' : f});
                          Navigator.pushNamed(context, '/HomePage');
                        }catch(e){
                          print(e.toString());
                          //Navigator.pushNamed(context, '/HomePage');
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        side: BorderSide(width: 3.0, color: defaultGreen),
                        primary: buttonGrey,
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0))
                      ),
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(32, 11, 32, 11),
                        child: Text("Post", style: TextStyle(fontSize: 24, fontWeight: FontWeight.w300, color: defaultGreen)),
                      )
                    )
                ]),
          )),
    );
  }
}

/// LanguageService
class LanguageService {
  /// Mocks fetching language from network API with delay of 500ms.
  static Future<List<Language>> getLanguages(String query) async {
    await Future.delayed(Duration(milliseconds: 500), null);
    return <Language>[
      Language(name: 'JavaScript', position: 1),
      Language(name: 'Python', position: 2),
      Language(name: 'Java', position: 3),
      Language(name: 'PHP', position: 4),
      Language(name: 'C#', position: 5),
      Language(name: 'C++', position: 6),
    ]
        .where((lang) => lang.name.toLowerCase().contains(query.toLowerCase()))
        .toList();
  }
}

/// Language Class
class Language extends Taggable {
  ///
  final String name;

  ///
  final int position;

  /// Creates Language
  Language({
    this.name,
    this.position,
  });

  @override
  List<Object> get props => [name];

  /// Converts the class to json string.
  String toJson() => '''  {
    "name": $name,\n
    "position": $position\n
  }''';
}

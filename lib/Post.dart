import 'package:flutter/material.dart';
import 'package:flutter_tagging/flutter_tagging.dart';

class Post extends StatefulWidget {
  @override
  _PostState createState() => _PostState();
}

class _PostState extends State<Post> {
  List<Language> _selectedLanguages = [];
  bool _isFree = false;

  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        //title: Text("Ask for Help"),
      ),
      body: SingleChildScrollView(
          padding: const EdgeInsets.only(top: 50),
          child: Align(
            alignment: Alignment.topCenter,
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text("Ask for Help", style: TextStyle(fontSize: 40)),
                  SizedBox(height: 30),
                  FractionallySizedBox(
                    widthFactor: 0.8,
                    child: TextField(
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
                          decoration:
                              const InputDecoration(hintText: "Offer Price"),
                        )),
                        Checkbox(
                            value: _isFree,
                            onChanged: (int) {
                              print("check");
                              setState(() {_isFree = !_isFree;});
                              print(_isFree);
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
                      decoration:
                          const InputDecoration(hintText: "Description"),
                    ),
                  ),
                  SizedBox(height: 10),
                  FractionallySizedBox(
                    widthFactor: 0.8,
                    child: TextField(
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
                  SizedBox(height: 10),
                  ElevatedButton(
                      onPressed: () {
                        Navigator.pushNamed(context, '/Home');
                      },
                      child: Text("Post"))
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

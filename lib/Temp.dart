import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Temp extends StatelessWidget{
  final CollectionReference _ffRef = Firestore.instance.collection('users');
  var b;

  Future addPost() async{
    try{
      await _ffRef.add({"DocumentId": 2, 'name': "heheheh rayray"});
      return true;
    } catch(e){
      return e.toString();
    }
  }

  Future getPost() async{
    try{
      var getDocs = await _ffRef.getDocuments();
      print(getDocs);
      print(getDocs.documents.length);
      print("here");
      print(getDocs.documents[0].data);
      return true;
    }catch(e){
      return e.toString();
    }
  }

  @override
  Widget build(BuildContext build){
    return Scaffold(
      body: Center(child: ElevatedButton(
        onPressed: () async {
          //var a = await addPost();
          var a = await getPost();
          print(a);
          },
        child: Text("YO"),)    ,
        ));
  }
}
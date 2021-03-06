import "package:flutter/material.dart";
import 'Search.dart';

class AppBarScreen extends StatelessWidget implements PreferredSizeWidget {
  //AppBarScreen({Key key}) : super(key: key);
  
  @override
  Size get preferredSize => new Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      title: const Text('LoCall'),
      backgroundColor: Color.fromRGBO(136, 170, 143, 1),
      actions: <Widget>[
        IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              showSearch(context: context, delegate: DataSearch());
            })
      ],
    );
  }
}

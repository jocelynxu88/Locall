import "package:flutter/material.dart";
import 'Search.dart';
import "package:flutter_svg/flutter_svg.dart";

class AppBarScreen extends StatelessWidget implements PreferredSizeWidget {
  //AppBarScreen({Key key}) : super(key: key);

  @override
  Size get preferredSize => new Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          SvgPicture.asset(
            'assets/whitelogo.svg',
            fit: BoxFit.cover,
            height: 35.0,
          ),
        ],
      ),
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

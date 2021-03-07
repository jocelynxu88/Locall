import "package:flutter/material.dart";
import "package:flutter_svg/flutter_svg.dart";

class BottomBar extends StatelessWidget{
  @override 
  Widget build(BuildContext context){
    return BottomAppBar(
      child: FractionallySizedBox(
        widthFactor: 0.9,
        child: Row(
          children: [
            IconButton(
              icon: Icon(Icons.house, color: Color.fromRGBO(136, 170, 143, 1), size: 35), 
              onPressed: () {
                if('/HomePage' != ModalRoute.of(context).settings.name) Navigator.pushNamed(context, '/HomePage');}),
            Spacer(),
            MaterialButton(
              color: Color.fromRGBO(136, 170, 143, 1),
              height: 40,
              onPressed: (){Navigator.pushNamed(context, "/Post");},
              shape: CircleBorder(),
              child : Icon(Icons.add, color: Colors.white,),
            ),
            Spacer(),
            IconButton(
              icon: SvgPicture.asset('assets/handshake.svg'), 
              onPressed: () {if('/Services' != ModalRoute.of(context).settings.name) Navigator.pushNamed(context, '/Services');}),
          ],
        )),
      );
  }
}
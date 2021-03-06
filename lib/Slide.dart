// //import 'dart:html';

// //i dont think this works lol

// import 'package:flutter/material.dart';

// class PriceSlider extends StatefulWidget {
//   PriceSlider({Key key}): super(key: key);

//   @override
//   _PriceSliderState createState() => _PriceSliderState();
// }

// class _PriceSliderState extends State<PriceSlider> {
//   int _value = 30;
//   @override
//   Widget build(BuildContext context) {
//     return Slider(
//           value: _value.toDouble(),
//           min: 0,
//           max: 30,
//           divisions: 30,
//           activeColor: Colors.green,
//           inactiveColor: Colors.blueGrey,
//           label: 'Price Search',
//           onChanged: (double newValue) {
//             setState((){
//               _value = newValue.round();} ,
//             );
//           });

//   }
// }

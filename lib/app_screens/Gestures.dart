
import 'package:flutter/material.dart';

class Gestures extends StatefulWidget{

  GestureEvents createState() =>GestureEvents();
}

class GestureEvents extends State<Gestures>{

  bool tapped=false;
  @override
  Widget build(BuildContext context) {

    return
      GestureDetector(onDoubleTap: _doubleTap,
      child:  Container(

        color: /*(tapped?Colors.blue: */Colors.amber/*)*/,




      ) ,
      );


  }


  void _doubleTap() {
    (tapped? false:true);
  }
}
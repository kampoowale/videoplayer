import 'dart:math';

import 'package:flutter/material.dart';

class FirstScreen extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Material (
      color: Colors.lightBlueAccent,
      child: Center(
        child: GestureDetector( onTap: generateLuckyNumber,
          child: setUI(),
        ),
      ),
    );
  }

String generateLuckyNumber(){
    var randon=Random();
    return   "Your number ${randon.nextInt(10)}";
}
Text setUI(){

 return Text(
    generateLuckyNumber(),
    textDirection:  TextDirection.ltr,
    style: TextStyle(color: Colors.white,fontSize: 40.0, letterSpacing: 2.0),
  );

}

}
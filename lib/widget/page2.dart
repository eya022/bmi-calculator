import 'package:bmi/widget/page2body.dart';
import 'package:flutter/material.dart';
import 'dart:ui';

class page2 extends StatelessWidget {
  const page2({ Key? key}):super(key: key);


  @override
  Widget build (BuildContext context){
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 218, 212, 203),
      body: Page2Body(),
    );
  }
}
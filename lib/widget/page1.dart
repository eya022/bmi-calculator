import 'package:bmi/widget/page1body.dart';
import 'package:flutter/material.dart';
import 'dart:ui';

class page1 extends StatelessWidget {
  const page1({ Key? key}):super(key: key);


  @override
  Widget build (BuildContext context){
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 204, 202, 199),
      body: Page1Body(),
    );
  }
}
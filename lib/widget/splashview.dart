import 'package:bmi/widget/splashbody.dart';
import 'package:flutter/material.dart';


class SplashView extends StatelessWidget {
  const SplashView({ Key? key}):super(key: key);


  @override
  Widget build (BuildContext context){
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 219, 213, 197),
      body: SplashViewBody(),
    );
  }
}
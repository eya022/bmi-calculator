import 'package:bmi/core/utils/size_config.dart';
import 'package:bmi/widget/page1.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'dart:ui';
class SplashViewBody extends StatefulWidget {
  const SplashViewBody({Key? key}) : super(key: key);

  @override
  _SplashViewBodyState createState() => _SplashViewBodyState();
}

class _SplashViewBodyState extends State<SplashViewBody>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  late Animation<double> fadingAnimation;

  @override
  void initState() {
    super.initState();
    animationController = AnimationController(
      duration: Duration(seconds: 1),
      vsync: this,
    )..repeat();

    goToNextView();
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Bmi Calculator',
            style: TextStyle(
              fontSize: 40,
              fontWeight: FontWeight.bold,
              color: Color.fromARGB(255, 2, 115, 160),
            ),
          ),
          SizedBox(height: 100),
          AnimatedBuilder(
            animation: animationController,
            builder: (context, child) {
              return Transform.rotate(
                angle: animationController.value * 2.0 * 3.1416,
                child: Container(
                  width: 80,
                  height: 80,
                  child: IconButton(
                    icon: Icon(
                      Icons.refresh_rounded,
                      size: 80,
                      color: Color.fromARGB(255, 2, 115, 160),
                    ),
                    onPressed: () {
                      // Handle the reload icon click
                      // You can add your reload logic here
                    },
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }

  void goToNextView() {
    Future.delayed(Duration(seconds: 3), () {
      if (mounted) {
        Get.to(() => page1(), transition: Transition.fade);
      }
    });
  }
}

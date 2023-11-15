import 'package:bmi/core/utils/size_config.dart';
import 'package:bmi/widget/page2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Page1Body extends StatefulWidget {
  const Page1Body({Key? key}) : super(key: key);

  @override
  _Page1BodyState createState() => _Page1BodyState();
}

class _Page1BodyState extends State<Page1Body>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  late Animation<double> fadingAnimation;

  String? selectedGender;

  @override
  void initState() {
    super.initState();
    // Initialize animationController and fadingAnimation here
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 100,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'BMI Calculator',
            style: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.w900,
              color: Color.fromARGB(255, 82, 48, 0),
            ),
          ),
          SizedBox(height: 50),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'What\'s Your Gender?',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 82, 48, 0),
                ),
              ),
              SizedBox(height: 80),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Column(
                    children: [
                      Image.asset(
                        'assets/images/woman.png',
                        height: 250,
                        width: 180,
                      ),
                      SizedBox(height: 30),
                      Radio(
                        value: 'female',
                        groupValue: selectedGender,
                        onChanged: (value) {
                          setState(() {
                            selectedGender = value as String?;
                          });
                        },
                      ),
                      Text(
                        'Female',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Color.fromARGB(255, 82, 48, 0),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(width: 10),
                  Column(
                    children: [
                      Image.asset(
                        'assets/images/man.png',
                        height: 250,
                        width: 180,
                      ),
                      SizedBox(height: 32),
                      Radio(
                        value: 'male',
                        groupValue: selectedGender,
                        onChanged: (value) {
                          setState(() {
                            selectedGender = value as String?;
                          });
                        },
                      ),
                      Text(
                        'Male',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Color.fromARGB(255, 82, 48, 0),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
          SizedBox(height: 70),
          Center(
            child: ElevatedButton(
              onPressed: () {
                if (selectedGender != null) {
                  goToNextView();
                } else {
                  // Change the button color to green when there's an error
                  setState(() {});
                }
              },
              child: Text(
                'Next',
                style: TextStyle(
                  color: Color.fromARGB(255, 204, 202, 199),
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.symmetric(horizontal: 120, vertical: 15),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(50),
                ),
                primary: selectedGender != null
                    ? Color.fromARGB(255, 255, 89, 0)
                    : Colors.grey, // Change color to green on error
                elevation: 10,
              ),
            ),
          ),
        ],
      ),
    );
  }

  void goToNextView() {
    if (mounted) {
      Get.to(() => page2(), transition: Transition.fade);
    }
  }
}

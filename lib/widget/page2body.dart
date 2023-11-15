import 'package:bmi/widget/page1.dart';
import 'package:bmi/widget/page3.dart';
import 'package:flutter/material.dart';
import 'package:flutter_xlider/flutter_xlider.dart';
import 'package:get/get.dart';

class Page2Body extends StatefulWidget {
  const Page2Body({Key? key}) : super(key: key);

  @override
  _Page2BodyState createState() => _Page2BodyState();
}

class _Page2BodyState extends State<Page2Body> with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  late Animation<double> fadingAnimation;
  double heightValue = 0.0;
  TextEditingController heightValueController = TextEditingController();
  TextEditingController weightController = TextEditingController();
  TextEditingController ageController = TextEditingController();
  String resultText = '';

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

  void resetValues() {
    setState(() {
      heightValue = 0.0;
      heightValueController.text = '';
      weightController.text = '';
      ageController.text = '';
      resultText = '';
    });
  }

  double calculateBmi(double weight, double height) {
    if (height > 0) {
      double heightInMeters = height / 100.0;
      return weight / (heightInMeters * heightInMeters);
    } else {
      return 0.0;
    }
  }

  void updateColor(double bmi) {
    // Add color updating logic based on BMI here
  }

  void goToNextView() {
    if (true) {
      Get.to(() => page1(), transition: Transition.fade);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 30,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          InkWell(
            onTap: () {
              goToNextView();
            },
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 20, horizontal: 0),
              decoration: BoxDecoration(
                color: Colors.transparent,
              ),
              child: Transform(
                alignment: Alignment.center,
                transform: Matrix4.rotationY(180 * 3.1415927 / 180),
                child: Icon(
                  Icons.arrow_forward,
                  color: Color.fromARGB(255, 82, 48, 0),
                  size: 30,
                ),
              ),
            ),
          ),
          SizedBox(height: 60),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'How tall are you?',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 82, 48, 0),
                ),
              ),
              SizedBox(height: 10),
              Text(
                'on cm',
                style: TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.normal,
                  color: Color.fromARGB(255, 82, 48, 0),
                ),
              ),
              SizedBox(height: 10),
              Stack(
                alignment: Alignment.center,
                children: [
                  FlutterSlider(
                    values: [heightValue],
                    min: 0,
                    max: 250,
                    onDragging: (handlerIndex, lowerValue, upperValue) {
                      setState(() {
                        heightValue = lowerValue;
                        heightValueController.text = lowerValue.toStringAsFixed(2);
                      });
                    },
                    tooltip: FlutterSliderTooltip(
                      format: (String value) {
                        return value + ' cm';
                      },
                      textStyle: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: Color.fromARGB(255, 255, 255, 255),
                      ),
                      boxStyle: FlutterSliderTooltipBox(
                        decoration: BoxDecoration(
                          color: Color.fromARGB(255, 82, 48, 0),
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                    ),
                    trackBar: FlutterSliderTrackBar(
                      inactiveTrackBar: BoxDecoration(
                        color: Colors.grey,
                      ),
                      activeTrackBar: BoxDecoration(
                        color: Color.fromARGB(255, 82, 48, 0),
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    child: Text(
                      'Current Value: ${heightValueController.text} cm',
                      style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.normal,
                        color: Color.fromARGB(255, 82, 48, 0),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 80),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'What\'s your weight ?',
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          color: Color.fromARGB(255, 82, 48, 0),
                        ),
                      ),
                      SizedBox(height: 10),
                      Container(
                        width: 70,
                        height: 50,
                        padding: EdgeInsets.symmetric(horizontal: 10),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(
                            color: Color.fromARGB(255, 82, 48, 0),
                            width: 2,
                          ),
                        ),
                        child: TextField(
                          controller: weightController,
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                            hintText: 'weight',
                            hintStyle: TextStyle(fontSize: 12),
                            border: InputBorder.none,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(width: 10),
                  Column(
                    children: [
                      Container(
                        padding: EdgeInsets.only(left: 16.0, top: 8.0),
                        child: Text(
                          'What\'s your age ?',
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            color: Color.fromARGB(255, 82, 48, 0),
                          ),
                        ),
                      ),
                      SizedBox(height: 10),
                      Container(
                        width: 70,
                        height: 50,
                        padding: EdgeInsets.symmetric(horizontal: 10),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(
                            color: Color.fromARGB(255, 82, 48, 0),
                            width: 2,
                          ),
                        ),
                        child: TextField(
                          controller: ageController,
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                            hintText: 'age',
                            hintStyle: TextStyle(fontSize: 12),
                            border: InputBorder.none,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(height: 75),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      resetValues();
                    },
                    style: ElevatedButton.styleFrom(
                      primary: Color.fromARGB(255, 255, 89, 0),
                      onPrimary: Colors.white,
                      padding: EdgeInsets.symmetric(horizontal: 40, vertical: 12),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                    child: Text('Reset'),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      double height = double.tryParse(heightValueController.text) ?? 0.0;
    double weight = double.tryParse(weightController.text) ?? 0.0;
    double res = calculateBmi(weight, height);
    String x = res.toStringAsFixed(1);
    String cat='';
if (res<=16){cat='underweigh';}
else if (res>16 && res<=17){cat='underweigh';}
else if (res>17 && res<=18.5){cat='underweigh';}
else if (res>18.5 && res<=25){cat='normal';}
else if (res>25 && res<=30){cat='overweigh';}
else if (res>30 && res<=35){cat='Obesity';}
else if (res>35 && res<=40){cat='Obesity';}
else {cat='Obesity';}
    setState(() {
      resultText = 'Your BMI is $x';
      updateColor(res);

    });
    goToNexttView(res,cat);

                    },
                    style: ElevatedButton.styleFrom(
                      primary: Color.fromARGB(255, 20, 160, 46),
                      onPrimary: Colors.white,
                      padding: EdgeInsets.symmetric(horizontal: 30, vertical: 12),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                    child: Text('Calculate'),
                  ),
                ],
              ),
              SizedBox(height: 20), // Added spacing
             
            ],
          ),
        ],
      ),
    );
  }
}

void goToLasttView() {
  if (true) {
    Get.to(() => page1(), transition: Transition.fade);
  }
}
void goToNexttView(double bmiResult,String bmicat) {
  if (true) {
    Get.to(() => Page3body(bmiResult: bmiResult,bmicat: bmicat), transition: Transition.fade);
  }
}
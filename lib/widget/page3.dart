import 'package:flutter/material.dart';

class Page3body extends StatelessWidget {
  final double bmiResult;
  final String bmicat;

  const Page3body({Key? key, required this.bmiResult, required this.bmicat}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      backgroundColor: Color.fromARGB(255, 213, 200, 181),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: 20), // Adjust the height as needed for spacing
            Text(
              'Results',
              style: TextStyle(
                fontSize: 60,
                fontWeight: FontWeight.bold,
                fontFamily: 'SatifyRegular', // Use your desired font
                color: Color.fromARGB(255, 82, 48, 0),
              ),
            ),
            SizedBox(height: 100), // Adjust the height as needed for spacing
            Container(
              width: 300,
              child: Text(
                'Your BMI is $bmiResult indicating that your weight is in the $bmicat',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.normal,
                  fontFamily: 'ClassicFont', // Use your desired font
                  color:Color.fromARGB(255, 82, 48, 0),
                ),
                textAlign: TextAlign.left,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

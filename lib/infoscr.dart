import 'package:flutter/material.dart';
import 'package:get/get.dart';

class InformationScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Getting arguments passed from InputScreen
    final List<int> data = Get.arguments;

    // Determine the blood pressure category
    String category = determineCategory(data[0], data[1]);

    // Define image paths for each category
    String imagePath = '';
    String resultMessage = '';
    switch (category) {
      case 'Normal':
        imagePath = 'assets/normal.png';
        resultMessage = 'Your blood pressure is normal';
        break;
      case 'Elevated':
        imagePath = 'assets/elevated.png';
        resultMessage =
            'Your blood pressure is elevated. You should monitor your blood pressure regularly.';
        break;
      case 'Hypertension Stage 1':
        imagePath = 'assets/hyper1.png';
        resultMessage =
            'You have hypertension stage 1. It is recommended to consult a doctor for further evaluation.';
        break;
      case 'Hypertension Stage 2':
        imagePath = 'assets/hyper2.png';
        resultMessage =
            'You have hypertension stage 2. It is important to seek medical attention immediately.';
        break;
      case 'Hypertensive Crisis':
        imagePath = 'assets/risk.png';
        resultMessage =
            'You are experiencing a hypertensive crisis. Please seek immediate medical attention.';
        break;
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('Information Screen'),
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/bgimg.jpg'), // Change to your image path
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                imagePath,
                height: 150, // Increase the height as needed
              ),
              SizedBox(height: 20),
              Text(
                'Category',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.white.withOpacity(0.5), // Change text color
                ),
              ),
              Text(
                category,
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Colors.white, // Change text color
                ),
              ),
              SizedBox(height: 20),
              Text(
                'Result',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.white.withOpacity(0.5), // Change text color
                ),
              ),
              Text(
                resultMessage,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.white, // Change text color
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Function to determine blood pressure category
  String determineCategory(int systolic, int diastolic) {
    if (systolic < 120 && diastolic < 80) {
      return 'Normal';
    } else if (systolic >= 120 && systolic <= 129 && diastolic < 80) {
      return 'Elevated';
    } else if ((systolic >= 130 && systolic <= 139) ||
        (diastolic >= 80 && diastolic <= 89)) {
      return 'Hypertension Stage 1';
    } else if ((systolic >= 140 && systolic < 180) ||
        (diastolic >= 90 && diastolic < 120)) {
      return 'Hypertension Stage 2';
    } else {
      return 'Hypertensive Crisis';
    }
  }
}

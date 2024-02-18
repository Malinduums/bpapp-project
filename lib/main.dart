import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'inputscr.dart';
import 'infoscr.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Blood Pressure Monitor',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/input',
      getPages: [
        GetPage(name: '/input', page: () => InputScreen()),
        GetPage(name: '/information', page: () => InformationScreen()),
      ],
    );
  }
}

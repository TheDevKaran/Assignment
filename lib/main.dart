import 'package:flutter/material.dart';
// import 'package:/getstarted.dart';

import 'screens/welcome_screen.dart';


void main() {
  runApp(const weatherapp());
}
class weatherapp extends StatelessWidget {
  const weatherapp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Weather App',
      home: GetStarted(),
    );
  }
}


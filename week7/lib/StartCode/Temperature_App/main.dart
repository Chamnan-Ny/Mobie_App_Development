import 'package:flutter/material.dart';
import 'screen/byebye.dart';
import 'screen/temperature_screen.dart';
import 'screen/welcome_screen.dart';


class TemperatureApp extends StatefulWidget {
  const TemperatureApp({super.key});

  @override
  State<TemperatureApp> createState() {
    return _TemperatureAppState();
  }
}

class _TemperatureAppState extends State<TemperatureApp> {
  // bool display = false;
  int a = 0;
  @override
  Widget build(BuildContext context) {
    Widget nextScreen;

    if (a == 0) {
      nextScreen = WelcomeScreen(
        onStart: () {
          setState(() {
            a++;
          });
        },
      );
    } else {
      nextScreen = TemperatureScreen(
        nextPage: () {
          setState(() {
            a++;
          });
        },
      );
    }
    if (a == 2) {
      nextScreen = Buton();
    }

    return MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [Color(0xff16C062), Color(0xff00BCDC)],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: nextScreen,
        ),
      ),
    );
  }
}



void main() {
  runApp(const TemperatureApp());
}

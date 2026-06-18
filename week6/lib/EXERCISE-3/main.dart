
import 'package:flutter/material.dart';
import 'ui/screens/welcome_screen.dart';
import 'ui/screens/temperature_screen.dart';

void main() {
  runApp(const MaterialApp(home: TemperatureApp()));
}

class TemperatureApp extends StatefulWidget {
  const TemperatureApp({super.key});

  @override
  State<TemperatureApp> createState() => _TemperatureAppState();
}

class _TemperatureAppState extends State<TemperatureApp> {
  bool isWelcomeScreen = true;

  void switchToConverter() {
    setState(() {
      isWelcomeScreen = false;
    });
  }

  @override
  Widget build(context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xff16C062), Color(0xff00BCDC)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: isWelcomeScreen
            ? WelcomeScreen(onStart: switchToConverter)
            : TemperatureScreen(),
      ),
    );
  }
}

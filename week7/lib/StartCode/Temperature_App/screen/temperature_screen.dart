import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class TemperatureScreen extends StatefulWidget {
  const TemperatureScreen({super.key, required this.nextPage});

  @override
  State<TemperatureScreen> createState() => _TemparatureScreen();

  final VoidCallback nextPage;
}

class _TemparatureScreen extends State<TemperatureScreen> {
  final InputDecoration inputDecoration = InputDecoration(
    enabledBorder: OutlineInputBorder(
      borderSide: const BorderSide(color: Colors.white, width: 1.0),
      borderRadius: BorderRadius.circular(12),
    ),
    hintText: 'Enter a temperature',
    hintStyle: const TextStyle(color: Colors.white),
  );

  String value = "0";

  void onTextPressed(String newValue) {
    double? newValue1 = double.tryParse(newValue);

    if (newValue1 == null) {
      setState(() {
        value = "No Value";
      });
    } else {
      newValue1 = (newValue1 * 9 / 5) + 32;
      setState(() {
        value = newValue1.toString() + " f";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(40.0),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Icon(
              Icons.thermostat_outlined,
              size: 120,
              color: Colors.white,
            ),
            const Center(
              child: Text(
                "Converter",
                style: TextStyle(color: Colors.white, fontSize: 45),
              ),
            ),

            // Filler
            const SizedBox(height: 50),
            const Text("Temperature in Degrees:"),
            const SizedBox(height: 10),
            TextField(
              onChanged: onTextPressed,
              decoration: inputDecoration,
              style: const TextStyle(color: Colors.white),
            ),
            const SizedBox(height: 30),
            const Text("Temperature in Farenhits"),

            // Converter
            const SizedBox(height: 10),
            Container(
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Text(value, style: TextStyle(color: Colors.black)),
            ),

            const SizedBox(height: 30),
            OutlinedButton(
              onPressed: widget.nextPage,
              style: OutlinedButton.styleFrom(
                side: const BorderSide(width: 1.0, color: Colors.white),
              ),
              child: const Text(
                'Next Page',
                style: TextStyle(color: Colors.white, fontSize: 15),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

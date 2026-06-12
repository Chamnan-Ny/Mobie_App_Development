import 'package:flutter/material.dart';

class SelectableButton extends StatefulWidget {
  const SelectableButton({super.key});

  @override
  State<SelectableButton> createState() {
    return _SelectableButtonState();
  }
}

class _SelectableButtonState extends State<SelectableButton> {
  bool isSelected = false;

  void changeButton() {
    setState(() {
      isSelected = !isSelected;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 400,
      height: 100,
      child: ElevatedButton(
        onPressed: changeButton,
        style: ElevatedButton.styleFrom(
          backgroundColor: isSelected ? Colors.blue : Colors.white,
        ),
        child: Text(
          isSelected ? "Selected" : "Not Selected",
          style: TextStyle(color: isSelected ? Colors.white : Colors.black),
        ),
      ),
    );
  }
}

void main() {
  runApp(
    const MaterialApp(
      home: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SelectableButton(),
              SelectableButton(),
              SelectableButton(),
            ],
          ),
        ),
      ),
    ),
  );
}

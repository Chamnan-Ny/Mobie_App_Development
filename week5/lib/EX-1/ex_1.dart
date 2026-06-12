import 'package:flutter/material.dart';

class SelectedButton extends StatefulWidget {
  const SelectedButton({super.key});

  @override
  State<SelectedButton> createState() => _SelectedButtonState();
}

class _SelectedButtonState extends State<SelectedButton> {
  bool isSelected = false;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: 400,
        height: 100,
        child: ElevatedButton(
          onPressed: () {
            setState(() {
              isSelected = !isSelected;
            });
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: isSelected ? Colors.blue[500] : Colors.blue[50],
          ),
          child: Text(
            style: TextStyle(
              color: isSelected ? Colors.white : Colors.black
            ),
            isSelected ? "Selected" : "Not Selected"
          ),
        ),
      ),
    );
  }
}

void main() => runApp(
  MaterialApp(
    home: Scaffold(
      appBar: AppBar(title: const Text("Custom buttons")),
      body: Center(
        child: Column(
          children: [
            SelectedButton(),
            SizedBox(
              height: 20,
            ),
            SelectedButton(),
            SizedBox(
              height: 20,
            ),
            SelectedButton(),
            SizedBox(
              height: 20,
            ),
            SelectedButton(),
            SizedBox(height: 20)
          ],
        ),
      )
    ),
  ),
);

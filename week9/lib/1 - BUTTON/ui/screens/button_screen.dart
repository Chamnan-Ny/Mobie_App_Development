import 'package:flutter/material.dart';

import '../../models/button_status.dart';
import '../../repository/button_repository.dart';

class ButtonScreen extends StatefulWidget {
  @override
  ButtonScreenState createState() => ButtonScreenState();
}

class ButtonScreenState extends State<ButtonScreen> {
  // Simple variables to hold state
  final repo = ButtonRepository();
  bool isLoading = true;
  ButtonStatus? buttonData;
  String? errorMessage;

  @override
  void initState() {
    super.initState();
    fetchButtonData(); // Start fetching on load [cite: 25, 30]
  }

  void fetchButtonData() async {
    setState(() {
      isLoading = true;
      errorMessage = null;
    });

    try {
      final data = await repo.getButtonStatus();
      setState(() {
        buttonData = data;
        isLoading = false;
      });
    } catch (e) {
      setState(() {
        errorMessage = "Error: Could not fetch data";
        isLoading = false;
      });
    }
  }

  void toggleButton() async {
    bool newStatus = !buttonData!.selected;
    try {
      await repo.updateSelectedStatus(newStatus);
      setState(() {
        buttonData = ButtonStatus(name: buttonData!.name, selected: newStatus);
      });
    } catch (e) {
      print("Update Failed");
    }
  }

  @override
  Widget build(BuildContext context) {
    if (isLoading) return CircularProgressIndicator();
    if (errorMessage != null) return Text(errorMessage!);

    return Center(
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: buttonData!.selected ? Colors.blue : Colors.white,
        ),
        onPressed: toggleButton,
        child: Text(buttonData!.name),
      ),
    );
  }
}

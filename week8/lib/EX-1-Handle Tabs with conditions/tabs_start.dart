// import 'package:first_project/W8-PRACTICE/EX-1-Handle%20Tabs%20with%20conditions/tabs_final.dart';
import 'package:flutter/material.dart';

class RedScreen extends StatelessWidget {
  const RedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.red,
      child: Center(child: Text("Red Screen")),
    );
  }
}

class BlueScreen extends StatelessWidget {
  const BlueScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blue,
      child: Center(child: Text("Blue Screen")),
    );
  }
}

class GreenScreen extends StatelessWidget {
  const GreenScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.green,
      child: Center(child: Text("Green Screen")),
    );
  }
}

enum AppTabs { red, green, blue }

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  AppTabs activeScreen = AppTabs.green;

  void showGreen() {
    setState(() {
      activeScreen = AppTabs.green;
    });
  }

  void showBlue() {
    setState(() {
      activeScreen = AppTabs.blue;
    });
  }

  void showRed() {
    setState(() {
      activeScreen = AppTabs.red;
    });
  }

  Widget get content{
    return switch (activeScreen) {
      AppTabs.green => GreenScreen(),
      AppTabs.blue => BlueScreen(),
      AppTabs.red => RedScreen(),
    };
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Tabs navigation")),
      body: content,
      bottomNavigationBar: BottomAppBar(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            IconButton(
              onPressed: showGreen,
              icon: Icon(Icons.home, color: Colors.green),
            ),
            IconButton(
              onPressed: showRed,
              icon: Icon(Icons.home, color: Colors.red),
            ),
            IconButton(
              onPressed: showBlue,
              icon: Icon(Icons.home, color: Colors.blue),
            ),
          ],
        ),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(debugShowCheckedModeBanner: false, home: App()));
}

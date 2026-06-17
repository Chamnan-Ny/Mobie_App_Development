import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: Scaffold(
      body: Container(
        padding: EdgeInsets.all(15),
        margin: EdgeInsets.all(20),
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.all(20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.blue[100],
              ),
              child: Center(
                child: Text("OOP",style: TextStyle(color: Colors.white),),
              ),
            ),
            Container(
              margin: EdgeInsets.all(20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.blue[300],
              ),
              child: Center(
                child: Text("Flutter",style: TextStyle(color: Colors.white),),
              ),
            ),
            Container(
              margin: EdgeInsets.all(20),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.blue[600],
                ),
                child: Center(
                  child: Text("Mobile", style: TextStyle(color: Colors.white)),
                ),
              )
          ],
        ),
      ),
    ),
  ));
}

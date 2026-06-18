import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
        body: Column(
          children: [
            Container(
              color: Colors.brown,
              height: 70,
              width: double.infinity,
              child: Center(
                child: Text(
                  "Welcome!!!",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.all(30),
              margin: EdgeInsets.all(30),
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Text("My Hobbies", style: TextStyle(color: Colors.white)),
            ),
            Row(
              children: [
                Container(
                  height: 250,
                  width: 700,
                  padding: EdgeInsets.all(30),
                  margin: EdgeInsets.all(30),
                  decoration: BoxDecoration(
                    color: Colors.pink,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Center(child: Text("Hello")),
                ),
                Container(
                  height: 250,
                  width: 700,
                  padding: EdgeInsets.all(30),
                  margin: EdgeInsets.all(30),
                  decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Center(child: Text("Suiiiiii")),
                ),
              ],
            ),
            Container(
              color: Colors.orangeAccent,
              height: 100,
              width: double.infinity,
              margin: EdgeInsets.only(top: 100),
              child: Row(
                children: [
                  Container(
                    width: 100,
                    height: 100,
                    margin: EdgeInsets.only(left: 40, top: 10, bottom: 10),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.white
                    ),
                  ),
                  Container(
                    width: 100,
                    height: 100,
                    margin: EdgeInsets.only(left: 570 , top: 10, bottom: 10),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.white
                    ),
                  ),
                  Container(
                    width: 100,
                    height: 100,
                    margin: EdgeInsets.only(left: 570, top: 10, bottom: 10),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    ),
  );
}

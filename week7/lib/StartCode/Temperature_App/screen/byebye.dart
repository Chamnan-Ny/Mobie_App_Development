import 'package:flutter/material.dart';

// void main(){
//   runApp(MaterialApp(
//     home: Scaffold(
//       appBar: AppBar(title: Text("Stateless Wigdet - Button",style: TextStyle(fontSize: 22),),backgroundColor: Colors.grey,),
//       body: Padding(padding: EdgeInsets.all(20),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.stretch,
//         children: [
//           SizedBox(
//             height: 100,
//             child: ElevatedButton(onPressed: onPressed,
//             style: ElevatedButton.styleFrom(backgroundColor: bg)
//             , child: Text(text,style: TextStyle(fontSize: 20,color: textColor),)),
//           )
//         ],
//       ),
//       ),
//     ),
//   ));
// }

class Buton extends StatefulWidget {
  const Buton({super.key});
  @override
  State<Buton> createState() => _ButtonChange();
}

class _ButtonChange extends State<Buton> {
  bool press = false;
  void onPressed() {
    setState(() {
      press = !press;
    });
  }

  @override
  Widget build(BuildContext context) {
    Color bg = Colors.grey;
    Color textColor = Colors.black;
    String text = "BYE";
    if (press == true) {
      bg = Colors.blue;
      textColor = Colors.white;
      text = "OK";
    }
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text(
            "Stateless Wigdet - Button",
            style: TextStyle(fontSize: 22),
          ),
          backgroundColor: Colors.grey,
        ),
        body: Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SizedBox(
                height: 100,
                child: ElevatedButton(
                  onPressed: onPressed,
                  style: ElevatedButton.styleFrom(backgroundColor: bg),
                  child: Text(
                    text,
                    style: TextStyle(fontSize: 20, color: textColor),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

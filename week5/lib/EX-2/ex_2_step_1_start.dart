import 'package:flutter/material.dart';

class Favorite extends StatefulWidget {
  const Favorite({super.key});

  @override
  State<Favorite> createState() => _FavoriteState();
}

class _FavoriteState extends State<Favorite> {
  bool isFavorite = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        border: Border(bottom: BorderSide(width: 1, color: Colors.grey)),
      ),
      padding: const EdgeInsets.fromLTRB(15, 10, 10, 10),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "title",
                  style: TextStyle(
                    color: Colors.blue,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text("description"),
              ],
            ),
          ),
          SizedBox(height: 70),
          IconButton(
            onPressed: () => {
              setState(() {
                isFavorite = !isFavorite;
              })
              },
            icon: Icon(
              isFavorite ? Icons.favorite : Icons.favorite_border,
              color: Colors.red,
            ),
          ),
        ],
      ),
    );
  }
}

void main() => runApp(
  MaterialApp(
    home: Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text("Favorite cards"),
      ),
      body: Column(
        children: [
          Favorite(),
          Favorite(),
          Favorite(),
          // Container(
          //   decoration: const BoxDecoration(
          //     border: Border(bottom: BorderSide(width: 1, color: Colors.grey)),
          //   ),
          //   padding: const EdgeInsets.fromLTRB(15, 10, 10, 10),
          //   child: Row(
          //     children: [
          //       Expanded(
          //         child: Column(
          //           crossAxisAlignment: CrossAxisAlignment.start,
          //           children: [
          //             Text(
          //               "title",
          //               style: TextStyle(
          //                 color: Colors.blue,
          //                 fontWeight: FontWeight(10),
          //               ),
          //             ),
          //             Text("description"),
          //           ],
          //         ),
          //       ),
          //       SizedBox(height: 70),
          //       IconButton(
          //         onPressed: () => {},
          //         icon: Icon(Icons.favorite, color: Colors.redAccent),
          //       ),
          //     ],
          //   ),
          // ),
        ],
      ),
    ),
  ),
);

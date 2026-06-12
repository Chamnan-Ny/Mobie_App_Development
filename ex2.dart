
import 'package:flutter/material.dart';

// class FavoriteCard extends StatelessWidget {
//   final String title;
//   final bool isFavorite;

//   const FavoriteCard({
//     super.key,
//     required this.title,
//     required this.isFavorite,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       decoration: const BoxDecoration(
//         border: Border(bottom: BorderSide(color: Colors.grey)),
//       ),////////////
//       child: Row(
//         children: [
//           Expanded(child: Text(title)),
//           Icon(
//             isFavorite ? Icons.favorite : Icons.favorite_border,
//             color: Colors.red,
//           ),
//         ],
//       ),
//     );
//   }
// }


class FavoriteCard extends StatefulWidget {
  final String title;

  const FavoriteCard({super.key, required this.title});

  @override
  State<FavoriteCard> createState() {
    return _FavoriteCardState();
  }
}

class _FavoriteCardState extends State<FavoriteCard> {
  bool isFavorite = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: const BoxDecoration(
        border: Border(bottom: BorderSide(color: Colors.grey)),
      ),
      child: Row(
        children: [
          Expanded(              
              child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [Text(widget.title), Text("description")],

            ),
          ),
          IconButton(
            onPressed: () {
              setState(() {
                isFavorite = !isFavorite;
              });
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

void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
        body: Column(
          children: [
            
            Container(
              color: Colors.amber,
              child: Text("Favorite Card"),
            ),
            FavoriteCard(title: "Flutter"),
            FavoriteCard(title: "Widgets"),
            FavoriteCard(title: "Dart"),
          ],
        ),
      ),
    ),
  );
}

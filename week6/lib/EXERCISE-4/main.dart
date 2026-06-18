

import 'package:flutter/material.dart';
import 'data/jokes.dart';

void main() => runApp(const MaterialApp(home: FavoriteJokesApp()));

class FavoriteJokesApp extends StatefulWidget {
  const FavoriteJokesApp({super.key});

  @override
  State<FavoriteJokesApp> createState() => _FavoriteJokesAppState();
}

class _FavoriteJokesAppState extends State<FavoriteJokesApp> {
  int favoriteIndex = -1;

  void toggleFavorite(int index) {
    setState(() {
      favoriteIndex = (favoriteIndex == index) ? -1 : index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Favorite Jokes")),
      body: ListView.builder(
        itemCount: jokes.length,
        itemBuilder: (context, index) {
          bool isFavorite = (favoriteIndex == index);

          return Container(
            decoration: const BoxDecoration(
              border: Border(bottom: BorderSide(width: .5, color: Colors.grey)),
            ),
            padding: const EdgeInsets.all(10),
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        jokes[index].title,
                        style: const TextStyle(
                          color: Colors.blue,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(jokes[index].description),
                    ],
                  ),
                ),
                IconButton(
                  onPressed: () => toggleFavorite(index),
                  icon: Icon(
                    Icons.favorite,
                    color: isFavorite ? Colors.red : Colors.grey,
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

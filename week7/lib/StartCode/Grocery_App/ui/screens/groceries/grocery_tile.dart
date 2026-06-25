import 'package:flutter/material.dart';
import '../../../models/grocery.dart';

class GroceryTile extends StatelessWidget {
  final GroceryItem grocery;

  const GroceryTile({super.key, required this.grocery});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Container(width: 15, height: 15, color: grocery.category.color),
      title: Text(grocery.name),
      trailing: Text(grocery.quantity.toString()),
    );
  }
}

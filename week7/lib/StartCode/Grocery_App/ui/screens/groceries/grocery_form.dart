import 'package:flutter/material.dart';
import '../../../models/grocery.dart';

class GroceryForm extends StatefulWidget {
  const GroceryForm({super.key});

  @override
  State<GroceryForm> createState() => _GroceryFormState();
}

class _GroceryFormState extends State<GroceryForm> {
  final _nameController = TextEditingController();
  final _quantityController = TextEditingController(text: '1'); // Default to 1

  @override
  void dispose() {
    _nameController.dispose();
    _quantityController.dispose();
    super.dispose();
  }

  void _submitForm() {
    final enteredName = _nameController.text;
    final enteredQuantity = int.tryParse(_quantityController.text);

    // Stop if name is empty or quantity is invalid
    if (enteredName.trim().isEmpty ||
        enteredQuantity == null ||
        enteredQuantity <= 0) {
      return;
    }

    // Create the new item
    final newItem = GroceryItem(
      id: DateTime.now().toString(),
      name: enteredName,
      quantity: enteredQuantity,
      category: GroceryCategory.vegetables,
    );

    // Close modal and return the item
    Navigator.pop(context, newItem);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TextField(
            controller: _nameController,
            decoration: const InputDecoration(labelText: 'Name'),
          ),
          const SizedBox(height: 16),
          TextField(
            controller: _quantityController,
            keyboardType: TextInputType.number,
            decoration: const InputDecoration(labelText: 'Quantity'),
          ),
          const SizedBox(height: 24),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              OutlinedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text('Cancel'),
              ),
              const SizedBox(width: 12),
              ElevatedButton(
                onPressed: _submitForm,
                child: const Text('Add Item'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

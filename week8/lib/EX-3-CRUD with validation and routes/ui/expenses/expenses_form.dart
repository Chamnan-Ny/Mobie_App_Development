import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../models/expense.dart';

class ExpenseForm extends StatefulWidget {
  const ExpenseForm({super.key});

  @override
  State<ExpenseForm> createState() => _ExpenseFormState();
}

class _ExpenseFormState extends State<ExpenseForm> {
  final _titleController = TextEditingController();
  final _amountController = TextEditingController();
  String? _quantityError;

  void onCheckQuantity() {
    double? amount = double.tryParse(_amountController.text);
    if (amount == null) {
      setState(() {
        _quantityError = "Please Enter a valid number";
      });
    } else if (amount < 0 || amount > 100) {
      setState(() {
        _quantityError = "Please enter the number between 0 - 100";
      });
    } else {
      _quantityError = null;
    }
  }

  void onCheckPressed() {
    String title = _titleController.text;
    double? amount = double.tryParse(_amountController.text);

    if (amount == null) {
      setState(() {
        _quantityError = "Please Enter a valid number";
      });
      return;
    } else if (amount < 0 || amount > 100) {
      setState(() {
        _quantityError = "Please enter the number between 0 - 100";
      });
      return;
    } else {
      _quantityError = null;
    }

    Expense newExpense = Expense(
      amount: amount,
      title: title,
      category: Category.food,
      date: DateTime.now(),
    );

    Navigator.pop<Expense>(context, newExpense);
  }

  void onCancelPressed() {
    Navigator.pop(context);
  }

  @override
  void dispose() {
    _titleController.dispose();
    _amountController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            TextField(
              controller: _titleController,
              maxLength: 50,
              decoration: const InputDecoration(label: Text('Title')),
            ),

            SizedBox(height: 20),
            TextField(
              keyboardType: TextInputType.number,
              inputFormatters: <TextInputFormatter>[
                FilteringTextInputFormatter.digitsOnly,
              ],
              controller: _amountController,
              onChanged: (value) {
                final double? amount = double.tryParse(_amountController.text);
                setState(() {
                  if (amount == null) {
                    _quantityError = "Please Enter a valid number";
                  } else if (amount < 0 || amount > 100) {
                    _quantityError = "Please enter the number between 0 - 100";
                  } else {
                    _quantityError = null;
                  }
                });
              },
              maxLength: 50,
              decoration: InputDecoration(
                prefix: Text("\$"),
                label: const Text('Amount'),
                errorText: _quantityError,
              ),
            ),

            Spacer(),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: onCancelPressed,
                  child: Text("Cancel"),
                ),
                ElevatedButton(onPressed: onCheckPressed, child: Text("Save")),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

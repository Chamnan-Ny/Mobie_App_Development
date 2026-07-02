import '../models/expense.dart';

class ExpenseRepository {
  // Expense singelExpense = Expense(amount: 45, title: "fake");

  // Future<Expense> fetchExpense() {
  //   // Simulate 5 seconds before returnning the success fetch
  //   return Future.delayed(Duration(seconds: 5), () {
  //     return singelExpense;
  //   });
  // }
  Future<List<Expense>> fetchExpense() {
    return Future.delayed(
      Duration(seconds: 5),
      () => [
        Expense(title: 'Flutter Course', amount: 19.99),
        Expense(title: 'Cinema', amount: 15.69),
        Expense(title: 'Cybersecurity', amount: 10.67),
      ],
    );
  }
}

class ExpenseException implements Exception {
  final String message;
  ExpenseException(this.message);

  @override
  String toString() => message;
}

final ExpenseRepository expenseRepository =
    ExpenseRepository(); // global access for now

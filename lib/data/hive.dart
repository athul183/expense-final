
import 'package:assessment_application_1/models/graphmodel.dart';
import 'package:hive/hive.dart';

class HiveDatabase {
  final _myBox = Hive.box("Expense_database");

  void saveData(List<ExpenseItem> allExpense) {
    List<List<dynamic>> allExpensesFormated = [];

    for (var expense in allExpense) {
      List<dynamic> expenseFomatted = [
        expense.title,
        expense.amount,
        expense.dateTime,
      ];
      allExpensesFormated.add(expenseFomatted);
    }

    _myBox.put("ALL_EXPENSES", allExpensesFormated);
  }

  List<ExpenseItem> readData() {
    List saveExpenses = _myBox.get("ALL_EXPENSES") ?? [];
    List<ExpenseItem> allExpenses = [];

    for (int i = 0; i < saveExpenses.length; i++) {
      String name = saveExpenses[i][0];
      double amount = saveExpenses[i][1];
      DateTime dateTime = saveExpenses[i][2];

      ExpenseItem expense = ExpenseItem(
        title: name,
        amount: amount,
        dateTime: dateTime,
      );

      allExpenses.add(expense);
    }

    return allExpenses;
  }
}
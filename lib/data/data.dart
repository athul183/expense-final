
// import 'package:assessment_application_1/data/hive.dart';
// import 'package:assessment_application_1/datetime/datetimehelper.dart';
// import 'package:assessment_application_1/widgets/expense_item.dart';

// import 'package:flutter/material.dart';

// class ExpenseData extends ChangeNotifier {
//   List<ExpenseItem> overallExpenseList = [];

//   List<ExpenseItem> getAllExpenseList() {
//     return overallExpenseList;
//   }

//   final db = HiveDatabase();
//   void prepareData() {
//     if (db.readData().isNotEmpty) {
//       overallExpenseList = db.readData().cast<ExpenseItem>();
//     }
//   }

//   void addNewExpense(ExpenseItem expense) {
//     overallExpenseList.add(expense);

//     notifyListeners();
//     db.saveData(overallExpenseList);
//   }

//   void deleteExpense(ExpenseItem expense) {
//     overallExpenseList.remove(expense);

//     notifyListeners();
//     db.saveData(overallExpenseList);
//   }

//   String getDayName(DateTime dateTime) {
//     switch (dateTime.weekday) {
//       case 1:
//         return 'Mon';
//       case 2:
//         return 'Tue';
//       case 3:
//         return 'Wed';
//       case 4:
//         return 'Thur';
//       case 5:
//         return 'Fri';
//       case 6:
//         return 'Sat';
//       case 7:
//         return 'Sun';
//       default:
//         return '';
//     }
//   }

//   DateTime startOfWeekDate() {
//     DateTime? startOfWeek;
//     DateTime today = DateTime.now();

//     for (int i = 0; i < 7; i++) {
//       if (getDayName(today.subtract(Duration(days: i))) == 'Sun') {
//         startOfWeek = today.subtract(Duration(days: i));
//       }
//     }

//     return startOfWeek!;
//   }

//   Map<String, double> calculateDailyExpenseSummery() {
//     Map<String, double> dailyExpenseSummery = {};

//     for (var expense in overallExpenseList) {
//       String date = convertDateTimeTOString(expense.dateTime);
//       double amount = double.parse(expense.amount);

//       if (dailyExpenseSummery.containsKey(date)) {
//         double currentAmount = dailyExpenseSummery[date]!;
//         currentAmount += amount;
//         dailyExpenseSummery[date] = currentAmount;
//       } else {
//         dailyExpenseSummery.addAll({date: amount});
//       }
//     }

//     return dailyExpenseSummery;
//   }
// }

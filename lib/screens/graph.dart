import 'package:assessment_application_1/graph/bar_graph.dart';
import 'package:assessment_application_1/screens/trans_screen.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';

class MyGraph extends StatelessWidget {
  const MyGraph({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Transaction Statistics'),),
      body: Column(
        children: [
          //Text("My Expense Graph"),
          const SizedBox(
            height: 100,
          ),
          Text(expenseLoadedItem.length.toString()),
          SizedBox(
            height: 400,
            width: double.infinity,
            child: MyBarGraph(
                maxY: 100000,
                sunAmount: getAmount(Days.sunday),
                monAmount: getAmount(Days.monday),
                tueAmount: getAmount(Days.tuesday),
                wedAmount: getAmount(Days.wednesday),
                thurAmount: getAmount(Days.thursday),
                friAmount: getAmount(Days.friday),
                satAmount: getAmount(Days.saturday)),
          ),
        ],
      ),
    );
  }
}

double getAmount(Days day) => expenseLoadedItem
    .where((obj) => obj.weekDay.toLowerCase() == day.name)
    .map((obj) => obj.amount)
    .sum;

enum Days { sunday, monday, tuesday, wednesday, thursday, friday, saturday }

import 'dart:math';

import 'package:assessment_application_1/models/expense_model.dart';
import 'package:assessment_application_1/models/income_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';

class Overview extends StatefulWidget {
  const Overview({
    super.key,
    required this.registeredExpense,
    required this.registeredIncome,
  });
  @override
  State<StatefulWidget> createState() {
    return _OverviewState();
  }

  final List<Expense> registeredExpense;
  final List<Income> registeredIncome;
}

class _OverviewState extends State<Overview> {
  double get availableMoney {
    var expense = 0.0;
    var income = 0.0;
    for (final item in widget.registeredExpense) {
      expense += item.amount;
    }
    for (final item in widget.registeredIncome) {
      income += item.amount;
    }
    return income - expense;
  }

  double get monthExpense {
    var expense = 0.0;
    for (final item in widget.registeredExpense) {
      if (DateFormat('dd/MM/y').parse(item.date.replaceAll(' ', '')).month ==
          DateTime.now().month) {
        expense += item.amount;
      }
    }
    return expense;
  }

  double get dayExpense {
    var expense = 0.0;
    for (final item in widget.registeredExpense) {
      if (DateFormat('dd/MM/y').parse(item.date.replaceAll(' ', '')).day ==
          DateTime.now().day) {
        expense += item.amount;
      }
    }
    return expense;
  }

  double get monthIncome {
    var expense = 0.0;
    for (final item in widget.registeredIncome) {
      if (DateFormat('dd/MM/y').parse(item.date.replaceAll(' ', '')).month ==
          DateTime.now().month) {
        expense += item.amount;
      }
    }
    return expense;
  }

  double get dayIncome {
    var expense = 0.0;
    for (final item in widget.registeredIncome) {
      if (DateFormat('dd/MM/y').parse(item.date.replaceAll(' ', '')).day ==
          DateTime.now().day) {
        expense += item.amount;
      }
    }
    return expense;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.width / 2,
        decoration: BoxDecoration(
            gradient: LinearGradient(colors: [
              Theme.of(context).colorScheme.primary,
              Theme.of(context).colorScheme.secondary,
              Theme.of(context).colorScheme.tertiary,
            ], transform: const GradientRotation(pi / 4)),
            borderRadius: BorderRadius.circular(25),
            boxShadow: [
              BoxShadow(
                  blurRadius: 4,
                  color: Colors.grey.shade300,
                  offset: const Offset(5, 5))
            ]),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Total Balance',
              style: TextStyle(
                  fontSize: 16,
                  color: Colors.white,
                  fontWeight: FontWeight.w600),
            ),
            const SizedBox(
              height: 12,
            ),
            Text(
              ' ₹ $availableMoney',
              style: TextStyle(
                  fontSize: 30,
                  color: Colors.white,
                  fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 12,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Container(
                        width: 25,
                        height: 25,
                        decoration: const BoxDecoration(
                            color: Colors.white30, shape: BoxShape.circle),
                        child: const Center(
                          child: Icon(
                            CupertinoIcons.arrow_down,
                            size: 12,
                            color: Colors.greenAccent,
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 8,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Income',
                            style: TextStyle(
                                fontSize: 14,
                                color: Colors.white,
                                fontWeight: FontWeight.w400),
                          ),
                          Text(
                            'Monthly ₹ $monthIncome',
                            style: TextStyle(
                                fontSize: 14,
                                color: Colors.white,
                                fontWeight: FontWeight.w600),
                          ),
                          Text(
                            'Today: ₹ $dayIncome',
                            style: TextStyle(
                                fontSize: 14,
                                color: Colors.white,
                                fontWeight: FontWeight.w600),
                          ),
                        ],
                      )
                    ],
                  ),
                  Row(
                    children: [
                      Container(
                        width: 25,
                        height: 25,
                        decoration: const BoxDecoration(
                            color: Colors.white30, shape: BoxShape.circle),
                        child: const Center(
                          child: Icon(
                            CupertinoIcons.arrow_up,
                            size: 12,
                            color: Colors.red,
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 8,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Expenses',
                            style: TextStyle(
                                fontSize: 14,
                                color: Colors.white,
                                fontWeight: FontWeight.w400),
                          ),
                          Text(
                            'Monthly ₹ $monthExpense',
                            style: TextStyle(
                                fontSize: 14,
                                color: Colors.white,
                                fontWeight: FontWeight.w600),
                          ),
                          Text(
                            'Today: ₹ $dayExpense',
                            style: TextStyle(
                                fontSize: 14,
                                color: Colors.white,
                                fontWeight: FontWeight.w600),
                          ),
                        ],
                      )
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
    // Container(
    //   height: 230,
    //   width: 380,
    //   decoration: BoxDecoration(
    //       gradient: LinearGradient(
    //         colors: [
    //           Theme.of(context).colorScheme.primary,
    //           Theme.of(context).colorScheme.secondary,
    //           Theme.of(context).colorScheme.tertiary,
    //         ],
    //         transform: GradientRotation(pi / 4),
    //       ),
    //       borderRadius: BorderRadius.circular(25),
    //       boxShadow: [
    //         BoxShadow(
    //             blurRadius: 4,
    //             color: Colors.grey.shade300,
    //             offset: const Offset(5, 5))
    //       ]),
    //   child:
    //   SizedBox(
    //     width: double.infinity,
    //     height: 230,
    //     // color: Colors.amber,
    //     child: Column(
    //       children: [
    //         const SizedBox(height: 10),
    //         const Text(
    //           'Total Balance',
    //           style: TextStyle(
    //               fontSize: 16,
    //               color: Colors.white,
    //               fontWeight: FontWeight.w600),
    //         ),
    //         Text(
    //           ' ₹ $availableMoney',
    //           style: TextStyle(
    //             color: availableMoney > 0 ? Colors.green : Colors.red,
    //             fontSize: 20,
    //             fontWeight: FontWeight.bold,
    //           ),
    //         ),
    //         //const Divider(height: 1),
    //         const SizedBox(height: 5),
    //         IntrinsicHeight(
    //           child: Row(
    //             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    //             children: [
    //               Column(
    //                 children: [
    //                   Text(
    //                     'Total Expense',
    //                     style: TextStyle(
    //                         color: Theme.of(context).colorScheme.onBackground,
    //                         fontSize: 20),
    //                   ),
    //                   const SizedBox(height: 5),
    //                   Text(
    //                     DateFormat.MMMM().format(DateTime.now()),
    //                     style: TextStyle(
    //                         color: Theme.of(context).colorScheme.onBackground,
    //                         fontSize: 20),
    //                   ),
    //                   Text(
    //                     '₹ $monthExpense',
    //                     style: const TextStyle(
    //                       color: Colors.red,
    //                       fontSize: 20,
    //                       fontWeight: FontWeight.bold,
    //                     ),
    //                   ),
    //                   const SizedBox(height: 5),
    //                   Text(
    //                     ' Today ',
    //                     style: TextStyle(
    //                         color: Theme.of(context).colorScheme.onBackground,
    //                         fontSize: 20),
    //                   ),
    //                   Text(
    //                     '₹ $dayExpense',
    //                     style: const TextStyle(
    //                       color: Colors.red,
    //                       fontSize: 20,
    //                       fontWeight: FontWeight.bold,
    //                     ),
    //                   ),
    //                 ],
    //               ),
    //               const VerticalDivider(),
    //               Column(
    //                 children: [
    //                   Text(
    //                     ' Total Income ',
    //                     style: TextStyle(
    //                       color: Theme.of(context).colorScheme.onBackground,
    //                       fontSize: 20,
    //                     ),
    //                   ),
    //                   const SizedBox(height: 5),
    //                   Text(
    //                     DateFormat.MMMM().format(DateTime.now()),
    //                     style: TextStyle(
    //                         color: Theme.of(context).colorScheme.onBackground,
    //                         fontSize: 20),
    //                   ),
    //                   Text(
    //                     '₹ $monthIncome',
    //                     style: const TextStyle(
    //                       color: Colors.green,
    //                       fontSize: 20,
    //                       fontWeight: FontWeight.bold,
    //                     ),
    //                   ),
    //                   const SizedBox(height: 5),
    //                   Text(
    //                     ' Today ',
    //                     style: TextStyle(
    //                         color: Theme.of(context).colorScheme.onBackground,
    //                         fontSize: 20),
    //                   ),
    //                   Text(
    //                     ' ₹ $dayIncome',
    //                     style: const TextStyle(
    //                       fontWeight: FontWeight.bold,
    //                       color: Colors.green,
    //                       fontSize: 20,
    //                     ),
    //                   ),
    //                 ],
    //               ),
    //             ],
    //           ),
    //         ),
    //         const SizedBox(height: 5),
    //       ],
    //     ),
    //   ),
    // );
  }
}

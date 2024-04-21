import 'package:assessment_application_1/models/expense_model.dart';
import 'package:assessment_application_1/models/income_model.dart';
import 'package:assessment_application_1/widgets/expense_item.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

// ignore: must_be_immutable
class ExpenseList extends StatelessWidget {
  ExpenseList({
    super.key,
    required this.transactions,
    required this.registeredExpense,
    required this.registeredIncome,
    required this.removeExpense,
    required this.removeIncome,
    this.isShared = false,
  });

  List<dynamic> transactions;
  List<Expense> registeredExpense;
  List<Income> registeredIncome;
  final bool isShared;
  final void Function(Expense item) removeExpense;
  final void Function(Income item) removeIncome;

  final uid = FirebaseAuth.instance.currentUser!.uid;

  @override
  Widget build(BuildContext context) {
    if (transactions.isEmpty) {
      return Center(
        child: Text(
          "No expense or income. That's wierd",
          style: Theme.of(context)
              .textTheme
              .bodyMedium!
              .copyWith(color: Theme.of(context).colorScheme.onBackground),
        ),
      );
    }
    return
        // ListView.builder(
        //   itemCount: transactions.length,
        //   itemBuilder: (context, int i) {
        //     return Padding(
        //       padding: const EdgeInsets.only(bottom: 16.0),
        //       child: Container(
        //         decoration: BoxDecoration(
        //             color: Colors.white, borderRadius: BorderRadius.circular(12)),
        //         child: Padding(
        //           padding: const EdgeInsets.all(16.0),
        //           child: Row(
        //             mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //             children: [
        //               Row(
        //                 children: [
        //                   Stack(
        //                     alignment: Alignment.center,
        //                     children: [
        //                       Container(
        //                         width: 50,
        //                         height: 50,
        //                         decoration: BoxDecoration(
        //                             color: Colors.yellow, shape: BoxShape.circle),
        //                       ),
        //                       const FaIcon(
        //                         FontAwesomeIcons.burger,
        //                         color: Colors.white,
        //                       ),
        //                     ],
        //                   ),
        //                   const SizedBox(
        //                     width: 12,
        //                   ),
        //                   Text(
        //                     'Food',
        //                     style: TextStyle(
        //                         fontSize: 14,
        //                         color: Theme.of(context).colorScheme.onBackground,
        //                         fontWeight: FontWeight.w500),
        //                   ),
        //                 ],
        //               ),
        //               Column(
        //                 children: [
        //                   Text(
        //                     '-\$45.00',
        //                     style: TextStyle(
        //                         fontSize: 14,
        //                         color: Theme.of(context).colorScheme.onBackground,
        //                         fontWeight: FontWeight.w500),
        //                   ),
        //                   Text(
        //                     'Today',
        //                     style: TextStyle(
        //                         fontSize: 14,
        //                         color: Theme.of(context).colorScheme.onBackground,
        //                         fontWeight: FontWeight.w500),
        //                   ),
        //                 ],
        //               )
        //             ],
        //           ),
        //         ),
        //       ),
        //     );
        //   },
        // );

        ListView.builder(
      itemCount: transactions.length,
      itemBuilder: (context, index) {
        return Dismissible(
          movementDuration: const Duration(milliseconds: 220),
          secondaryBackground: Container(
            color: Theme.of(context).colorScheme.error,
            child: Row(
              children: [
                const Spacer(),
                Text(
                  'Delete Item',
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        color: Theme.of(context).colorScheme.onError,
                      ),
                ),
                const SizedBox(width: 10),
                Icon(
                  Icons.delete,
                  color: Theme.of(context).colorScheme.onError,
                ),
                const SizedBox(width: 10),
              ],
            ),
          ),
          key: ValueKey(transactions[index].id),
          background: Container(
            color: Theme.of(context).colorScheme.error,
            child: Row(
              children: [
                const SizedBox(width: 10),
                Icon(
                  Icons.delete,
                  color: Theme.of(context).colorScheme.onError,
                ),
                const SizedBox(width: 10),
                Text(
                  'Delete Item',
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        color: Theme.of(context).colorScheme.onError,
                      ),
                ),
                const Spacer(),
              ],
            ),
          ),
          confirmDismiss: (DismissDirection direction) async {
            return await showDialog(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  title: Text(
                    "Confirm?",
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.onBackground,
                    ),
                  ),
                  content: Text(
                    "Are you sure you wish to delete this item?",
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.onBackground,
                    ),
                  ),
                  actions: [
                    TextButton(
                      onPressed: () {
                        HapticFeedback.lightImpact();
                        Navigator.of(context).pop(false);
                      },
                      child: const Text("CANCEL"),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        HapticFeedback.lightImpact();
                        Navigator.of(context).pop(true);
                      },
                      style: ElevatedButton.styleFrom(
                          backgroundColor:
                              Theme.of(context).colorScheme.errorContainer,
                          foregroundColor:
                              Theme.of(context).colorScheme.onErrorContainer),
                      child: const Text("DELETE"),
                    ),
                  ],
                );
              },
            );
          },
          onDismissed: (direction) {
            if (transactions[index] is Income) {
              removeIncome(transactions[index]);
            } else {
              removeExpense(transactions[index]);
            }
          },
          child: Column(
            children: [
              isShared
                  ? ExpenseItem(
                      transactions: transactions,
                      index: index,
                      isShared: true,
                    )
                  : ExpenseItem(
                      transactions: transactions,
                      index: index,
                    ),
              if (index == transactions.length - 1) const SizedBox(height: 0),
            ],
          ),
        );
      },
    );
  }
}

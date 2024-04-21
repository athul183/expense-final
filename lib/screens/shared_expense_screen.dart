import 'package:assessment_application_1/models/shared_expense_model.dart';
import 'package:assessment_application_1/screens/new_shared_expense_screen.dart';
import 'package:assessment_application_1/screens/trans_screen.dart';
import 'package:assessment_application_1/widgets/side_drawer.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'package:icons_flutter/icons_flutter.dart';

class SharedExpenseScreen extends StatefulWidget {
  const SharedExpenseScreen({super.key});
  @override
  State<StatefulWidget> createState() => _SharedExpenseScreenState();
}

class _SharedExpenseScreenState extends State<SharedExpenseScreen> {
  List<SharedExpense> sharedExpenses = [];
  final firestore = FirebaseFirestore.instance;
  final firebaseAuth = FirebaseAuth.instance;
  bool _isFetching = false;

  @override
  void initState() {
    loadSharedExpense();
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  void loadSharedExpense() async {
    final uid = firebaseAuth.currentUser!.uid;
    setState(() {
      _isFetching = true;
    });

    final userSnapshot =
        await firestore.collection('users').where('uid', isEqualTo: uid).get();

    if (userSnapshot.docs.isNotEmpty) {
      for (final item in userSnapshot.docs.asMap().entries) {
        List sharedExpenseIds = [];
        if (item.value.data().containsKey('sharedExpense')) {
          sharedExpenseIds = item.value['sharedExpense'];
        }
        if (sharedExpenseIds.isNotEmpty) {
          for (final id in sharedExpenseIds) {
            final sharedExpenseSnapshot =
                await firestore.collection('sharedExpenses').doc(id).get();

            if (sharedExpenseSnapshot.exists) {
              final sharedExpenseMap = sharedExpenseSnapshot.data()!;
              final title = sharedExpenseMap['title'];
              final emailList = sharedExpenseMap['membersEmail'];

              setState(() {
                sharedExpenses.add(SharedExpense(
                    id: id, title: title, membersEmail: emailList));
              });
            }
          }
        }
      }
    }

    setState(() {
      _isFetching = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: SideDrawer(),
      appBar: AppBar(
        title: const Text("Shared Expense"),
      ),
      body: _isFetching
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : Column(
              children: [
                InkWell(
                  onTap: () async {
                    final newExpenseDetail = await Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const NewSharedExpenseScreen(),
                      ),
                    );
                    setState(() {
                      sharedExpenses.add(newExpenseDetail);
                    });
                  },
                  child: Container(
                    padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
                    height: 70,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Icon(MaterialCommunityIcons.plus,
                            color: Theme.of(context).colorScheme.onBackground),
                        const SizedBox(width: 10),
                        Text(
                          "New Shared Expense",
                          style: Theme.of(context)
                              .textTheme
                              .titleMedium!
                              .copyWith(
                                color:
                                    Theme.of(context).colorScheme.onBackground,
                              ),
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(10, 2, 0, 2),
                  color: Theme.of(context).colorScheme.secondaryContainer,
                  alignment: Alignment.topLeft,
                  child: Text(
                    "Shared Expenses",
                    style: TextStyle(
                        color:
                            Theme.of(context).colorScheme.onSecondaryContainer),
                  ),
                ),
                Expanded(
                  child: sharedExpenses.isEmpty
                      ? Center(
                          child: Text(
                            'No Shared Expenses!',
                            style: TextStyle(
                                color:
                                    Theme.of(context).colorScheme.onBackground),
                          ),
                        )
                      : ListView.builder(
                          itemCount: sharedExpenses.length,
                          itemBuilder: (context, index) {
                            return ListTile(
                              minVerticalPadding: 25.0,
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => TransScreen(
                                      isShared: true,
                                      key: ValueKey(sharedExpenses[index].id),
                                      sharedExpense: sharedExpenses[index],
                                    ),
                                  ),
                                );
                              },
                              key: ValueKey(sharedExpenses[index].id),
                              title: Text(sharedExpenses[index].title),
                            );
                          },
                        ),
                )
              ],
            ),
    );
  }
}

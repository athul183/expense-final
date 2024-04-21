import 'package:assessment_application_1/models/expense_model.dart';
import 'package:assessment_application_1/models/shared_expense_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:uuid/uuid.dart';

class NewExpenseScreen extends StatefulWidget {
  const NewExpenseScreen({
    super.key,
    this.sharedExpense,
    this.isShared = false,
    required this.availablemoney
  });
  final bool isShared;
  final SharedExpense? sharedExpense;
  final double availablemoney;

  @override
  State<StatefulWidget> createState() => _NewExpenseScreenState();
}

class _NewExpenseScreenState extends State<NewExpenseScreen> {
  final _formKey = GlobalKey<FormState>();
  final firestore = FirebaseFirestore.instance;
  final uuid = const Uuid();
  final firebaseAuth = FirebaseAuth.instance;
  String? enteredTitle;
  double? enteredAmount;
  ExpenseCategory? enteredCategory;
  DateTime? _selectedDate = DateTime.now();
  TimeOfDay? _selectedTime = TimeOfDay.now();
  String? uid;

  String? username;

  void getUsername() async {
    uid = firebaseAuth.currentUser!.uid;
    final snapshot = await firestore.collection('users').doc(uid).get();
    username = snapshot
        .data()!
        .entries
        .firstWhere((element) => element.key == 'username')
        .value;
  }

  @override
  void initState() {
    if (widget.isShared) {
      getUsername();
    }
    super.initState();
  }

  void _showDatePicker() async {
    HapticFeedback.lightImpact();
    final now = DateTime.now();
    final firstDate = DateTime(now.year - 1, now.month, now.day);
    final pickedDate = await showDatePicker(
      context: context,
      initialDate: now,
      firstDate: firstDate,
      lastDate: now,
    );

    setState(() {
      _selectedDate = pickedDate;
    });
  }

  void _showTimePicker() async {
    HapticFeedback.lightImpact();
    final pickedTime = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );

    setState(() {
      _selectedTime = pickedTime;
    });
  }

  String get formattedDate => DateFormat.d()
      .addPattern('/')
      .add_M()
      .addPattern('/')
      .add_y()
      .format(_selectedDate!);

  String get formattedTime => _selectedTime!.format(context);

  void submit() async {
    HapticFeedback.lightImpact();
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();

      uid = FirebaseAuth.instance.currentUser!.uid;

      final id = uuid.v4();
      if (widget.isShared) {
        firestore
            .collection("sharedExpenses")
            .doc(widget.sharedExpense!.id)
            .collection("expense")
            .doc(id)
            .set({
          'id': id,
          'title': enteredTitle,
          'amount': enteredAmount,
          'category': enteredCategory!.name,
          'date': formattedDate,
          'time': formattedTime,
          'username': username,
          'isShared': true,
        });
      } else {
        firestore
            .collection("users")
            .doc(uid)
            .collection("expense")
            .doc(id)
            .set({
          'id': id,
          'title': enteredTitle,
          'amount': enteredAmount,
          'category': enteredCategory!.name,
          'date': formattedDate,
          'time': formattedTime
        });
      }

      if (!context.mounted) {
        return;
      }

      Navigator.pop(
        context,
        widget.isShared
            ? Expense(
                id: id,
                title: enteredTitle!,
                amount: enteredAmount!,
                category: enteredCategory!,
                date: formattedDate,
                weekDay: 'Monday',
                time: formattedTime,
                username: username,
                isShared: true,
              )
            : Expense(
                id: id,
                title: enteredTitle!,
                weekDay: 'Sunday',
                amount: enteredAmount!,
                category: enteredCategory!,
                date: formattedDate,
                time: formattedTime,
              ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: 'Expense Screen',
      child: Scaffold(
        appBar: AppBar(
          title: const Text('New Expense'),
        ),
        body: Form(
          key: _formKey,
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                TextFormField(
                  decoration: const InputDecoration(
                    labelText: 'Expense Title',
                  ),
                  textCapitalization: TextCapitalization.sentences,
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return 'Please enter title';
                    }
                    return null;
                  },
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.onBackground,
                  ),
                  onSaved: (newValue) {
                    enteredTitle = newValue;
                  },
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Expanded(
                      child: TextFormField(
                        decoration: const InputDecoration(
                          labelText: 'Amount',
                          prefixText: '₹ ',
                        ),
                        style: TextStyle(
                          color: Theme.of(context).colorScheme.onBackground,
                        ),
                        validator: (value) {
                          if (value == null ||
                              value.trim().isEmpty ||
                              double.tryParse(value) == null) {
                            return 'Please enter valid amount';
                          }
                          return null;
                        },
                        keyboardType: TextInputType.number,
                        onChanged: (newValue) {
                          enteredAmount = double.tryParse(newValue!);
                        },
                      ),
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    Expanded(
                      child: DropdownButtonFormField(
                        dropdownColor:
                            Theme.of(context).colorScheme.secondaryContainer,
                        onChanged: (value) {
                          enteredCategory = value;
                        },
                        onSaved: (newValue) {
                          enteredCategory = newValue;
                        },
                        value: ExpenseCategory.food,
                        items: [
                          for (final category in ExpenseCategory.values)
                            DropdownMenuItem(
                              value: category,
                              child: Row(
                                children: [
                                  Icon(
                                    expenseCategoryIcon[category.name],
                                  ),
                                  const SizedBox(width: 15),
                                  Text(
                                    category.name[0].toUpperCase() +
                                        category.name.substring(1),
                                    style: TextStyle(
                                        color: Theme.of(context)
                                            .colorScheme
                                            .onSecondaryContainer),
                                  ),
                                ],
                              ),
                            ),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    TextButton.icon(
                      onPressed: _showDatePicker,
                      label: Text(
                        _selectedDate == null
                            ? 'No date selected'
                            : formattedDate,
                      ),
                      icon: const Icon(Icons.calendar_month),
                    ),
                    TextButton.icon(
                      onPressed: _showTimePicker,
                      label: Text(
                        _selectedTime == null
                            ? 'No date selected'
                            : formattedTime,
                      ),
                      icon: const Icon(Icons.access_time),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                Row(
                  children: [
                    const Spacer(),
                    TextButton(
                      onPressed: () {
                        HapticFeedback.lightImpact();
                        Navigator.pop(context);
                      },
                      child: const Text('Cancel'),
                    ),
                    const SizedBox(width: 10),
                    ElevatedButton(
                      onPressed: () {
                        if(widget.availablemoney < enteredAmount!){
                          showDialog(
                context: context,
                        builder: (BuildContext context) {
                  return AlertDialog(
                    title: Text('Alert'),
                    content: Text('Your Budget is overflowed'),
                    actions: [
                      TextButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        child: Text('Close'),
                      ),
                    ],
                  );
                },
              );
              }
              else{
                submit();
              }
                      },
                      style: ElevatedButton.styleFrom(
                          backgroundColor:
                              Theme.of(context).colorScheme.primaryContainer,
                          foregroundColor:
                              Theme.of(context).colorScheme.onPrimaryContainer),
                      child: const Text('Submit'),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

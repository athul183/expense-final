class ExpenseItem {

  final String title;
  final double amount;
  final DateTime dateTime;

  ExpenseItem({
  
    required this.title,
    required this.amount,
    required this.dateTime,
  });

  factory ExpenseItem.fromMap(Map<String, dynamic> map) {
    return ExpenseItem(

      title: map['title'],
      amount: map['amount'],
      dateTime: DateTime.parse(map['dateTime']),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'amount': amount,
      'dateTime': dateTime.toIso8601String(),
    };
  }
}
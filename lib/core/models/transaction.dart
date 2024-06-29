class Transaction {
  final String title;
  final String amount;
  final String descitpion;
  final DateTime date;
  final bool income;

  Transaction({
    required this.title,
    required this.income,
    required this.amount,
    required this.descitpion,
    required this.date,
  });
}

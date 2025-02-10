import 'package:clone_brb_card/domain/models/transaction.dart';

class Account {
  final String id;
  final String name;
  final double balanceAmmount;
  final String betterDayToBuy;
  final String creditCardNumber;
  final List<Transaction> transactions;

  Account({
    required this.id,
    required this.name,
    required this.balanceAmmount,
    required this.betterDayToBuy,
    required this.creditCardNumber,
    required this.transactions,
  });
}

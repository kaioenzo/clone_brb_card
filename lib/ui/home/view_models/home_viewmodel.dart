import 'package:flutter/material.dart';

import '../../../data/services/api/account_service.dart';
import '../../../domain/models/account.dart';
import '../../../domain/models/transacation.dart';

class AccountViewModel with ChangeNotifier {
  AccountViewModel({
    required AccountService accountService,
  }) : _accountService = accountService;

  final AccountService _accountService;

  final List<Account> _accounts = [
    Account(
      id: '1',
      name: 'GS3 TEC',
      balanceAmmount: 7867.80,
      betterDayToBuy: '20',
      creditCardNumber: '1234 5678 9012 3456',
      transactions: [
        Transaction(
          id: '1',
          description: 'Apple',
          amount: 549.99,
          parcels: 12,
          date: DateTime.now(),
          icon: Icons.phone_iphone_outlined,
        ),
        Transaction(
          id: '2',
          description: 'Uber*Uber*Trip',
          amount: 12.96,
          parcels: 1,
          date: DateTime.now(),
          icon: Icons.taxi_alert_outlined,
        ),
        Transaction(
          id: '3',
          description: 'Carrefour - Extra',
          amount: 349.75,
          parcels: 3,
          date: DateTime.now().subtract(const Duration(days: 2)),
          icon: Icons.shopping_cart_outlined,
        ),
        Transaction(
          id: '4',
          description: 'Extra',
          amount: 349.75,
          parcels: 1,
          date: DateTime.now().subtract(const Duration(days: 2)),
          icon: Icons.shopping_cart_outlined,
        ),
        Transaction(
          id: '5',
          description: 'Fujioka',
          amount: 122.0,
          parcels: 1,
          date: DateTime.now().subtract(const Duration(days: 4)),
          icon: Icons.shopping_cart_outlined,
        ),
      ],
    ),
  ];
  int _selectedIndex = 0;

  List<Account> get accounts => _accounts;
  Account get selectedAccount => _accounts[_selectedIndex];
  int get selectedIndex => _selectedIndex;

  void addAccount(Account account) {
    _accounts.add(account);
    notifyListeners();
  }

  void addAccounts(List<Account> accounts) {
    _accounts.addAll(accounts);
    notifyListeners();
  }

  void selectAccount(int index) {
    if (_selectedIndex != index) {
      _selectedIndex = index;
      notifyListeners();
    }
  }

  Future<void> fetchAndAddAccounts() async {
    var accounts = await _accountService.fetchNewAccounts();
    addAccounts(accounts);
  }
}

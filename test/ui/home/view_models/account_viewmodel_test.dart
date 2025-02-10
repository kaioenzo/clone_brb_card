import 'package:clone_brb_card/data/services/api/account_service.dart';
import 'package:clone_brb_card/domain/models/account.dart';
import 'package:clone_brb_card/ui/home/view_models/home_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

class MockAccountService extends Fake implements AccountService {
  @override
  Future<List<Account>> fetchNewAccounts() async {
    return [
      Account(
        id: '2',
        name: 'Account 2',
        balanceAmmount: 500.0,
        betterDayToBuy: '15',
        creditCardNumber: '1111 2222 3333 4444',
        transactions: [],
      ),
      Account(
        id: '3',
        name: 'Account 3',
        balanceAmmount: 1500.0,
        betterDayToBuy: '10',
        creditCardNumber: '5555 6666 7777 8888',
        transactions: [],
      ),
    ];
  }
}

void main() {
  group('AccountViewModel', () {
    late AccountViewModel viewModel;
    late MockAccountService fakeService;
    late int notifyCount;

    setUp(() {
      fakeService = MockAccountService();
      viewModel = AccountViewModel(accountService: fakeService);
      notifyCount = 0;
      viewModel.addListener(() {
        notifyCount++;
      });
    });

    test('initial state', () {
      expect(viewModel.accounts.length, equals(1));
      expect(viewModel.selectedIndex, equals(0));
      expect(viewModel.selectedAccount.id, equals('1'));

      expect(notifyCount, equals(0));
    });

    test('addAccount adds an account and notifies listeners', () {
      final newAccount = Account(
        id: '2',
        name: 'New Account',
        balanceAmmount: 100.0,
        betterDayToBuy: '5',
        creditCardNumber: '0000 0000 0000 0000',
        transactions: [],
      );
      viewModel.addAccount(newAccount);

      expect(viewModel.accounts.length, equals(2));
      expect(viewModel.accounts.last.id, equals('2'));
      expect(notifyCount, equals(1));
    });

    test('addAccounts adds multiple accounts and notifies listeners', () {
      final accountsToAdd = [
        Account(
          id: '2',
          name: 'New Account 1',
          balanceAmmount: 200.0,
          betterDayToBuy: '7',
          creditCardNumber: '0000 0000 0000 0001',
          transactions: [],
        ),
        Account(
          id: '3',
          name: 'New Account 2',
          balanceAmmount: 300.0,
          betterDayToBuy: '8',
          creditCardNumber: '0000 0000 0000 0002',
          transactions: [],
        ),
      ];
      viewModel.addAccounts(accountsToAdd);

      expect(viewModel.accounts.length, equals(3));
      expect(viewModel.accounts[1].id, equals('2'));
      expect(viewModel.accounts[2].id, equals('3'));
      expect(notifyCount, equals(1));
    });

    test('selectAccount updates selectedIndex and notifies listeners when index changes', () {
      final newAccount = Account(
        id: '2',
        name: 'New Account',
        balanceAmmount: 100.0,
        betterDayToBuy: '5',
        creditCardNumber: '0000 0000 0000 0000',
        transactions: [],
      );
      viewModel.addAccount(newAccount);

      // reset
      notifyCount = 0;

      viewModel.selectAccount(0);
      expect(notifyCount, equals(0));

      viewModel.selectAccount(1);
      expect(viewModel.selectedIndex, equals(1));
      expect(viewModel.selectedAccount.id, equals('2'));
      expect(notifyCount, equals(1));

      viewModel.selectAccount(1);
      expect(notifyCount, equals(1));
    });

    test('fetchAndAddAccounts fetches accounts and adds them to the list', () async {
      expect(viewModel.accounts.length, equals(1));

      await viewModel.fetchAndAddAccounts();

      expect(viewModel.accounts.length, equals(3));
      expect(viewModel.accounts[1].id, equals('2'));
      expect(viewModel.accounts[2].id, equals('3'));

      expect(notifyCount, equals(1));
    });
  });
}

import 'dart:async';
import 'package:flutter/material.dart';

import '../../../domain/models/account.dart';
import '../../../domain/models/transaction.dart';

class AccountService {
  Future<List<Account>> fetchNewAccounts() async {
    await Future.delayed(const Duration(seconds: 2));

    List<Account> newAccounts = [
      Account(
        id: '2',
        name: 'GS3 TECH',
        balanceAmmount: 1234.56,
        transactions: [
          Transaction(
            id: 4,
            description: 'Compra 1',
            amount: 349.99,
            date: DateTime(2024, DateTime.may, 24),
            parcels: 3,
            icon: Icons.shopping_cart_outlined,
          ),
          Transaction(
            id: 5,
            description: 'Compra 2',
            amount: 50.00,
            date: DateTime(2024, DateTime.may, 24),
            parcels: 1,
            icon: Icons.shopping_cart_outlined,
          ),
          Transaction(
            id: 6,
            description: 'Compra 3',
            amount: 17.65,
            date: DateTime(2024, DateTime.may, 22),
            parcels: 1,
            icon: Icons.shopping_cart_outlined,
          ),
        ],
        betterDayToBuy: '22',
        creditCardNumber: '1234 5678 9012 3456',
      ),
      Account(
          id: '3',
          name: 'GS3 CORPORATIVO',
          balanceAmmount: 7890.12,
          transactions: [
            Transaction(
              id: 7,
              description: 'Compra 3',
              amount: 200.00,
              date: DateTime.now(),
              parcels: 2,
              icon: Icons.shopping_cart_outlined,
            ),
            Transaction(
              id: 8,
              description: 'Compra 4',
              amount: 150.00,
              date: DateTime(2024, DateTime.may, 22),
              parcels: 1,
              icon: Icons.shopping_cart_outlined,
            ),
            Transaction(
              id: 9,
              description: 'Compra 4',
              amount: 73.32,
              date: DateTime(2024, DateTime.may, 22),
              parcels: 1,
              icon: Icons.shopping_cart_outlined,
            ),
          ],
          betterDayToBuy: '14',
          creditCardNumber: '1234 5678 9012 3456'),
    ];

    return newAccounts;
  }
}

import 'package:flutter/material.dart';

class Transaction {
  final String id;
  final String description;
  final double amount;
  final DateTime date;
  final int parcels;
  final IconData icon;

  Transaction({
    required this.id,
    required this.description,
    required this.amount,
    required this.parcels,
    required this.date,
    required this.icon,
  });
}

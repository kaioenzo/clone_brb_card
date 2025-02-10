import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';

import '../../../domain/models/transaction.dart';
import '../../../widgets/divider.dart';
import '../view_models/home_viewmodel.dart';

class LastBuys extends StatelessWidget {
  const LastBuys({super.key});

  @override
  Widget build(BuildContext context) {
    final vm = Provider.of<AccountViewModel>(context);
    final transactionsByDate = groupBy(
      vm.selectedAccount.transactions,
      (Transaction t) => DateTime(t.date.year, t.date.month, t.date.day),
    );

    return Padding(
      padding: const EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 0.0),
      child: Column(
        children: [
          _buildHeader(),
          _buildTransactionList(transactionsByDate),
        ],
      ),
    );
  }

  Widget _buildHeader() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Text(
          'Últimos lançamentos',
          style: TextStyle(
            fontSize: 14.0,
            fontWeight: FontWeight.w700,
          ),
        ),
        Row(
          children: [
            TextButton(
              style: TextButton.styleFrom(
                padding: EdgeInsets.zero,
                alignment: Alignment.centerRight,
              ),
              onPressed: () {},
              child: const Text(
                'Ver todos',
                style: TextStyle(
                  fontSize: 10.0,
                  color: Color.fromRGBO(0, 0, 0, 0.7),
                ),
              ),
            ),
            IconButton(
              onPressed: () {},
              alignment: Alignment.centerLeft,
              icon: const Icon(
                Icons.arrow_forward_ios_rounded,
                color: Color.fromRGBO(40, 144, 207, 1),
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildTransactionList(Map<DateTime, List<Transaction>> transactionsByDate) {
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: transactionsByDate.keys.length,
      itemBuilder: (context, index) {
        final date = transactionsByDate.keys.elementAt(index);
        final transactions = transactionsByDate[date]!;
        return _buildTransactionGroup(date, transactions);
      },
    );
  }

  Widget _buildTransactionGroup(DateTime date, List<Transaction> transactions) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            _formattedDateTitle(transactions.first.date),
            style: const TextStyle(
              fontSize: 13.0,
              fontWeight: FontWeight.w700,
              color: Color.fromRGBO(40, 144, 207, 1),
            ),
          ),
          Column(
            children: transactions.map((transaction) => _buildTransactionItem(transaction)).toList(),
          ),
        ],
      ),
    );
  }

  Widget _buildTransactionItem(Transaction transaction) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(0, 10.0, 20.0, 5.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _buildTransactionDetails(transaction),
              _buildTransactionAmount(transaction),
            ],
          ),
        ),
        const DefaultDivider(),
      ],
    );
  }

  Widget _buildTransactionDetails(Transaction transaction) {
    return Row(
      children: [
        SizedBox(
          width: 52,
          height: 52,
          child: Icon(
            transaction.icon,
            size: 28,
            color: const Color.fromRGBO(60, 106, 178, 1),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                transaction.description,
                style: const TextStyle(
                  fontSize: 16.0,
                  fontWeight: FontWeight.w700,
                  color: Color.fromRGBO(33, 33, 33, 1),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 3.0),
                child: Text(
                  _formattedDate(transaction.date),
                  style: const TextStyle(
                    fontSize: 11.0,
                    fontWeight: FontWeight.w400,
                    color: Color.fromRGBO(105, 105, 107, 1),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildTransactionAmount(Transaction transaction) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Text(
          _formattedAmount(transaction.amount),
          style: const TextStyle(
            fontWeight: FontWeight.w700,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 4.0),
          child: Text(
            _formattedParcels(transaction.parcels),
            style: const TextStyle(
              fontSize: 10.0,
              fontWeight: FontWeight.w700,
              color: Color.fromRGBO(130, 130, 133, 1),
            ),
          ),
        ),
      ],
    );
  }

  String _formattedDate(DateTime date) {
    return '${date.day}/${date.month} às ${date.hour}:${date.minute}';
  }

  String _formattedAmount(double amount) {
    return 'R\$ ${amount.toStringAsFixed(2)}';
  }

  String _formattedParcels(int parcels) {
    return parcels > 1 ? 'em ${parcels}x' : '';
  }

  String _formattedDateTitle(DateTime date) {
    return date.day == DateTime.now().day
        ? 'Hoje, ${DateFormat('dd MMM', 'pt_BR').format(date)}'
        : DateFormat('dd MMM', 'pt_BR').format(date);
  }
}

import 'package:flutter/material.dart';

import '../../../domain/models/account.dart';
import '../../../theme/colors.dart';

class CardItem extends StatelessWidget {
  final Account _account;
  final int _index;
  final void Function() _toggleCardVisibility;
  final bool _showCardInfo;

  const CardItem(
      {super.key,
      required int index,
      required bool showCardInfo,
      required void Function() toggleCardVisibility,
      required Account account})
      : _showCardInfo = showCardInfo,
        _toggleCardVisibility = toggleCardVisibility,
        _index = index,
        _account = account;

  String _formatCardNumber(String cardNumber) {
    return _showCardInfo ? cardNumber : '**** **** **** ${cardNumber.substring(cardNumber.length - 4)}';
  }

  LinearGradient _getCustomGradient(int index) {
    return index % 2 == 0
        ? const LinearGradient(
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
            colors: AppColors.cardGradient1,
            stops: [0.0006, 0.9991],
          )
        : const LinearGradient(
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
            colors: AppColors.cardGradient2,
          );
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 300,
      height: 140,
      child: Container(
        margin: const EdgeInsets.only(right: 15),
        decoration: BoxDecoration(
          gradient: _getCustomGradient(_index),
          borderRadius: BorderRadius.circular(15),
        ),
        child: Card(
          color: Colors.transparent,
          elevation: 0,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                _buildCardHeader(_account),
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 12.0),
                  child: Divider(
                    color: Color.fromRGBO(54, 96, 161, 1),
                    thickness: 1.0,
                  ),
                ),
                _buildCardFooter(_account),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildCardHeader(Account account) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          width: 88,
          height: 56,
          decoration: const BoxDecoration(
            color: Colors.white,
          ),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              _formatCardNumber(account.creditCardNumber),
              style: const TextStyle(
                color: Colors.white,
              ),
            ),
            Text(
              account.name,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 14.0,
                fontWeight: FontWeight.w400,
              ),
            ),
          ],
        ),
        IconButton(
          color: const Color.fromRGBO(8, 158, 227, 1),
          onPressed: () => _toggleCardVisibility(),
          icon: Icon(_showCardInfo ? Icons.visibility_off : Icons.visibility),
        ),
      ],
    );
  }

  Widget _buildCardFooter(Account account) {
    return Expanded(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          _buildBalanceInfo(account),
          _buildBestDayToBuyInfo(account),
        ],
      ),
    );
  }

  Widget _buildBalanceInfo(Account account) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Limite disponível',
          style: TextStyle(
            color: Colors.white,
            fontSize: 10.0,
          ),
        ),
        Text(
          'R\$ ${account.balanceAmmount.toStringAsFixed(2)}',
          style: const TextStyle(
            color: Colors.white,
            fontSize: 20.0,
            fontWeight: FontWeight.w700,
          ),
        ),
      ],
    );
  }

  Widget _buildBestDayToBuyInfo(Account account) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        const Text(
          'Melhor dia de compra',
          style: TextStyle(
            color: Colors.white,
            fontSize: 10.0,
          ),
        ),
        Text(
          account.betterDayToBuy,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 20.0,
            fontWeight: FontWeight.w700,
          ),
        ),
      ],
    );
  }
}

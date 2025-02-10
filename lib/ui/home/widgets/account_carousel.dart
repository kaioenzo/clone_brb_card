import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../domain/models/account.dart';
import '../view_models/home_viewmodel.dart';

class AccountCarousel extends StatefulWidget {
  const AccountCarousel({super.key});

  @override
  State<AccountCarousel> createState() => _AccountCarouselState();
}

class _AccountCarouselState extends State<AccountCarousel> {
  late final PageController _pageController;
  bool _showCardInfo = false;

  @override
  void initState() {
    super.initState();
    final vm = context.read<AccountViewModel>();
    _pageController = PageController(
      initialPage: vm.selectedIndex,
      viewportFraction: 0.9,
    );
    vm.fetchAndAddAccounts();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void _toggleCardVisibility() {
    setState(() {
      _showCardInfo = !_showCardInfo;
    });
  }

  String _formatCardNumber(String cardNumber) {
    return _showCardInfo ? cardNumber : '**** **** **** ${cardNumber.substring(cardNumber.length - 4)}';
  }

  LinearGradient _getCustomGradient(int index) {
    return index % 2 == 0
        ? const LinearGradient(
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
            colors: [
              Color(0xFF2B66BC),
              Color(0xFF132D55),
            ],
            stops: [0.0006, 0.9991],
          )
        : const LinearGradient(
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
            colors: [
              Color.fromRGBO(0, 73, 75, 1),
              Color.fromRGBO(0, 73, 75, 1),
            ],
          );
  }

  @override
  Widget build(BuildContext context) {
    final vm = Provider.of<AccountViewModel>(context);

    return Padding(
      padding: const EdgeInsets.only(top: 16.0),
      child: SizedBox(
        height: 200,
        child: PageView.builder(
          controller: _pageController,
          onPageChanged: vm.selectAccount,
          scrollDirection: Axis.horizontal,
          itemCount: vm.accounts.length,
          itemBuilder: (ctx, index) {
            final account = vm.accounts[index];
            return GestureDetector(
              onTap: () => _animateToPage(index, vm),
              child: _buildAccountCard(account, index),
            );
          },
        ),
      ),
    );
  }

  void _animateToPage(int index, AccountViewModel vm) {
    _pageController.animateToPage(
      index,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }

  Widget _buildAccountCard(Account account, int index) {
    return SizedBox(
      width: 300,
      height: 140,
      child: Container(
        margin: const EdgeInsets.only(right: 15),
        decoration: BoxDecoration(
          gradient: _getCustomGradient(index),
          borderRadius: BorderRadius.circular(15),
        ),
        child: Card(
          color: Colors.transparent,
          elevation: 0,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                _buildCardHeader(account),
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 12.0),
                  child: Divider(
                    color: Color.fromRGBO(54, 96, 161, 1),
                    thickness: 1.0,
                  ),
                ),
                _buildCardFooter(account),
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
          onPressed: _toggleCardVisibility,
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

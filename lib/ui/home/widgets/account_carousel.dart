import 'package:clone_brb_card/ui/home/widgets/card_item.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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

  void toggleCardVisibility() {
    setState(() {
      _showCardInfo = !_showCardInfo;
      print(_showCardInfo);
    });
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
              child: CardItem(
                account: account,
                index: index,
                showCardInfo: _showCardInfo,
                toggleCardVisibility: toggleCardVisibility,
              ),
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
}

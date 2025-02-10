import 'package:clone_brb_card/ui/home/view_models/home_viewmodel.dart';
import 'package:clone_brb_card/ui/home/widgets/last_buys.dart';
import 'package:clone_brb_card/ui/home/widgets/my_favorites.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'account_carousel.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: context.read<AccountViewModel>(),
      child: const SingleChildScrollView(
        child: Column(
          children: [
            AccountCarousel(),
            MyFavorites(),
            LastBuys(),
          ],
        ),
      ),
    );
  }
}

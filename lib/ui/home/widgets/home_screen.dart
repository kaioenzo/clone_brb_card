import 'package:clone_brb_card/ui/home/view_models/home_viewmodel.dart';
import 'package:clone_brb_card/ui/home/widgets/my_favorites.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../widgets/app_bar.dart';
import 'account_carousel.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [Color(0xFF3C6AB2), Color(0xFFFFFFFF)],
          stops: [0.0, 0.4512],
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: DefaultAppBar(),
        body: ChangeNotifierProvider.value(
          value: context.read<AccountViewModel>(),
          child: const SingleChildScrollView(
            child: Column(
              children: [AccountCarousel(), MyFavorites()],
            ),
          ),
        ),
      ),
    );
  }
}

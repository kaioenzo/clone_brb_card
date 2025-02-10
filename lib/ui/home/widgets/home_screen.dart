import 'package:clone_brb_card/ui/home/widgets/home_app_bar.dart';
import 'package:flutter/material.dart';

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
      child: HomeAppBar(),
    );
  }
}

import 'package:flutter/material.dart';

import '../../../widgets/app_bar.dart';

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
        ));
  }
}

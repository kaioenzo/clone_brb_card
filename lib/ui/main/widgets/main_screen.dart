import 'package:clone_brb_card/widgets/bottom_navigation_bar.dart';
import 'package:flutter/material.dart';

import '../../../widgets/app_bar.dart';
import '../../home/widgets/home_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _currentIndex = 0;

  final List<Widget> _screens = [
    const HomeScreen(),
    const InvoiceScreen(),
    const CardScreen(),
    const ShopScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

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
        bottomNavigationBar: DefaultBottomNavigationBar(
          currentIndex: _currentIndex,
          onTap: _onItemTapped,
        ),
        body: IndexedStack(
          index: _currentIndex, // Render the selected screen
          children: _screens,
        ),
      ),
    );
  }
}

class InvoiceScreen extends StatelessWidget {
  const InvoiceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(child: Text('Tela de Fatura'));
  }
}

class CardScreen extends StatelessWidget {
  const CardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(child: Text('Tela de cartão'));
  }
}

class ShopScreen extends StatelessWidget {
  const ShopScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(child: Text('Tela de shop'));
  }
}

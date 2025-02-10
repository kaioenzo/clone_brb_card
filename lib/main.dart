import 'package:clone_brb_card/ui/home/widgets/home_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'BRB CARD',
      home: HomeScreen(),
    );
  }
}

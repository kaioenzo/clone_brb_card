import 'package:flutter/material.dart';

class DefaultBottomNavigationBar extends StatelessWidget {
  final int currentIndex;
  final Function(int) onTap;

  const DefaultBottomNavigationBar({
    super.key,
    required this.currentIndex,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 90,
      decoration: const BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Color.fromRGBO(238, 219, 219, 0),
          ),
          BoxShadow(
            color: Color.fromRGBO(124, 124, 124, 0.4),
            spreadRadius: -5.0,
            blurRadius: 20.0,
          ),
        ],
        color: Color.fromRGBO(255, 255, 255, 1),
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(40),
          topRight: Radius.circular(40),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.only(top: 12.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            _buildNavItem(
              icon: Icons.home_outlined,
              label: 'Home',
              isSelected: currentIndex == 0,
              onPressed: () => onTap(0),
            ),
            _buildNavItem(
              icon: Icons.article_outlined,
              label: 'Fatura',
              isSelected: currentIndex == 1,
              onPressed: () => onTap(1),
            ),
            _buildNavItem(
              icon: Icons.credit_card_outlined,
              label: 'Cartão',
              isSelected: currentIndex == 2,
              onPressed: () => onTap(2),
            ),
            _buildNavItem(
              icon: Icons.store_outlined,
              label: 'Shop',
              isSelected: currentIndex == 3,
              onPressed: () => onTap(3),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildNavItem({
    required IconData icon,
    required String label,
    required bool isSelected,
    required VoidCallback onPressed,
  }) {
    final color = isSelected ? const Color.fromRGBO(60, 106, 178, 1) : const Color.fromRGBO(180, 180, 184, 1);

    return TextButton(
      onPressed: onPressed,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, color: color, size: 35),
          Text(
            label,
            style: TextStyle(
              color: color,
              fontSize: 12,
              fontWeight: FontWeight.w700,
            ),
          ),
        ],
      ),
    );
  }
}

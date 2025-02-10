import 'package:flutter/material.dart';

class HomeAppBar extends StatelessWidget implements PreferredSizeWidget {
  const HomeAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: true,
      elevation: 0,
      backgroundColor: Colors.transparent,
      bottom: _buildAppBarDivider(),
      leading: _buildMenuButton(),
      title: _buildAppBarTitle(),
      actions: _buildAppBarActions(),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  PreferredSize _buildAppBarDivider() {
    return PreferredSize(
      preferredSize: const Size.fromHeight(2.0),
      child: Container(
        color: const Color.fromRGBO(229, 229, 229, 0.7),
        margin: const EdgeInsets.symmetric(horizontal: 16.0),
        height: 1.0,
      ),
    );
  }

  Widget _buildMenuButton() {
    return IconButton(
      icon: const Icon(Icons.menu),
      color: Colors.white,
      tooltip: 'Menu de navegação',
      onPressed: () {},
    );
  }

  Widget _buildAppBarTitle() {
    return RichText(
      text: const TextSpan(
        style: TextStyle(fontSize: 17.0, color: Colors.white),
        children: [
          TextSpan(text: 'Olá,'),
          TextSpan(
            text: 'Cliente',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }

  List<Widget> _buildAppBarActions() {
    return [
      _buildActionButton(
        icon: Icons.chat_bubble_outline,
        tooltip: 'Mensagens',
        onPressed: () {},
      ),
      _buildActionButton(
        icon: Icons.notifications_outlined,
        tooltip: 'Notificações',
        onPressed: () {},
      ),
    ];
  }

  Widget _buildActionButton({
    required IconData icon,
    required String tooltip,
    required VoidCallback onPressed,
  }) {
    return IconButton(
      icon: Icon(icon),
      color: Colors.white,
      tooltip: tooltip,
      onPressed: onPressed,
    );
  }
}

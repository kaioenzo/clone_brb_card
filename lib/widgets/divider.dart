import 'package:flutter/material.dart';

class DefaultDivider extends StatelessWidget {
  final double padding;
  const DefaultDivider({
    super.key,
    this.padding = 16.0,
  });

  @override
  Widget build(BuildContext context) {
    return Divider(
      color: const Color.fromARGB(255, 218, 213, 213),
      indent: padding,
      endIndent: padding,
      thickness: 1.0,
    );
  }
}

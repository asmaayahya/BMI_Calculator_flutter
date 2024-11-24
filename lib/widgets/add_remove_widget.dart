// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

// ignore: must_be_immutable
class AddRemoveWidget extends StatelessWidget {
  final IconData icon;
  final VoidCallback onPressed;

  const AddRemoveWidget({
    required this.icon,
    required this.onPressed,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      width: 40,
      decoration: BoxDecoration(
        color: Color(0xFF4C4A5F),
        shape: BoxShape.circle, // Makes the container circular
      ),
      child: IconButton(
        onPressed: onPressed,
        icon: Icon(
          icon,
          size: 30,
          color: Colors.white,
        ),
        padding: EdgeInsets.zero, // Remove the default padding
      ),
    );
  }
}

// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final double height;
  final VoidCallback  onPressed;
  const CustomButton({
    required this.onPressed,
    this.height = 50.0,
    required this.text,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: double.infinity,
      child: ElevatedButton(onPressed:onPressed, style: ElevatedButton.styleFrom(
      backgroundColor: Color(0xFFEE1455),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))
    ), child: Text(text, style: TextStyle(color: Colors.white, fontWeight: FontWeight.w800,fontSize: 20),), ),
     
    );
  }
}
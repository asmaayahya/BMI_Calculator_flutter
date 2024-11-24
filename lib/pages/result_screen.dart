// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class ResultScreen extends StatelessWidget {
  final String result; // You can pass data if needed

  const ResultScreen({required this.result, super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF201E33),
      appBar: AppBar(
        backgroundColor: Color(0xFF0B0C20),
        title: Text(
          "BMI Result",
          style: TextStyle(
            color: Colors.white,
            fontSize: 22,
            fontWeight: FontWeight.w800,
          ),
        ),
      ),
      body: Center(
        child: Text(
          "Your BMI is $result",
          style: TextStyle(
            color: Colors.white,
            fontSize: 30,
            fontWeight: FontWeight.bold,
          ),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}

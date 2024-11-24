// ignore_for_file: prefer_const_constructors

import 'dart:math';

import 'package:bmi_calc/pages/result_screen.dart';
import 'package:bmi_calc/widgets/attribute_widget.dart';
import 'package:bmi_calc/widgets/custom_button.dart';
import 'package:bmi_calc/widgets/gender_widget.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  double sliderValue = 170; // Height in cm
  int weight = 30; // Weight in kg
  String? selectedGender;

  Color _getColor(String gender) {
    return selectedGender == gender ? Color(0xFFEF1456) : Color(0xFF201E33);
  }

  void _selectGender(String gender) {
    setState(() {
      selectedGender = gender;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF0B0C20),
      appBar: AppBar(
        backgroundColor: Color(0xFF0B0C20),
        title: Text(
          "BMI Calculator",
          style: TextStyle(
            color: Colors.white,
            fontSize: 22,
            fontWeight: FontWeight.w800,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            // Gender Selection
            Expanded(
              child: Row(
                children: [
                  GenderWidget(
                    text: "Male",
                    icon: Icons.male,
                    onPressed: () => _selectGender("male"),
                    color: _getColor("male"),
                  ),
                  SizedBox(width: 10),
                  GenderWidget(
                    text: "Female",
                    icon: Icons.female,
                    onPressed: () => _selectGender("female"),
                    color: _getColor("female"),
                  ),
                ],
              ),
            ),

            // Height Slider
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  color: Color(0xFF201E33),
                  borderRadius: BorderRadius.circular(10),
                ),
                width: double.infinity,
                margin: EdgeInsets.symmetric(vertical: 10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text("Height", style: TextStyle(color: Colors.white)),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      textBaseline: TextBaseline.alphabetic,
                      children: [
                        Text(
                          sliderValue.toStringAsFixed(1),
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 30,
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                        SizedBox(width: 5),
                        Text("cm", style: TextStyle(color: Colors.white)),
                      ],
                    ),
                    Slider(
                      value: sliderValue,
                      max: 200,
                      min: 120,
                      activeColor: Color(0xFFEF1456),
                      inactiveColor: Color(0xFF4C4A5F),
                      onChanged: (value) {
                        setState(() {
                          sliderValue = value; // Update the value
                        });
                      },
                    ),
                  ],
                ),
              ),
            ),

            // Weight and Age Attributes
            Expanded(
              child: Row(
                children: [
                  AttributeWidget(
                    text1: "Age",
                    onValueChanged:(u){}
                  ),
                  SizedBox(width: 10),
                  AttributeWidget(
                    text1: "Weight",
                    initialCount: weight,
                    onValueChanged: (value) {
                      setState(() {
                        weight = value; // Update weight
                      });
                    },
                  ),
                ],
              ),
            ),

            SizedBox(height: 10),

            // Calculate Button
            CustomButton(
              text: "Calculate",
              onPressed: () {
                double heightInMeters = sliderValue / 100; // Convert cm to meters
                double bmi = weight / pow(heightInMeters, 2); // Calculate BMI
                String result = bmi.toStringAsFixed(2); // Format the result

                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ResultScreen(result: result),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

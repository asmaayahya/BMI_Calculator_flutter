// ignore: must_be_immutable

// ignore_for_file: prefer_const_constructors

import 'package:bmi_calc/widgets/add_remove_widget.dart';
import 'package:flutter/material.dart';

class AttributeWidget extends StatefulWidget {
  final String text1;
  final int initialCount;
  final ValueChanged<int> onValueChanged; // Add this callback

  const AttributeWidget({
    required this.text1,
    this.initialCount = 30,
    required this.onValueChanged, // Initialize it
    super.key,
  });

  @override
  State<AttributeWidget> createState() => _AttributeWidgetState();
}

class _AttributeWidgetState extends State<AttributeWidget> {
  late int num;
  @override
  void initState() {
    super.initState();
    num = widget.initialCount; 
  }

  void _increment() {
  setState(() {
    num++;
    widget.onValueChanged(num); // Notify parent
  });
}

void _decrement() {
  setState(() {
    if (num > 0) {
      num--;
      widget.onValueChanged(num); // Notify parent
    }
  });
}

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        decoration: BoxDecoration(
          color: Color(0xFF201E33),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              widget.text1,
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
            Text(
              "$num",
              style: TextStyle(
                  color: Colors.white, fontSize: 25, fontWeight: FontWeight.w800),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                AddRemoveWidget(
                  icon: Icons.remove,
                  onPressed: _decrement,
                ),
                SizedBox(width: 10),
                AddRemoveWidget(
                  icon: Icons.add,
                  onPressed: _increment,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
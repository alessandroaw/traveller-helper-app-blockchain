import 'package:flutter/material.dart';

class THIconLabel extends StatelessWidget {
  final String text;
  final IconData icon;

  THIconLabel({this.text, this.icon});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon),
        SizedBox(width: 10),
        Text(text),
      ],
    );
  }
}

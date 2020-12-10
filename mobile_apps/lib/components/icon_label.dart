import 'package:flutter/material.dart';

class IconLabel extends StatelessWidget {
  final String text;
  final IconData icon;

  IconLabel({this.text, this.icon});

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

import 'package:flutter/material.dart';
import 'package:traveller_helper/utilities/constraints.dart';

class THPageHeading extends StatelessWidget {
  final String text;

  THPageHeading({this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Text(
        '$text',
        style: kHeadingTextStyle,
        textAlign: TextAlign.center,
      ),
    );
  }
}

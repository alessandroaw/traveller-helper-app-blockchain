import 'package:flutter/material.dart';
import 'package:traveller_helper/components/icon_label.dart';

class SecondaryAppBar extends StatelessWidget {
  final String balance;

  SecondaryAppBar({this.balance});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          bottom: Radius.circular(30),
        ),
      ),
      leading: Container(),
      title: IconLabel(
        icon: Icons.monetization_on,
        text: '10 ETH',
      ),
      actions: <Widget>[
        FlatButton(
          color: Colors.teal.shade100,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              bottomRight: Radius.circular(30),
            ),
          ),
          // color: Colors.teal.shade100,
          child: Text('Beli'),
          onPressed: () {},
        ),
      ],
    );
  }
}
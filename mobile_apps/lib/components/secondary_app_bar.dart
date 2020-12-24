import 'package:flutter/material.dart';
import 'package:traveller_helper/components/icon_label.dart';
import 'package:traveller_helper/services/contract_manager.dart';

class SecondaryAppBar extends StatelessWidget {
  final String balance;

  SecondaryAppBar({this.balance});

  Widget getTitle(AsyncSnapshot<String> snapshot) {
    if (snapshot.hasData) {
      return IconLabel(
        icon: Icons.monetization_on,
        text: '${snapshot.data} ETH',
      );
    } else if (snapshot.hasError) {
      return IconLabel(
        icon: Icons.monetization_on,
        text: 'Error',
      );
    } else {
      return CircularProgressIndicator();
    }
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<String>(
        future: ContractManager().getBalance(),
        builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
          return AppBar(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(
                bottom: Radius.circular(30),
              ),
            ),
            leading: Container(),
            title: getTitle(snapshot),
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
        });
  }
}

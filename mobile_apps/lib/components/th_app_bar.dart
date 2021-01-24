import 'package:flutter/material.dart';
import 'package:traveller_helper/components/th_icon_label.dart';
import 'package:traveller_helper/services/contract_manager.dart';

import '../services/contract_manager.dart';
import '../utilities/constraints.dart';

class _SecondaryAppBar extends StatelessWidget {
  _SecondaryAppBar();

  Widget getTitle(AsyncSnapshot<String> snapshot) {
    if (snapshot.hasData) {
      return THIconLabel(
        icon: Icons.monetization_on,
        text: '${snapshot.data} ETH',
      );
    } else if (snapshot.hasError) {
      return THIconLabel(
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
            elevation: 0,
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

/// [GuideAppBar] is custom app bar for this guide page
class THAppBar extends PreferredSize {
  static double defaultHeight = 112;

  THAppBar({this.height = 112});

  final double height;

  @override
  Size get preferredSize => Size.fromHeight(height);

  Widget getTitle(AsyncSnapshot<String> snapshot) {
    if (snapshot.hasData) {
      return THIconLabel(
        icon: Icons.monetization_on,
        text: '${snapshot.data} ETH',
      );
    } else if (snapshot.hasError) {
      return THIconLabel(
        icon: Icons.monetization_on,
        text: 'Error',
      );
    } else {
      return CircularProgressIndicator();
    }
  }

  @override
  Widget build(BuildContext context) {
    return AppBar(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(30),
          bottomRight: Radius.circular(30),
        ),
      ),
      title: Text(
        'Traveller Helper',
        style: kAppBarTextStyle,
      ),
      centerTitle: true,
      flexibleSpace: Container(
        margin: EdgeInsets.only(top: 56),
        width: MediaQuery.of(context).size.width,
        child: _SecondaryAppBar(),
      ),
      elevation: 0,
    );
  }
}

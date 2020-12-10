import 'package:flutter/material.dart';
import 'package:traveller_helper/utilities/constraints.dart';
import 'package:traveller_helper/components/page_heading.dart';
import 'package:traveller_helper/components/secondary_app_bar.dart';
import 'package:traveller_helper/components/icon_label.dart';

class TravellerOrder extends StatefulWidget {
  @override
  _TravellerOrderState createState() => _TravellerOrderState();
}

class _TravellerOrderState extends State<TravellerOrder> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text(
          'Traveller Helper',
          style: kAppBarTextStyle,
        ),
        centerTitle: true,
      ),
      body: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            SecondaryAppBar(),
            PageHeading(text: 'Foto Anda'),
            Container(
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black, width: 0.2),
              ),
              child: Row(
                children: <Widget>[
                  Image.network(
                    'https://picsum.photos/120',
                    width: 120,
                    height: 120,
                  ),
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: <Widget>[
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Container(
                              margin: EdgeInsets.only(left: 10),
                              child: IconLabel(
                                icon: Icons.monetization_on,
                                text: '0.2 ETH',
                              ),
                            ),
                            Container(
                              child: Text('2/12/2020'),
                              margin: EdgeInsets.only(left: 10),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: <Widget>[
                            RaisedButton(
                              color: Colors.teal.shade100,
                              child: Text('Terima'),
                              onPressed: () {},
                            ),
                            SizedBox(width: 10),
                            RaisedButton(
                              color: Colors.red.shade100,
                              child: Text('Tolak'),
                              onPressed: () {},
                            ),
                            SizedBox(width: 5),
                          ],
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Traveller',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: 'Helper',
          ),
        ],
      ),
    );
  }
}

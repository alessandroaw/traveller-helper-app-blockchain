import 'package:flutter/material.dart';
import 'package:traveller_helper/utilities/constraints.dart';
import 'package:traveller_helper/components/secondary_app_bar.dart';
import 'package:traveller_helper/components/page_heading.dart';


class Traveller extends StatefulWidget {
  @override
  _TravellerState createState() => _TravellerState();
}

class _TravellerState extends State<Traveller> {
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
          children: <Widget>[
            SecondaryAppBar(balance: '10 ETH'),
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                PageHeading(text: 'Traveller Manager'),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.teal,
                    borderRadius: BorderRadius.all(Radius.circular(8)),
                  ),
                  margin: EdgeInsets.symmetric(horizontal: 20),
                  padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                  child: Column(
                    children: <Widget>[
                      TMRow(
                        icon: Icons.monetization_on,
                        text: '2 ETH',
                        buttonText: 'Deposit',
                        onPressed: () {
                          print('100');
                        },
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      TMRow(
                        icon: Icons.photo_album,
                        text: '2 Foto',
                        buttonText: 'Lihat',
                        onPressed: () {
                          Navigator.pushNamed(context, '/traveller-order');
                        },
                      )
                      // TMRow(),
                    ],
                  ),
                )
              ],
            ),
            Container(
              color: Colors.teal.shade100,
              margin: EdgeInsets.only(top: 15),
              padding: EdgeInsets.all(15),
              child: Image.network(
                'https://www.kaspersky.com/content/en-global/images/repository/isc/2020/9910/a-guide-to-qr-codes-and-how-to-scan-qr-codes-2.png',
                width: 200,
                height: 200,
              ),
            ),
            SizedBox(height: 15),
            Text('0x36b6ef957050C28E3A96Dc5D83Fc42ceb081893C'),
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

class TMRow extends StatelessWidget {
  final String text;
  final String buttonText;
  final IconData icon;
  final Function onPressed;

  TMRow({
    this.text,
    this.buttonText,
    this.icon,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Row(
          children: <Widget>[
            Icon(
              icon,
              color: Colors.white,
            ),
            SizedBox(
              width: 10,
            ),
            Text(
              '$text',
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
              ),
            ),
          ],
        ),
        RaisedButton(
          color: Colors.teal.shade100,
          child: Text('$buttonText'),
          onPressed: onPressed,
        )
      ],
    );
  }
}
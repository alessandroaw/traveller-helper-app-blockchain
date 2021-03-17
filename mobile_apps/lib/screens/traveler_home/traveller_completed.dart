import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:traveller_helper/components/components.dart';
import 'package:traveller_helper/models/user.dart';

class TravellerCompleted extends StatelessWidget {
  const TravellerCompleted({
    this.user,
  });

  final User user;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        THPageHeading(text: 'Traveller Manager'),
        TMDetails(),
        QrBanner(
          address: user.ethereumAddress,
        ),
      ],
    );
  }
}

class TMDetails extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
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
              print('TODO: deposit process');
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
          ),
        ],
      ),
    );
  }
}

class QrBanner extends StatelessWidget {
  QrBanner({this.address});

  final String address;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
            color: Colors.teal.shade100,
            borderRadius: BorderRadius.all(Radius.circular(8)),
          ),
          padding: EdgeInsets.all(15),
          child: QrImage(
            data: address,
            version: QrVersions.auto,
            size: 240,
            gapless: false,
            backgroundColor: Colors.white,
          ),
        ),
        SizedBox(height: 15),
        Text(address),
        SizedBox(height: 15),
      ],
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
        ),
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:traveller_helper/components/components.dart';

class TravellerOrder extends StatefulWidget {
  @override
  _TravellerOrderState createState() => _TravellerOrderState();
}

class _TravellerOrderState extends State<TravellerOrder> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: THAppBar(),
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              THPageHeading(text: 'Foto Anda'),
              PhotoItem(
                  photoUrl: 'https://picsum.photos/120', date: '2/12/2020'),
              PhotoItem(
                  photoUrl: 'https://picsum.photos/120', date: '2/12/2020'),
              PhotoItem(
                  photoUrl: 'https://picsum.photos/120', date: '2/12/2020'),
            ],
          ),
        ),
      ),
      bottomNavigationBar: THBottomBar(TH.traveller),
    );
  }
}

class PhotoItem extends StatelessWidget {
  final String photoUrl;
  final String date;

  PhotoItem({this.photoUrl, this.date});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black, width: 0.2),
      ),
      child: Row(
        children: <Widget>[
          Image.network(
            photoUrl,
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
                      child: THIconLabel(
                        icon: Icons.monetization_on,
                        text: '0.2 ETH',
                      ),
                    ),
                    Container(
                      child: Text(date),
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
    );
  }
}

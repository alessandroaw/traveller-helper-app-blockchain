import 'package:flutter/material.dart';
import 'package:traveller_helper/components/components.dart';

class HelperSubmitPage extends StatelessWidget {
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: THAppBar(),
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              THPageHeading(text: 'Submit'),
              Image.network(
                'https://picsum.photos/500',
                height: 250,
              ),
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Icon(Icons.monetization_on, size: 30),
                  SizedBox(width: 8),
                  Text(
                    '0.2 ETH',
                    style: TextStyle(fontSize: 24),
                  ),
                ],
              ),
              SizedBox(height: 10),
              Text('0x36b6ef957050C28E3A96Dc5D83Fc42ceb081893C'),
              SizedBox(height: 20),
              RaisedButton(
                color: Colors.teal.shade100,
                child: Text('Submit'),
                onPressed: () {
                  print('Submitting photo');
                },
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: THBottomBar(TH.helper),
    );
  }
}

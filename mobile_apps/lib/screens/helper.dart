import 'package:flutter/material.dart';
import 'package:traveller_helper/components/components.dart';
import 'package:traveller_helper/services/contract_manager.dart';
import 'package:traveller_helper/services/account_manager.dart';

enum PhotoStatus { ACCEPTED, PENDING, REJECTED }

class HelperPage extends StatefulWidget {
  @override
  _HelperPageState createState() => _HelperPageState();
}

class _HelperPageState extends State<HelperPage> {
  AccountManager am;

  void initializeAccountManager() async {
    am = AccountManager(
      contract: await ContractManager().loadContract(AccountManager.key),
      credentials: ContractManager().credentials,
    );

    am.listenEvent((listedTraveller, travellerManager) {
      print('traveller: $listedTraveller, tmAddress: $travellerManager');
    });
  }

  @override
  void initState() {
    super.initState();
    initializeAccountManager();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: THAppBar(),
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              THPageHeading(text: 'Riwayat Bantuan'),
              SizedBox(height: 10),
              HelpItem(
                date: '24/12/2020',
                photoUrl: 'https://picsum.photos/120',
                status: PhotoStatus.ACCEPTED,
              ),
              HelpItem(
                date: '24/12/2020',
                photoUrl: 'https://picsum.photos/120',
                status: PhotoStatus.PENDING,
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(
          Icons.add_a_photo,
        ),
        onPressed: () async {
          print('helper page');
          String result = await am.enlistTraveller();
          print(result);
          print('done');
        },
      ),
      bottomNavigationBar: THBottomBar(TH.helper),
    );
  }
}

class HelpItem extends StatelessWidget {
  final String photoUrl;
  final String date;
  final PhotoStatus status;

  HelpItem({this.photoUrl, this.date, this.status});

  Color getStatusColor() {
    switch (status) {
      case PhotoStatus.ACCEPTED:
        return Colors.green.shade600;
      case PhotoStatus.REJECTED:
        return Colors.red.shade600;
      default:
        return Colors.amber.shade600;
    }
  }

  String getStatusText() {
    switch (status) {
      case PhotoStatus.ACCEPTED:
        return 'Diterima';
      case PhotoStatus.REJECTED:
        return 'Ditolak';
      default:
        return 'Pending';
    }
  }

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
              crossAxisAlignment: CrossAxisAlignment.end,
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
                      margin: EdgeInsets.only(right: 8),
                    ),
                  ],
                ),
                SizedBox(height: 50),
                Padding(
                  padding: const EdgeInsets.only(right: 8),
                  child: Text(
                    getStatusText(),
                    style: TextStyle(
                      color: getStatusColor(),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

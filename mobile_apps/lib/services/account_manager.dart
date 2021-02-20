import 'dart:async';
import 'package:traveller_helper/services/contract_manager.dart';
import 'package:web3dart/web3dart.dart';
import 'package:traveller_helper/services/contract.dart';

typedef void AccountManagerCallback(
    String listedTraveller, String travellerManager);

class AccountManager extends Contract {
  static final String key = 'AccountManager';
  DeployedContract contract;
  Credentials credentials;
  ContractEvent travellerListing;

  AccountManager({this.contract, this.credentials})
      : travellerListing = contract.event('TravellerListing');

  Future<String> enlistTraveller() async {
    EthereumAddress address = await credentials.extractAddress();
    var response = send('enlistTraveller', [address]);
    return response;
  }

  Future<List<dynamic>> getTraveller() async {
    EthereumAddress address = await credentials.extractAddress();
    var response = call('getTraveller', [address]);
    return response;
  }

  StreamSubscription<FilterEvent> listenEvent(AccountManagerCallback callback) {
    return ContractManager()
        .ethClient
        .events(
          FilterOptions.events(
            contract: contract,
            event: travellerListing,
          ),
        )
        .listen((event) {
      final decoded = travellerListing.decodeResults(event.topics, event.data);
      String listedTraveller = decoded[0] as String;
      String travellerManager = decoded[1] as String;
      callback(listedTraveller, travellerManager);
    });
  }
}

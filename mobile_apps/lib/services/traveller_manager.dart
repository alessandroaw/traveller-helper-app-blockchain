import 'dart:async';
import 'package:traveller_helper/services/contract_manager.dart';
import 'package:web3dart/web3dart.dart';
import 'package:traveller_helper/services/contract.dart';

class TravellerManager extends Contract {
  static final String key = 'TravellerManager';
  DeployedContract contract;
  Credentials credentials;
  ContractEvent photoStatus;

  TravellerManager({this.contract, this.credentials})
      : photoStatus = contract.event('PhotoStatus');

  Future<String> proposePhoto() async {
    var response = submit('proposePhoto', []);
    return response;
  }
  
  Future<String> approvePhoto(int index) async {
    var response = submit('approvePhoto', [index]);
    return response;
  }

  Future<List<dynamic>> getTraveller() async {
    EthereumAddress address = await credentials.extractAddress();
    var response = query('getTraveller', [address]);
    return response;
  }

  StreamSubscription<FilterEvent> listenEvent(Function callback) {
    return ContractManager()
        .ethClient
        .events(
          FilterOptions.events(
            contract: contract,
            event: photoStatus,
          ),
        )
        .listen((event) {
          final decoded = photoStatus.decodeResults(event.topics, event.data);
          
    });
  }
}

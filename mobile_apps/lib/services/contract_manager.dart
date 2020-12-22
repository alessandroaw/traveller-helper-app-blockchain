import 'package:flutter/foundation.dart';
import 'package:http/http.dart'; //You can also import the browser version
import 'package:web3dart/web3dart.dart';

const String rpcUrl = 'http://192.168.100.31:7545'; //Replace with your API
const String privateKey = 'd1f13d3988af9968161a156bff62a62b7fc5a521b15c87078f587acae71f2967';
const String accountAddress = '0x21438F5ad494DA8d73F9383E32Bed8459C3c678e';

class ContractManager extends ChangeNotifier {
  Client httpClient;
  Web3Client ethClient;
  Credentials credentials;

  ContractManager() {
    httpClient = Client();
    ethClient = Web3Client(rpcUrl, httpClient);
    print('creating CM');
    getCredential();
  }

  void getCredential() async {
    credentials = await ethClient.credentialsFromPrivateKey(privateKey);
  }

  Future<String> getBalance() async {
    EthereumAddress address = EthereumAddress.fromHex(accountAddress);
    var amount = await ethClient.getBalance(address);
    return amount.toString();
  }
}

import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'package:web3dart/web3dart.dart';

const String rpcUrl = 'http://192.168.100.31:7545';
const String privateKey =
    'd1f13d3988af9968161a156bff62a62b7fc5a521b15c87078f587acae71f2967';
const String accountAddress = '0x21438F5ad494DA8d73F9383E32Bed8459C3c678e';

class ContractManager extends ChangeNotifier {
  static ContractManager _contractManager;
  http.Client httpClient;
  Web3Client ethClient;
  Credentials _credentials;

  factory ContractManager() {
    if (_contractManager == null) {
      _contractManager = ContractManager._internal();
    }

    return _contractManager;
  }

  ContractManager._internal() {
    httpClient = http.Client();
    ethClient = Web3Client(rpcUrl, httpClient);
    print('creating CM');
  }

  Future<Credentials> getCredentials() async {
    if (_contractManager._credentials == null) {
      await initializeCreds();
    }
    return _credentials;
  }

  Future<void> initializeCreds() async {
    _credentials = await ethClient.credentialsFromPrivateKey(privateKey);
  }

  Future<String> getBalance() async {
    EthereumAddress address = EthereumAddress.fromHex(accountAddress);
    var amount = await ethClient.getBalance(address);
    return amount.getInEther.toString();
  }

  Future<DeployedContract> loadContract(String key) async {
    String contractJson = await rootBundle.loadString('assets/$key.json');
    var decodedJson = jsonDecode(contractJson);
    String abiCode = jsonEncode(decodedJson['abi']);
    String contractAddress = decodedJson['networks']['5777']['address'];

    final contract = DeployedContract(ContractAbi.fromJson(abiCode, key),
        EthereumAddress.fromHex(contractAddress));
    print(contract);
    return contract;
  }
}

class AccountManager {
  
}

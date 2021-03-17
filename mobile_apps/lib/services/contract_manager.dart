import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/services.dart';
import 'package:web3dart/web3dart.dart';

const String rpcUrl = 'http://103.89.4.97:5543';

const List<String> privateKeys = [
  '0x38409614048bdd85269cb9f0a57c642938d3a60e30a1690161803ac397d178ca',
  '0x0a0aeff636b145c6aa2bc29cb8f6be4794fadc31d0b92b14f8bc4f25a7e42905',
  '0x91dc0b7b16d92d13587d4224ce50d944877b7475f4564edd27a19006f2013fc8',
];

class ContractManager {
  static ContractManager _contractManager;
  http.Client httpClient;
  Web3Client ethClient;
  Credentials _credentials;
  EthereumAddress _address;

  // ===============================
  // Singleton Constructor Setup
  // ===============================
  factory ContractManager() {
    if (_contractManager == null) {
      _contractManager = ContractManager._internal();
    }

    return _contractManager;
  }

  ContractManager._internal() {
    httpClient = http.Client();
    ethClient = Web3Client(rpcUrl, httpClient);
  }

  Credentials get credentials => _credentials;
  String get address => _address.toString();

  Future<void> initializeCreds() async {
    try {
      _credentials = await ethClient.credentialsFromPrivateKey(privateKeys[2]);
      _address = await _credentials.extractAddress();
    } catch (e) {
      print('error initializing creds: $e');
    }
  }

  // ===============================
  // methods
  Future<String> getBalance() async {
    try {
      var amount = await ethClient.getBalance(_address);
      return amount.getInEther.toString();
    } catch (e) {
      print(e);
      return "error";
    }
  }

  Future<DeployedContract> loadContract(String key) async {
    String contractJson =
        await rootBundle.loadString('assets/contracts/$key.json');
    var decodedJson = jsonDecode(contractJson);
    String abiCode = jsonEncode(decodedJson['abi']);
    String contractAddress = decodedJson['networks']['58343']['address'];

    final contract = DeployedContract(ContractAbi.fromJson(abiCode, key),
        EthereumAddress.fromHex(contractAddress));
    return contract;
  }
}

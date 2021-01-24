import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/services.dart';
import 'package:web3dart/web3dart.dart';

const String rpcUrl = 'http://blockchain.luqmanr.xyz:5543';
const String privateKey =
    '0x58dbb0fa1259a63cbf2cb9f9008c31ad34af5b222c85218fa966b8fd19f1909e';

class ContractManager {
  static ContractManager _contractManager;
  http.Client httpClient;
  Web3Client ethClient;
  Credentials _credentials;
  EthereumAddress _address;

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

  Credentials get credentials => _credentials;

  Future<void> initializeCreds() async {
    try {
      _credentials = await ethClient.credentialsFromPrivateKey(privateKey);
      _address = await _credentials.extractAddress();
    } catch (e) {
      print('error initializing creds: $e');
    }
  }

  Future<String> getBalance() async {
    try {
      var amount = await ethClient.getBalance(_address);
      return amount.getInEther.toString();
    } catch (e) {
      print(e);
    }
  }

  Future<DeployedContract> loadContract(String key) async {
    String contractJson = await rootBundle.loadString('assets/$key.json');
    var decodedJson = jsonDecode(contractJson);
    String abiCode = jsonEncode(decodedJson['abi']);
    String contractAddress =
        decodedJson['networks']['1610976939525']['address'];

    final contract = DeployedContract(ContractAbi.fromJson(abiCode, key),
        EthereumAddress.fromHex(contractAddress));
    print(contract);
    return contract;
  }
}

void main() async {
  final cm = ContractManager();
  await cm.initializeCreds();

  try {
    print(await cm.getBalance());
  } catch (e) {
    print(e);
  }

  print('finished');
}

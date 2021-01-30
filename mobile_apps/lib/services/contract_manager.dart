import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/services.dart';
import 'package:web3dart/web3dart.dart';

const String rpcUrl = 'http://blockchain.luqmanr.xyz:5543';

const List<String> privateKeys = [
  '0x9957f6bb1ae38177118281b6a053bdfdc1c70d20afd885b33562033e1680cadb',
  '0xef1976233a73a54d6eda3cae1acbc230c6e6bc893f74094cf307898535cc4620',
  '0x29527fb66c772ec327d47e3265570a51b3ce1b78e677d7490fc42faf73036dc4',
  '0xdbc22ce41a0dfd99c109fc39a8bb4995ad048d8e776f6e5917f529e1ebf200ec',
  '0x2dcab119e7457659a05144f386b225dfea5e02902016999fad3e82966c1e6055',
  '0x097598316e4be8c379b124c91a3d723033b2fd2a1dcd932a3830ff1301245dc0',
  '0xed9b4d46df874974114263f63479b5b25890a0ce360b33e14107619357a61790',
  '0x2b20f77f54a66e710df0084356fc2bc447f15183464c9c2ec3cab1da949cc99f',
  '0x6a6e90007904687ae6c5f1c5eab2dce29c09dcb6b364c8ae8a8f1ab83fc5b3bf',
  '0x58da4a5d805d43002fd4588385e744026c6f7e5420f36165b13c74ea4d41880a',
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
    print('creating CM');
  }

  Credentials get credentials => _credentials;

  Future<void> initializeCreds() async {
    try {
      _credentials = await ethClient.credentialsFromPrivateKey(privateKeys[0]);
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
    }
  }

  Future<DeployedContract> loadContract(String key) async {
    String contractJson =
        await rootBundle.loadString('assets/contracts/$key.json');
    var decodedJson = jsonDecode(contractJson);
    String abiCode = jsonEncode(decodedJson['abi']);
    String contractAddress =
        decodedJson['networks']['1611544243384']['address'];

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

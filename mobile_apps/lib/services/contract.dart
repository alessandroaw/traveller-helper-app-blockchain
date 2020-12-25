import 'package:web3dart/web3dart.dart';
import 'package:traveller_helper/services/contract_manager.dart';

abstract class Contract {
  DeployedContract contract;
  Credentials credentials;

  Future<String> submit(String functionName, List<dynamic> args) async {
    final ethFunction = contract.function(functionName);

    var result = await ContractManager().ethClient.sendTransaction(
          credentials,
          Transaction.callContract(
            contract: contract,
            function: ethFunction,
            parameters: args,
          ),
        );
    return result;
  }

  Future<List<dynamic>> query(String functionName, List<dynamic> args) async {
    final ethFunction = contract.function(functionName);
    final data = await ContractManager()
        .ethClient
        .call(contract: contract, function: ethFunction, params: args);
    return data;
  }
}
import 'package:web3dart/web3dart.dart';
import 'package:traveller_helper/services/contract_manager.dart';

abstract class Contract {
  DeployedContract contract;
  Credentials credentials;

  Future<String> send(String functionName, List<dynamic> args) async {
    final ethFunction = contract.function(functionName);

    try {
      final result = await ContractManager().ethClient.sendTransaction(
            credentials,
            Transaction.callContract(
              contract: contract,
              function: ethFunction,
              parameters: args,
            ),
          );
      return result;
    } catch (e) {
      rethrow;
    }
  }

  Future<List<dynamic>> call(String functionName, List<dynamic> args) async {
    final ethFunction = contract.function(functionName);

    try {
      final data = await ContractManager()
          .ethClient
          .call(contract: contract, function: ethFunction, params: args);
      return data;
    } catch (e) {
      rethrow;
    }
  }
}

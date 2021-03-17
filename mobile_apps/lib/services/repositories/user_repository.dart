import 'dart:convert';

import 'package:traveller_helper/models/user.dart';
import 'package:traveller_helper/services/account_manager.dart';
import 'package:traveller_helper/services/contract_manager.dart';
import 'package:traveller_helper/utilities/api_base_helper.dart';
import 'package:traveller_helper/utilities/generics/http_exceptions.dart';

class UserRepository {
  ApiBaseHelper _api = ApiBaseHelper();
  String address = ContractManager().address;
  final AccountManager accountManager;

  UserRepository(this.accountManager);

  Future<String> enlistTraveller() async {
    try {
      String result = await accountManager.enlistTraveller();
      return result;
    } on Exception {
      rethrow;
    }
  }

  Future<User> fetchUser() async {
    print(address);
    try {
      final json = await _api.get('user/$address');

      return User.fromJson(json);
    } on EmptyResponseException {
      return User.empty();
    } on Exception {
      rethrow;
    }
  }

  Future<User> userToTraveller(String tmAddress) async {
    try {
      final json = await _api.post('user/beTraveller/$address',
          body: jsonEncode({"travellerManagerAddress": tmAddress}));

      return User.fromJson(json);
    } on Exception {
      rethrow;
    }
  }
}

// // Testing Purpose
// void main(List<String> args) async {
//   UserRepository _userRepository = UserRepository();
//   try {
//     final user = await _userRepository.fetchUser();
//     print(user.toJson());
//   } catch (e) {
//     print('error occured: $e');
//   }
// }

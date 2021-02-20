import 'dart:convert';

import 'package:traveller_helper/models/user.dart';
import 'package:traveller_helper/services/account_manager.dart';
import 'package:traveller_helper/services/contract_manager.dart';
import 'package:traveller_helper/utilities/api_base_helper.dart';
import 'package:traveller_helper/utilities/generics/http_exceptions.dart';

class UserRepository {
  ApiBaseHelper _api = ApiBaseHelper();
  String address = ContractManager().address;

  Future<User> fetchUser() async {
    try {
      print('called');
      final json = await _api.get('user/$address');

      return User.fromJson(json);
    } on EmptyResponseException {
      return User.empty();
    } on Exception {
      rethrow;
    }
  }

  Future<void> registerTraveller(String tmAddress) async {
    try {
      final json = await _api.post('user/beTraveller/$address',
          body: jsonEncode({"travellerManagerAddress": tmAddress}));
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

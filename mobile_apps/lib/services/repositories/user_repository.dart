import 'package:traveller_helper/models/user.dart';
import 'package:traveller_helper/utilities/api_base_helper.dart';

class UserRepository {
  ApiBaseHelper _api = ApiBaseHelper();

  Future<User> fetchUser() async {
    try {
      final json =
          await _api.get('user/0x21438f5ad494da8d73f9383e32bed8459c3c678e');
      return User.fromJson(json);
    } on Exception {
      rethrow;
    }
  }
}

// Testing Purpose
void main(List<String> args) async {
  UserRepository _userRepository = UserRepository();
  try {
    final user = await _userRepository.fetchUser();
    print(user.toJson());
  } catch (e) {
    print('error occured: $e');
  }
}

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:traveller_helper/models/response.dart';
import 'package:traveller_helper/models/user.dart';
import 'package:traveller_helper/services/repositories/user_repository.dart';
import 'traveller_state.dart';

export 'traveller_state.dart';

class TravellerCubit extends Cubit<Response<User>> {
  TravellerCubit({
    @required UserRepository userRepository,
  })  : assert(userRepository != null),
        _userRepository = userRepository,
        super(Response.initial());

  final UserRepository _userRepository;

  Future<void> fetchUser() async {
    print('fetch user called');
    emit(Response.loading('Fetching user'));
    try {
      final user = await _userRepository.fetchUser();
      emit(Response.completed(user));
    } catch (e) {
      emit(Response.error(e));
    }
  }
}

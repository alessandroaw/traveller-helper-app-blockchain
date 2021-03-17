import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:traveller_helper/models/response.dart';
import 'package:traveller_helper/models/user.dart';
import 'package:traveller_helper/services/account_manager.dart';
import 'package:traveller_helper/services/repositories/user_repository.dart';
import 'traveller_state.dart';

export 'traveller_state.dart';

class TravellerCubit extends Cubit<Response<User>> {
  TravellerCubit({
    @required UserRepository userRepository,
    @required AccountManager accountManager,
  })  : assert(userRepository != null),
        assert(accountManager != null),
        _userRepository = userRepository,
        _accountManager = accountManager,
        super(Response.initial()) {
    String previous = "";
    _accountManager.listenEvent((listedTraveller, travellerManager) {
      String current = travellerManager;

      if (previous != current) {
        print('previous $previous current $current');
        userToTraveller(travellerManager);
      }

      previous = current;
    });
  }

  UserRepository _userRepository;
  AccountManager _accountManager;

  Future<void> enlistTraveller() async {
    emit(Response.loading('Enlisting User'));
    try {
      await _userRepository.enlistTraveller();
    } catch (e) {
      emit(Response.error(e.toString()));
    }
  }

  Future<void> userToTraveller(String tmAddress) async {
    emit(Response.loading('Updating database'));
    try {
      final user = await _userRepository.userToTraveller(tmAddress);
      emit(Response.completed(user));
    } catch (e) {
      emit(Response.error(e.toString()));
    }
  }

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

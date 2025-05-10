import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

import '../../../core/database/app_database.dart';
import '../data/model/user.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitial());

  Future<void> submitUser(String firstName, String lastName) async {
    try {
      emit(AuthLoading());

      //The duration is there just to elongate the loading time
      await Future.delayed(Duration(seconds: 3));
      final user = await AppDatabase().insertUser(UserModel(
        firstName: firstName,
        lastName: lastName,
        createdAt: DateTime.now().millisecondsSinceEpoch,
      ));
      emit(AuthSuccess(userModel: user));
    } catch (e) {
      emit(AuthError());
    }
  }
}

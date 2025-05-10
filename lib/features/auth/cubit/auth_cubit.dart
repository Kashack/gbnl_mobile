import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/database/database_helper.dart';
import '../../../core/di/injection.dart';
import '../data/model/user.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitial());

  Future<void> submitUser(String firstName, String lastName) async {
    try {
      emit(AuthLoading());

      //The duration is there just to elongate the loading time
      await Future.delayed(Duration(seconds: 3));
      final user = await getIt<DatabaseHelper>().insertUser(UserModel(
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

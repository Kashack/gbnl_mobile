import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

import '../../../core/database/app_database.dart';
import '../data/model/user.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitial());

  Future<void> submitUser(String firstName, String lastName) async {
    try{
      emit(AuthLoading());
      Future.delayed(Duration(seconds: 5));
     final user = await AppDatabase()
          .insertUser(UserModel(firstName: firstName, lastName: lastName));
      emit(AuthSuccess(userModel: user));
    }catch (e){
      emit(AuthError());
    }
  }
}

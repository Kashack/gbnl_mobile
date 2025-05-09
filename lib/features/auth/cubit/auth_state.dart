part of 'auth_cubit.dart';

@immutable
sealed class AuthState {
  final UserModel? userModel;

  const AuthState({this.userModel});
}

final class AuthInitial extends AuthState {}

class AuthLoading extends AuthState {}

class AuthSuccess extends AuthState {
  final UserModel userModel;

  AuthSuccess({required this.userModel}) : super(userModel: userModel);
}

class AuthError extends AuthState {}
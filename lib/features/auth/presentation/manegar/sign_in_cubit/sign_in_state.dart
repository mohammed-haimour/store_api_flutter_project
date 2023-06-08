part of 'sign_in_cubit.dart';

@immutable
abstract class SignInState {}

class SignInInitial extends SignInState {}

class SignInSuccess extends SignInState {
  final String successMsg;

  SignInSuccess(this.successMsg);
}

class SignInLoading extends SignInState {}

class SignInError extends SignInState {
  // this state for errs
  final String err;

  SignInError(this.err);
}

class SignInFailure extends SignInState {
  // if user Login Fail !
  final String failMsg;

  SignInFailure(this.failMsg);
}

part of 'sign_up_cubit.dart';

@immutable
abstract class SignUpState {}

class SignUpInitial extends SignUpState {}

class SignUpSuccess extends SignUpState {
  final String successMsg;

  SignUpSuccess(this.successMsg);
}

class SignUpLoading extends SignUpState {}

class SignUpError extends SignUpState {
  // this state for errs
  final String err;

  SignUpError(this.err);
}

class SignUpFailure extends SignUpState {
  // if user Login Fail !
  final String failMsg;

  SignUpFailure(this.failMsg);
}

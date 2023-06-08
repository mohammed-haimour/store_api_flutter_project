import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store_app/features/auth/data/repos/sign_up_repo_impl.dart';

part 'sign_up_state.dart';

class SignUpCubit extends Cubit<SignUpState> {
  SignUpCubit(this.signUpRepoImpl) : super(SignUpInitial());

  final SignUpRepoImpl signUpRepoImpl;

  Future<void> userSignUp(
      {required String email,
      required String password,
      required String name,
      required String phone}) async {
    emit(SignUpLoading());

    var result = await signUpRepoImpl.userSignUp(
        email: email, password: password, name: name, phone: phone);

    result.fold((err) {
      emit(SignUpFailure(err.msg));
    }, (login) {
      if (login.signUpStatus == true) {
        emit(SignUpSuccess(login.msg));
      } else {
        emit(SignUpError(login.msg));
      }
    });
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:store_app/features/auth/data/repos/sign_in_repo_impl.dart';

part 'sign_in_state.dart';

class SignInCubit extends Cubit<SignInState> {
  SignInCubit(this.loginRepoImpl) : super(SignInInitial());

  final SignInRepoImpl loginRepoImpl;

  Future<void> userLogin(
      {required String email, required String password}) async {
    emit(SignInLoading());

    var result =
        await loginRepoImpl.userSignIn(email: email, password: password);

    result.fold((err) {
      emit(SignInFailure(err.msg));
    }, (login) {
      if (login.loginStatus == true) {
        emit(SignInSuccess(login.msg!));
      } else {
        emit(SignInError(login.msg!));
      }
    });
  }
}

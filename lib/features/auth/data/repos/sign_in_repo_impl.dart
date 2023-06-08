import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import 'package:store_app/core/errors/failure.dart';
import 'package:store_app/features/auth/data/data_source/sign_in_remote_data_source.dart';
import 'package:store_app/features/auth/domain/entities/login_entity.dart';
import 'package:store_app/features/auth/domain/repos/sign_in_repo.dart';

class SignInRepoImpl extends SignInRepo {
  final SignInRemoteDataSource loginRemoteDataSource;

  SignInRepoImpl({required this.loginRemoteDataSource});

  @override
  Future<Either<Failure, SignInEntity>> userSignIn(
      {required String email, required String password}) async {
    SignInEntity signIn;

    try {
      signIn = await loginRemoteDataSource.userSignIn(
          email: email, password: password);
      return right(signIn);
    } catch (e) {
      if (e is DioError) {
        return left(ServerFailure.fromDioError(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }
}

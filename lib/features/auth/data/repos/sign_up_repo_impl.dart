import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:store_app/core/errors/failure.dart';
import 'package:store_app/features/auth/data/data_source/sign_up_remote_dara_srource.dart';
import 'package:store_app/features/auth/domain/entities/sign_up_entity.dart';
import 'package:store_app/features/auth/domain/repos/sign_up_repo.dart';

class SignUpRepoImpl extends SingUpRepo {
  final SignUpRemoteDataSource signUpRemoteDataSource;

  SignUpRepoImpl({required this.signUpRemoteDataSource});

  @override
  Future<Either<Failure, SingUpEntity>> userSignUp(
      {required String email,
      required String password,
      required String name,
      required String phone}) async {
    SingUpEntity signUp;

    try {
      signUp = await signUpRemoteDataSource.userSignUp(
          email: email, password: password, name: name, phone: phone);
      return right(signUp);
    } catch (e) {
      if (e is DioError) {
        return left(ServerFailure.fromDioError(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }
}

import 'package:dartz/dartz.dart';
import 'package:store_app/core/errors/failure.dart';
import 'package:store_app/features/auth/domain/entities/login_entity.dart';

abstract class SignInRepo {
  Future<Either<Failure, SignInEntity>> userSignIn(
      {required String email, required String password});
}

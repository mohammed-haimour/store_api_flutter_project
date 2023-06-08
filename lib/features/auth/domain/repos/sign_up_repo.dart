import 'package:dartz/dartz.dart';
import 'package:store_app/core/errors/failure.dart';
import 'package:store_app/features/auth/domain/entities/sign_up_entity.dart';

abstract class SingUpRepo {
  Future<Either<Failure, SingUpEntity>> userSignUp(
      {required String email,
      required String password,
      required String name,
      required String phone});
}

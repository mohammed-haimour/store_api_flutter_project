import 'package:dartz/dartz.dart';
import 'package:store_app/core/errors/failure.dart';
import 'package:store_app/features/home/domain/entitis/home_entity.dart';

abstract class HomeRepo {
  Future<Either<Failure, List<HomeEntity>>> getProducts();
}

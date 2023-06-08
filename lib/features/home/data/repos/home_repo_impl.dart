import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:store_app/core/errors/failure.dart';
import 'package:store_app/features/home/data/data_source/home_local_data_source.dart';
import 'package:store_app/features/home/data/data_source/home_remote_data_source.dart';
import 'package:store_app/features/home/domain/entitis/home_entity.dart';
import 'package:store_app/features/home/domain/repos/home_repo.dart';

class HomeRepoImpl extends HomeRepo {
  final HomeRemoteDataSource homeRemoteDataSource;
  final HomeLocalDataSource homeLocalDataSource;

  HomeRepoImpl(
      {required this.homeRemoteDataSource, required this.homeLocalDataSource});
  @override
  Future<Either<Failure, List<HomeEntity>>> getProducts() async {
    List<HomeEntity> products;
    try{
      products = homeLocalDataSource.getProducts();
      if(products.isNotEmpty){
        return right(products);
      }
      products = await homeRemoteDataSource.getProducts();
        return right(products);
    }catch (e) {
      if (e is DioError) {
        return left(ServerFailure.fromDioError(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }
}

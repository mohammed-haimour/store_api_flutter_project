import 'package:hive_flutter/hive_flutter.dart';
import 'package:store_app/core/constants/hive_boxes.dart';
import 'package:store_app/core/utils/functions/hive_local_database/save_products.dart';
import 'package:store_app/core/utils/services/api_services.dart';
import 'package:store_app/features/auth/domain/entities/login_entity.dart';
import 'package:store_app/features/home/domain/entitis/home_entity.dart';
import 'package:store_app/features/home/domain/model/home_model.dart';

abstract class HomeRemoteDataSource {
  Future<List<HomeEntity>> getProducts();
}

class HomeRemoteDataSourceImpl extends HomeRemoteDataSource {
  final ApiServices apiServices;

  HomeRemoteDataSourceImpl(this.apiServices);

  @override
  Future<List<HomeEntity>> getProducts() async {
    var data = await apiServices.getData(endPoint: "home", querey: {
      "Authorization": (Hive.box<SignInEntity>(singingBox).values.length == 1)
          ? Hive.box<SignInEntity>(singingBox).values.first.token
          : null
    });

    List<HomeEntity> products = getProductsList(data);

    saveProducts(products);

    return products;
  }

  List<HomeEntity> getProductsList(Map<String, dynamic> data) {
    List<HomeEntity> products = [];
    for (var productMap in data["data"]["products"]) {
      products.add(HomeModel.fromJson(productMap));
    }
    return products;
  }
}

import 'package:hive_flutter/hive_flutter.dart';
import 'package:store_app/core/constants/hive_boxes.dart';
import 'package:store_app/features/home/domain/entitis/home_entity.dart';

abstract class HomeLocalDataSource {
  List<HomeEntity> getProducts();
}

class HomeLocalDataSourceImpl extends HomeLocalDataSource {
  @override
  List<HomeEntity> getProducts() {
    var products = Hive.box<HomeEntity>(homeBox).values.toList();
    return products;
  }
}

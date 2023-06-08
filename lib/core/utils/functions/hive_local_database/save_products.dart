import 'package:hive_flutter/hive_flutter.dart';
import 'package:store_app/core/constants/hive_boxes.dart';
import 'package:store_app/features/home/domain/entitis/home_entity.dart';

void saveProducts(List<HomeEntity> products) async {
  var box = Hive.box<HomeEntity>(homeBox);
  await box.clear();
  box.addAll(products);
}

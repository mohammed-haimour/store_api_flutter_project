import 'package:hive_flutter/adapters.dart';
part 'home_entity.g.dart';

@HiveType(typeId: 1)
class HomeEntity {
  @HiveField(0)
  final String title;
  @HiveField(1)
  final String imageUrl;
  @HiveField(2)
  final String productPrice;

  HomeEntity(
      {required this.title,
      required this.imageUrl,
      required this.productPrice});
}

import 'package:store_app/features/home/domain/entitis/home_entity.dart';

class HomeModel extends HomeEntity {
  num? id;
  num? price;
  num? oldPrice;
  num? discount;
  String? image;
  String? name;
  String? description;
  List<dynamic>? images;
  bool? inFavorites;
  bool? inCart;

  HomeModel({
    this.id,
    this.price,
    this.oldPrice,
    this.discount,
    this.image,
    this.name,
    this.description,
    this.images,
    this.inFavorites,
    this.inCart,
  }) : super(
            title: name.toString(),
            imageUrl: image.toString(),
            productPrice: price.toString());

  factory HomeModel.fromJson(Map<String, dynamic> json) => HomeModel(
        id: json['id'] as num?,
        price: json['price'] as num?,
        oldPrice: json['old_price'] as num?,
        discount: json['discount'] as num?,
        image: json['image'] as String?,
        name: json['name'] as String?,
        description: json['description'] as String?,
        images: json['images'] as List<dynamic>?,
        inFavorites: json['in_favorites'] as bool?,
        inCart: json['in_cart'] as bool?,
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'price': price,
        'old_price': oldPrice,
        'discount': discount,
        'image': image,
        'name': name,
        'description': description,
        'images': images,
        'in_favorites': inFavorites,
        'in_cart': inCart,
      };
}

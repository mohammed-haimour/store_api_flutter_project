import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:store_app/core/constants/custom_colors.dart';
import 'package:store_app/core/constants/styles.dart';
import 'package:store_app/core/utils/functions/screen_info.dart';
import 'package:store_app/features/home/domain/entitis/home_entity.dart';

class ProductsListViewItem extends StatelessWidget {
  const ProductsListViewItem({super.key, required this.product});
  final HomeEntity product;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: getheight(context) * 0.1,
      decoration: BoxDecoration(
          color: customDarkBlack, borderRadius: BorderRadius.circular(15)),
      child: Row(
        children: [
          SizedBox(
            width: getWidth(context) * 0.3,
            child: SizedBox(
              height: getheight(context) * 0.1,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: CachedNetworkImage(
                  imageUrl: product.imageUrl,
                  errorWidget: (context, url, error) {
                    return const Center(
                        child: Icon(
                      Icons.error,
                      color: customRed,
                    ));
                  },
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          Expanded(
            flex: 4,
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 20.0, vertical: 5),
              child: Column(
                children: [
                  Text(
                    product.title,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                  ),
                  const Divider(),
                  Text(
                    "\$${product.productPrice}",
                    style: Styles.textStyle16.copyWith(
                        fontWeight: FontWeight.bold, color: customGreen),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

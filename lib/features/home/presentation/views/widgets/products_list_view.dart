import 'package:flutter/widgets.dart';
import 'package:store_app/features/home/domain/entitis/home_entity.dart';
import 'package:store_app/features/home/presentation/views/widgets/products_list_view_item.dart';

class ProductsListView extends StatelessWidget {
  const ProductsListView({super.key, required this.proudcts});
  final List<HomeEntity> proudcts;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: proudcts.length,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.all(10.0),
          child: ProductsListViewItem(
            product: proudcts[index],
          ),
        );
      },
    );
  }
}

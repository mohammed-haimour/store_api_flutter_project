import 'package:flutter/widgets.dart';
import 'package:store_app/features/home/domain/entitis/home_entity.dart';
import 'package:store_app/features/home/presentation/views/widgets/products_list_view.dart';

class HomeViewBlocConsumerContent extends StatelessWidget {
  const HomeViewBlocConsumerContent({super.key, required this.proudcts});
  final List<HomeEntity> proudcts;
  @override
  Widget build(BuildContext context) {
    return ProductsListView(proudcts:proudcts,);
  }
}

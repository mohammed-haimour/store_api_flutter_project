import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store_app/core/utils/services/api_services.dart';
import 'package:store_app/core/utils/widgets/custom_btn.dart';
import 'package:store_app/features/home/data/data_source/home_local_data_source.dart';
import 'package:store_app/features/home/data/data_source/home_remote_data_source.dart';
import 'package:store_app/features/home/data/repos/home_repo_impl.dart';
import 'package:store_app/features/home/presentation/manegar/home_cubit/home_cubit.dart';
import 'package:store_app/features/home/presentation/views/widgets/home_view_bloc_consumer.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeCubit(HomeRepoImpl(
          homeLocalDataSource: HomeLocalDataSourceImpl(),
          homeRemoteDataSource: HomeRemoteDataSourceImpl(ApiServices())))
        ..getProducts(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Products"),
          // actions: [
          //   CustomBtn(
          //     innnerText: "LogOut !",
          //     onPressed: () {},
          //   ),
          //   const SizedBox(
          //     width: 10,
          //   )
          // ],
        ),
        body: const HomeViewBlocConsumer(),
      ),
    );
  }
}

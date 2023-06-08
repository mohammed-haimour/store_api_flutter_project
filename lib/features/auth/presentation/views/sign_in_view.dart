import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store_app/core/utils/services/api_services.dart';
import 'package:store_app/features/auth/data/data_source/sign_in_remote_data_source.dart';
import 'package:store_app/features/auth/data/repos/sign_in_repo_impl.dart';
import 'package:store_app/features/auth/presentation/manegar/sign_in_cubit/sign_in_cubit.dart';
import 'package:store_app/features/auth/presentation/views/widgets/sign_in_view_body_bloc_consumer.dart';

class SingInView extends StatelessWidget {
  const SingInView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SignInCubit(SignInRepoImpl(
          loginRemoteDataSource: SignInRemoteDataSourceimpl(ApiServices()))),
      child: const Scaffold(
        body: SingInViewBodyBlocConsumer(),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store_app/core/utils/services/api_services.dart';
import 'package:store_app/features/auth/data/data_source/sign_up_remote_dara_srource.dart';
import 'package:store_app/features/auth/data/repos/sign_up_repo_impl.dart';
import 'package:store_app/features/auth/presentation/manegar/sign_up_cubit/sign_up_cubit.dart';
import 'package:store_app/features/auth/presentation/views/widgets/sign_up_view_body_bloc_consumer.dart';

class SingUpView extends StatelessWidget {
  const SingUpView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SignUpCubit(SignUpRepoImpl(
          signUpRemoteDataSource: SignUpRemoteDataSourceimpl(ApiServices()))),
      child: const Scaffold(
        body: SingUpViewBodyBlocConsumer(),
      ),
    );
  }
}

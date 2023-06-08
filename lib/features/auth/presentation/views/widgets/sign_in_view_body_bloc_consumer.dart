import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store_app/core/constants/custom_colors.dart';
import 'package:store_app/core/utils/functions/custom_snackbar.dart';
import 'package:store_app/core/utils/functions/navigators.dart';
import 'package:store_app/features/auth/presentation/manegar/sign_in_cubit/sign_in_cubit.dart';
import 'package:store_app/features/auth/presentation/views/widgets/sign_in_view_body_bloc_consumer_content.dart';
import 'package:store_app/features/home/presentation/views/home_view.dart';

class SingInViewBodyBlocConsumer extends StatelessWidget {
  const SingInViewBodyBlocConsumer({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SignInCubit, SignInState>(listener: (context, state) {
      if (state is SignInError) {
        customSnackBar(context, msg: state.err, color: customRed);
      } else if (state is SignInFailure) {
        customSnackBar(context, msg: state.failMsg, color: customRed);
      } else if (state is SignInSuccess) {
        customSnackBar(context, msg: state.successMsg, color: customGreen);
        replaceTo(context, const HomeView());
      }
    }, builder: (context, state) {
      return SingInViewBodyBlocConsumerContent(
        isLoading: state is SignInLoading ? true : false,
      );
    });
  }
}

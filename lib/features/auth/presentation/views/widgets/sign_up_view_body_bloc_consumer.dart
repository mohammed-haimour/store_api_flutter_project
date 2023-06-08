import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store_app/core/constants/custom_colors.dart';
import 'package:store_app/core/utils/functions/custom_snackbar.dart';
import 'package:store_app/core/utils/functions/navigators.dart';
import 'package:store_app/features/auth/presentation/manegar/sign_up_cubit/sign_up_cubit.dart';
import 'package:store_app/features/auth/presentation/views/sign_in_view.dart';
import 'package:store_app/features/auth/presentation/views/widgets/sign_up_view_body_bloc_consumer_content.dart';

class SingUpViewBodyBlocConsumer extends StatelessWidget {
  const SingUpViewBodyBlocConsumer({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SignUpCubit, SignUpState>(
      listener: (context, state) {
        if (state is SignUpError) {
          customSnackBar(context, msg: state.err, color: customRed);
        } else if (state is SignUpFailure) {
          customSnackBar(context, msg: state.failMsg, color: customRed);
        } else if (state is SignUpSuccess) {
          customSnackBar(context, msg: state.successMsg, color: customGreen);
          replaceTo(context, const SingInView());
        }
      },
      builder: (context, state) {
        return SingUpViewBodyBlocConsumerContent(
          isLoading: state is SignUpLoading ? true : false,
        );
      },
    );
  }
}

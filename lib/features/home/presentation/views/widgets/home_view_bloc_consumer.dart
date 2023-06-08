import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store_app/core/utils/functions/navigators.dart';
import 'package:store_app/core/utils/functions/screen_info.dart';
import 'package:store_app/core/utils/widgets/custom_btn.dart';
import 'package:store_app/features/auth/presentation/views/sign_in_view.dart';
import 'package:store_app/features/home/presentation/manegar/home_cubit/home_cubit.dart';
import 'package:store_app/features/home/presentation/views/widgets/home_view_bloc_consumer_content.dart';

class HomeViewBlocConsumer extends StatelessWidget {
  const HomeViewBlocConsumer({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeState>(
      listener: (context, state) {},
      builder: (context, state) {
        if (state is HomeProductsSuccess) {
          return HomeViewBlocConsumerContent(proudcts: state.prds);
        } else if (state is HomeProductsLoading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (state is HomeProductsError) {
          return Center(
            child: Text(state.err),
          );
        } else if (state is HomeProductsFailure) {
          return SizedBox(
            height: getheight(context),
            width: double.infinity,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Text("Please SignIn First"),
                const SizedBox(
                  height: 10,
                ),
                CustomBtn(
                  innnerText: "Please Sign in",
                  onPressed: () {
                    replaceTo(context, const SingInView());
                  },
                )
              ],
            ),
          );
        } else {
          return const Center();
        }
      },
    );
  }
}

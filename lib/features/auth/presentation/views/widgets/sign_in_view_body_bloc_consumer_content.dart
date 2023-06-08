import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store_app/core/constants/custom_colors.dart';
import 'package:store_app/core/constants/styles.dart';
import 'package:store_app/core/utils/functions/navigators.dart';
import 'package:store_app/core/utils/functions/screen_info.dart';
import 'package:store_app/core/utils/widgets/custom_btn.dart';
import 'package:store_app/core/utils/widgets/custom_text_btn.dart';
import 'package:store_app/core/utils/widgets/custom_text_form_field.dart';
import 'package:store_app/features/auth/presentation/manegar/sign_in_cubit/sign_in_cubit.dart';
import 'package:store_app/features/auth/presentation/views/sign_up_view.dart';

class SingInViewBodyBlocConsumerContent extends StatefulWidget {
  const SingInViewBodyBlocConsumerContent({super.key, this.isLoading = false});
  final bool isLoading;
  @override
  State<SingInViewBodyBlocConsumerContent> createState() =>
      _SingInViewBodyBlocConsumerContentState();
}

class _SingInViewBodyBlocConsumerContentState
    extends State<SingInViewBodyBlocConsumerContent> {
  final GlobalKey<FormState> _formKey = GlobalKey();
  String email = "";
  String password = "";

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        padding: const EdgeInsets.all(20),
        height: getheight(context),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Icon(
                    Icons.store,
                    size: 80,
                  ),
                  Text(
                    "Welcome To \nStore App \nSing in",
                    style: Styles.textStyle30,
                  ),
                ],
              ),
              Column(
                children: [
                  CustomTextFormField(
                      onSaved: (value) {
                        email = value!;
                      },
                      validator: (value) {
                        if (value.toString().isEmpty) {
                          return "This Field Is Required";
                        } else {
                          return null;
                        }
                      },
                      inputType: TextInputType.emailAddress,
                      innerText: "Your Email Address",
                      prefixIcon: Icons.email),
                  const SizedBox(
                    height: 15,
                  ),
                  CustomTextFormField(
                      onSaved: (value) {
                        password = value!;
                      },
                      validator: (value) {
                        if (value.toString().isEmpty) {
                          return "This Field Is Required";
                        } else {
                          return null;
                        }
                      },
                      inputType: TextInputType.visiblePassword,
                      innerText: "Your Password",
                      prefixIcon: Icons.password),
                  const SizedBox(
                    height: 15,
                  ),
                  const Divider(
                    color: customGrey,
                  ),
                  Row(
                    children: [
                      const Text("Don't Have An Account ? "),
                      CustomTextBtn(
                        text: "Creat It",
                        onPressed: () {
                          replaceTo(context, const SingUpView());
                        },
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  CustomBtn(
                      width: double.infinity,
                      innnerText: widget.isLoading ? "Loading" : "Sing in",
                      onPressed: () async {
                        if (widget.isLoading == false) {
                          if (_formKey.currentState!.validate()) {
                            _formKey.currentState!.save();
                            BlocProvider.of<SignInCubit>(context)
                                .userLogin(email: email, password: password);
                          } else {}
                        } else {}
                      })
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

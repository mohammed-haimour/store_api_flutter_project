import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store_app/core/constants/custom_colors.dart';
import 'package:store_app/core/constants/styles.dart';
import 'package:store_app/core/utils/functions/navigators.dart';
import 'package:store_app/core/utils/functions/screen_info.dart';
import 'package:store_app/core/utils/widgets/custom_btn.dart';
import 'package:store_app/core/utils/widgets/custom_text_btn.dart';
import 'package:store_app/core/utils/widgets/custom_text_form_field.dart';
import 'package:store_app/features/auth/presentation/manegar/sign_up_cubit/sign_up_cubit.dart';
import 'package:store_app/features/auth/presentation/views/sign_in_view.dart';

class SingUpViewBodyBlocConsumerContent extends StatefulWidget {
  const SingUpViewBodyBlocConsumerContent({super.key, required this.isLoading});
  final bool isLoading;

  @override
  State<SingUpViewBodyBlocConsumerContent> createState() =>
      _SingUpViewBodyBlocConsumerContentState();
}

class _SingUpViewBodyBlocConsumerContentState
    extends State<SingUpViewBodyBlocConsumerContent> {
  final GlobalKey<FormState> _formKey = GlobalKey();
  String email = "";
  String password = "";
  String name = "";
  String phone = "";
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
                    "Welcome To \nStore App\nSign Up",
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
                  CustomTextFormField(
                      onSaved: (value) {
                        name = value!;
                      },
                      validator: (value) {
                        if (value.toString().isEmpty) {
                          return "This Field Is Required";
                        } else {
                          return null;
                        }
                      },
                      inputType: TextInputType.text,
                      innerText: "Your Name",
                      prefixIcon: Icons.person),
                  const SizedBox(
                    height: 15,
                  ),
                  CustomTextFormField(
                      onSaved: (value) {
                        phone = value!;
                      },
                      validator: (value) {
                        if (value.toString().isEmpty) {
                          return "This Field Is Required";
                        } else {
                          return null;
                        }
                      },
                      inputType: TextInputType.visiblePassword,
                      innerText: "Your Phone Number",
                      prefixIcon: Icons.phone),
                  const SizedBox(
                    height: 15,
                  ),
                  const Divider(
                    color: customGrey,
                  ),
                  Row(
                    children: [
                      const Text("Do You Have An Account ? "),
                      CustomTextBtn(
                        text: "Sing in",
                        onPressed: () {
                          replaceTo(context, const SingInView());
                        },
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  CustomBtn(
                    width: double.infinity,
                    innnerText: "Create And Go To Sign In Page !",
                    onPressed: () async {
                      if (widget.isLoading == false) {
                        if (_formKey.currentState!.validate()) {
                          _formKey.currentState!.save();
                          BlocProvider.of<SignUpCubit>(context).userSignUp(
                              email: email,
                              password: password,
                              name: name,
                              phone: phone);
                        } else {}
                      } else {}
                    },
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

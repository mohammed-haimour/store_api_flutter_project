import 'package:flutter/material.dart';
import 'package:store_app/core/constants/custom_colors.dart';

dynamic customSnackBar(context, {final msg, final Color color = customRed}) {
  return ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    content: Text(msg),
    backgroundColor: color,
    duration: const Duration(milliseconds: 500),
    showCloseIcon: true,
    // action: SnackBarAction(
    //   label: 'OK',
    //   onPressed: () {},
    // ),
  ));
}

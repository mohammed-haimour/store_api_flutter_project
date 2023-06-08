import 'package:store_app/features/auth/domain/entities/sign_up_entity.dart';

import 'data_model.dart';

class SignUpModel extends SingUpEntity {
  bool? status;
  String? message;
  Data? data;

  SignUpModel({this.status, this.message, this.data})
      : super(
            signUpStatus: status ?? false, msg: message ?? "يا زلمممه شو مالك");

  factory SignUpModel.fromJson(Map<String, dynamic> json) => SignUpModel(
        status: json['status'] as bool?,
        message: json['message'] as String?,
        data: json['data'] == null
            ? null
            : Data.fromJson(json['data'] as Map<String, dynamic>),
      );

  Map<String, dynamic> toJson() => {
        'status': status,
        'message': message,
        'data': data?.toJson(),
      };
}

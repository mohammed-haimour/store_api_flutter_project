import 'package:store_app/features/auth/domain/entities/login_entity.dart';
import 'data_model.dart';

class SignInModel extends SignInEntity {
  bool? status;
  String? message;
  Data? data;

  SignInModel({this.status, this.message, this.data})
      : super(
            loginStatus: status ?? false,
            msg: message ?? "Please Try Again Later يا زلمه",
            token: data?.token ?? "");

  factory SignInModel.fromJson(Map<String, dynamic> json) => SignInModel(
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

import 'package:hive_flutter/hive_flutter.dart';
part 'login_entity.g.dart';

@HiveType(typeId: 0)
class SignInEntity {
  final bool? loginStatus;
  final String? msg;
  @HiveField(0)
  final String token;
  SignInEntity({this.loginStatus, this.msg, required this.token});
}

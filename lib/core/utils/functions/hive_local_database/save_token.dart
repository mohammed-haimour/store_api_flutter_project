import 'package:hive_flutter/hive_flutter.dart';
import 'package:store_app/core/constants/hive_boxes.dart';
import 'package:store_app/features/auth/domain/entities/login_entity.dart';

void saveToken(SignInEntity token) async {
  var box = Hive.box<SignInEntity>(singingBox);
  await box.clear();
  box.add(token);
}

import 'package:store_app/core/utils/functions/hive_local_database/save_token.dart';
import 'package:store_app/core/utils/services/api_services.dart';
import 'package:store_app/features/auth/domain/entities/login_entity.dart';
import 'package:store_app/features/auth/domain/model/sign_in_model/sign_in_model.dart';

abstract class SignInRemoteDataSource {
  Future<SignInEntity> userSignIn(
      {required String email, required String password});
}

class SignInRemoteDataSourceimpl extends SignInRemoteDataSource {
  final ApiServices apiService;

  SignInRemoteDataSourceimpl(this.apiService);

  @override
  Future<SignInEntity> userSignIn(
      {required String email, required String password}) async {
    Map<String, dynamic> data = await apiService.postData(
        endPoint: "login", data: {"email": email, "password": password});
    SignInEntity res = SignInModel.fromJson(data);

    print("this is the TOKEN U HAVE FOR THIS USER --> ${res.token}");

    if (res.token.isNotEmpty) {
      print("Saved");
      saveToken(res);
    } else {
      print("not Saved");
    }

    return res;
  }
}

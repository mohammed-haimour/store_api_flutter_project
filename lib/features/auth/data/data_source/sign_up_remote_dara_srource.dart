import 'package:store_app/core/utils/services/api_services.dart';
import 'package:store_app/features/auth/domain/entities/sign_up_entity.dart';
import 'package:store_app/features/auth/domain/model/sing_up_model/sing_up_model.dart';

abstract class SignUpRemoteDataSource {
  Future<SingUpEntity> userSignUp(
      {required String email,
      required String password,
      required String name,
      required String phone});
}

class SignUpRemoteDataSourceimpl extends SignUpRemoteDataSource {
  final ApiServices apiService;

  SignUpRemoteDataSourceimpl(this.apiService);

  @override
  Future<SingUpEntity> userSignUp(
      {required String email,
      required String password,
      required String name,
      required String phone}) async {
    Map<String, dynamic> data = await apiService.postData(
        endPoint: "register",
        data: {
          "email": email,
          "password": password,
          "name": name,
          "phone": phone
        });
    SingUpEntity res = SignUpModel.fromJson(data);

    print("this is --> ${res.msg}");

    return res;
  }
}

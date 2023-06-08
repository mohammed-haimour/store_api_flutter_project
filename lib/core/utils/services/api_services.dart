import 'package:dio/dio.dart';

class ApiServices {
  static Dio? dio;

  static init() {
    dio = Dio(BaseOptions(
      baseUrl: "https://student.valuxapps.com/api/",
      receiveDataWhenStatusError: true,
      headers: {"Content-Type": "application/json", "lang": "en"},
    ));
  }

  Future<Map<String, dynamic>> getData(
      {required String endPoint, required Map<String, dynamic> querey}) async {
    var res = await dio!.get(endPoint, queryParameters: querey);
    return res.data;
  }

  Future<Map<String, dynamic>> postData(
      {required String endPoint,
      Map<String, dynamic>? query,
      required Map<String, dynamic> data,
      String? token}) async {
    dio!.options.headers = {"Authorization": token, "lang": "en"};
    var res = await dio!.post(endPoint, queryParameters: query, data: data);
    return res.data;
  }
}

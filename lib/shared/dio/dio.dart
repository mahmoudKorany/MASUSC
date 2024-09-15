import 'package:dio/dio.dart';

class DioHelper
{
  static Dio? dio ;
  static init()
  {
    dio = Dio(
      BaseOptions(
        baseUrl: 'http://www.masusc.com/api/v2/',
        receiveDataWhenStatusError: true,
      ),
    );
  }

  static Future<Response> postData({
    required String url,
    Map<String,dynamic> ? query,
    required Map<String,dynamic> data,
    String lang = 'en',
    String ?token,
  })async
  {

    var respo=  await dio!.post(
        url,
        queryParameters: query,
        data: data,
        options:token != null ? Options(
            headers:
            {
              'Content-Type': 'application/json',
              'Accept':'application/json',
              'Authorization': 'Bearer $token',
            }
        ) :Options(
            headers:
            {
              'Content-Type': 'application/json'
            }
        )
    );
    return respo;
  }
  static Future<Response> getData({
    required String url,
    required Map<String,dynamic> query,
  }) async{
    return await dio!.get(
        url,
        queryParameters: query
    );
  }
}
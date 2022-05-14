import 'package:dio/dio.dart';

class DioHelper{

  static Dio? dio ;

  static void init(){
    dio =Dio(
      BaseOptions(
        baseUrl: 'https://newsapi.org/',
        receiveDataWhenStatusError: true,
      )
    );
  }
   Future<Response> fetchData({required String url ,required Map<String,dynamic> query})async{
    return await dio!.get(url,queryParameters: query);
  }



}
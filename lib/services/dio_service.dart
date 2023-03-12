import 'package:dio/dio.dart';
import 'package:dio/dio.dart' as dio_service;

class DioService {

   Dio dio = Dio();
  Future<dynamic> getMethod(String url) async {
   
    // dio.options.headers['content-type'] = 'application/json';
    return await dio
        .get(url,
            options: Options(
              responseType: ResponseType.json,
              headers: {'content-type':'application/json'},
              method: 'Get',
            ))
        .then((response) { 
      return response;
    }).catchError((err){
      return err.response!;
    });
  }
  Future<dynamic> postMethod(Map<String,dynamic>map,String url) async {
   
    return await dio
        .post(url,
        data: dio_service.FormData.fromMap(map),
            options: Options(
              responseType: ResponseType.json,
              headers: {'content-type':'application/json'},
              method: 'Post',
            ))
        .then((response) { 
          // print(response.data);
          // print(response.headers);
          // print(response.statusCode);
      return response;
      
      
    }).catchError((err){
      return err.response!;
    });
  }
}

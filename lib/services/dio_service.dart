import 'package:dio/dio.dart';
import 'package:dio/dio.dart' as dio_service;
import 'package:get_storage/get_storage.dart';
import 'package:techblog/constant/storage_const.dart';

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
   

   var token=GetStorage().read(StorageKey.token);
   if(token!=null){
    dio.options.headers["Authorization"]="$token";
   }
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

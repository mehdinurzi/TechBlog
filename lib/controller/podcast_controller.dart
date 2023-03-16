import 'package:get/get.dart';
import 'package:techblog/constant/api_constant.dart';
import 'package:techblog/services/dio_service.dart';

import '../Models/podcast_model.dart';

class PodcastController extends GetxController{
  RxList <PodcastModel> podcastList=RxList();

@override
onInit(){
  super.onInit();
  getresponse();


}

  getresponse ()async{
    var response=await DioService().getMethod(ApiUrlConstant.getHomeItems);
    if(response.statusCode==200){
      response.data['top_podcasts'].forEach((element){
        podcastList.add(PodcastModel.fromJson(element));

      });


    }

  }

}
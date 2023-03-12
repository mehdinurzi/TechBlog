import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:techblog/Models/article_model.dart';
import '../../Models/single_article_model.dart';
import '../../Models/tags_model.dart';
import '../../constant/api_constant.dart';
import '../../constant/storage_const.dart';
import '../../services/dio_service.dart';


class ManageArticleController extends GetxController{

RxList <ArticleModel>articleList=RxList.empty();
RxList <TagsModel>tagList=RxList.empty();
Rx <SingleArticleModel>singleArticle=SingleArticleModel().obs;
  RxBool loading=RxBool(false);

  
  @override
  onInit() {
    super.onInit();
    getManagedArticle();
  }
getManagedArticle()async{
   loading.value = true;

    var response =
        await DioService().getMethod(ApiConstant.getPublishedByMe+GetStorage().read(StorageKey.userId)); 
    if (response.statusCode == 200) {
      response.data.forEach((element) {
        articleList.add(ArticleModel.fromJson(element));
      });

      loading.value = false;
      // articleList.clear();
    }
 }

}
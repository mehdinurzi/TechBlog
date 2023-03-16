import 'package:get/get.dart';
import 'package:techblog/Models/article_model.dart';
import 'package:techblog/view/article/single_article_page.dart';
import '../../Models/single_article_model.dart';
import '../../Models/tags_model.dart';
import '../../constant/api_constant.dart';
import '../../services/dio_service.dart';

class SingleArticleController extends GetxController {
  Rx<SingleArticleModel> singleArticle = SingleArticleModel(content: null,image:null,title: null).obs;
  RxList<TagsModel> singleArticleTag = RxList();
  RxList<ArticleModel> singleArticleRelated = RxList();
  RxInt id = RxInt(0);
  RxBool loading = false.obs;

  getArticleInfoAndRouteToSingleScreen(String id ) async {
    loading.value = true;
    var userId = "";
// https://techblog.sasansafari.com/Techblog/api/article/get.php?command=info&id=1&user_id=1
    var response = await DioService().getMethod(
        "${ApiUrlConstant.baseUrl}article/get.php?command=info&id=$id&user_id=$userId");
    if (response.statusCode == 200) {


      singleArticle.value = SingleArticleModel.fromJson(response.data);


      singleArticleTag.clear();
      response.data['tags'].forEach((element) {
        singleArticleTag.add(TagsModel.fromJson(element)); 
      });


      singleArticleRelated.clear();
      response.data['related'].forEach((element){
      singleArticleRelated.add(ArticleModel.fromJson(element));
      });
      loading.value = false;
      Get.to(SingleArticle());
    }
  }
  getSingleSceenWithRelated(String id) async {
    var userId = "";
// https://techblog.sasansafari.com/Techblog/api/article/get.php?command=info&id=1&user_id=1
    var response = await DioService().getMethod(
        "${ApiUrlConstant.baseUrl}article/get.php?command=info&id=$id&user_id=$userId");
    if (response.statusCode == 200) {


      singleArticle.value = SingleArticleModel.fromJson(response.data);


      singleArticleTag.clear();
      response.data['tags'].forEach((element) {
        singleArticleTag.add(TagsModel.fromJson(element)); 
      });


      singleArticleRelated.clear();
      response.data['related'].forEach((element){
      singleArticleRelated.add(ArticleModel.fromJson(element));
      });
      loading.value = false;
            Get.to(SingleArticle());

    }


  }
}

import 'package:get/get.dart';
import 'package:techblog/Models/article_model.dart';

import '../../constant/api_constant.dart';
import '../../services/dio_service.dart';


class ArticleListWithTagController extends GetxController {
  RxList<ArticleModel> articleList = RxList();
  RxInt id = RxInt(0);
  

  getArticleListWithTagId(String id) async {
    articleList.clear();
    var userId = "";
    var response = await DioService().getMethod(
        "${ApiUrlConstant.baseUrl}article/get.php?command=get_articles_with_tag_id&tag_id=$id&user_id=$userId");
    if (response.statusCode == 200) {
      response.data.forEach((element) {
        articleList.add(ArticleModel.fromJson(element));
      });
    } 
        

  }
}
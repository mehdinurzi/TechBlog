import 'package:get/get.dart';
import 'package:techblog/Models/article_model.dart';

import '../../constant/api_constant.dart';
import '../../services/dio_service.dart';


class ArticleListController extends GetxController {
  RxList<ArticleModel> articleList = RxList();
  RxBool loading = false.obs;

  @override
  onInit() {
    super.onInit();
    getList();
  }

  getList() async {
    loading.value = true;

    var response =
        await DioService().getMethod(ApiConstant.getArticleListItems);

    if (response.statusCode == 200) {
      response.data.forEach((element) {
        articleList.add(ArticleModel.fromJson(element));
      });

      loading.value = false;
    }
  }
}
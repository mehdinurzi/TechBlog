// import 'package:get/get.dart';
// import 'package:techblog/Models/article_model.dart';
// import '../component/api_constant.dart';
// import '../services/dio_service.dart';

// class TagsController extends GetxController {
//   RxInt tagsId = RxInt(0);
//   RxList<ArticleModel> tagArticleList=RxList();

//   getArticleWithTagId() async {
//     tagArticleList.clear();
//     var userId = "";
//     // https://techblog.sasansafari.com/Techblog/api/article/get.php?command=get_articles_with_tag_id&tag_id=6&user_id=1
//     var response = await DioService().getMethod(
//         "${ApiConstant.baseUrl}article/get.php?command=get_articles_with_tag_id&tag_id=$tagsId&user_id=$userId");

//     if (response.statusCode == 200) {
//       response.data.forEach((element){
//         tagArticleList.add(ArticleModel.fromJson(element));
//       });

//     }
//   }
// }

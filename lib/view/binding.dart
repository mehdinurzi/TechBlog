import 'package:get/get.dart';
import 'package:techblog/controller/home_screen_controller.dart';
import '../controller/article/article_controller.dart';
import '../controller/article/manage_article_controller.dart';
import '../controller/register_controller.dart';
import '../controller/article/single_article_controller.dart';

class ArticleBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(ArticleListController());
    Get.lazyPut(() => SingleArticleController());
  }
}
class ManageArticleBinding implements Bindings {
  @override
  void dependencies() {
    // Get.put(ManageArticleController());
  Get.lazyPut(() => ManageArticleController());

  }
}
class RegisterBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(RegisterController());
  }
}
class HomeBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(HomeScreenController());
  }
}

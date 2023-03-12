import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:techblog/component/my_component.dart';
import '../../controller/article/article_with_tag_controller.dart';
import '../../controller/article/single_article_controller.dart';
import '../../gen/assets.gen.dart';

// ignore: must_be_immutable
class ArticleListScreenWithTags extends StatelessWidget {
  ArticleListWithTagController articleListWithTagController =
      Get.put(ArticleListWithTagController());
  
 var singleArticleController=Get.find<SingleArticleController>();
  ArticleListScreenWithTags({super.key,
  
 required this.title
  });
   
 String title;
  @override
  Widget build(BuildContext context) {
    var textTheme = Theme.of(context).textTheme;
    var size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: appBar(title),
      body: Obx(
        () => ListView.builder(
            itemCount: articleListWithTagController.articleList.length,
            itemBuilder: ((context, index) {
              return Padding(
                padding: EdgeInsets.fromLTRB(
                    size.width / 22, size.width / 17, size.width / 22, 0),
                child: InkWell(
                  hoverColor: Colors.white,
                  onTap: () async{
                    // singleArticleController.id.value=int.parse(articleListWithTagController.articleList[index].id!) ;
                    // Get.toNamed(NamedRoute.routeSingleArticlePage);
                    singleArticleController.getArticleInfoAndRouteToSingleScreen(articleListWithTagController.articleList[index].id!);

                  },
                  child: SizedBox(
                    height: size.height / 7.73,
                    width: double.infinity,
                    child: Row(
                      children: [
                        CachedNetworkImage(
                            imageUrl:
                                articleListWithTagController.articleList[index].image!,
                            placeholder: ((context, url) => const Loading()),
                            errorWidget: ((context, url, error) => Image(image: Image.asset(Assets.images.singlePlaceHolder.path,fit: BoxFit.fill,).image)),
                            imageBuilder: ((context, imageProvider) {
                              return Container(
                                height: size.height / 7.73,
                                width: size.width / 3.9,
                                decoration: BoxDecoration(
                                    borderRadius: const BorderRadius.all(
                                        Radius.circular(20)),
                                    image: DecorationImage(
                                        image: imageProvider,
                                        fit: BoxFit.cover)),
                              );
                            })),
                        Flexible(
                          child: Padding(
                            padding: EdgeInsets.only(right: size.width / 32),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                    articleListWithTagController
                                        .articleList[index].title!,
                                    style: textTheme.displayMedium),
                                Padding(
                                  padding:
                                      EdgeInsets.only(top: size.height / 29),
                                  child: Row(
                                    children: [
                                      // بیناموس نال فرستاده(تو تگ ها)
                                      // Text(
                                      //   articleListController
                                      //       .articleList[index].author!,
                                      //   style: textTheme.displaySmall,
                                      // ),
                                      Padding(
                                        padding: EdgeInsets.only(
                                            right: size.width / 25),
                                        child: Text(
                                          "بازدید  ",
                                          style: textTheme.displaySmall,
                                        ),
                                      ),
                                      Expanded(
                                        child: Text(
                                          articleListWithTagController
                                              .articleList[index].view!,
                                          style: textTheme.displaySmall,
                                        ),
                                      ),
                                      InkWell(
                                        onTap: () {},
                                        child: Text(
                                          articleListWithTagController
                                              .articleList[index].catName!,
                                          style: textTheme.headlineSmall,
                                        ),
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              );
            })),
      ),
    );
  }
}

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:techblog/component/my_component.dart';
import 'package:techblog/controller/article/manage_article_controller.dart';
import 'package:techblog/gen/assets.gen.dart';
import 'package:techblog/main.dart';

// ignore: must_be_immutable
class ManageArticle extends StatelessWidget {
  ManageArticle({super.key});

  var manageArticleController = Get.find<ManageArticleController>();
  @override
  Widget build(BuildContext context) {
    var textTheme = Theme.of(context).textTheme;
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: appBar("مدیریت مقاله ها"),
        body: Obx(() => manageArticleController.loading.value == false
            ? manageArticleController.articleList.isNotEmpty
                ? FullArticleState(textTheme)
                : ArticleEmptyState(textTheme)
            : const Loading())
        //
        );
  }

  // ignore: non_constant_identifier_names
  Widget ArticleEmptyState(TextTheme textTheme) {
    return Center(
        child: Column(
      children: [
        SizedBox(
          height: Get.height / 5,
        ),
        Image(
          image: Image.asset(Assets.images.emptyState.path).image,
          height: Get.height / 6.2,
        ),
        SizedBox(
          height: Get.height / 30,
        ),
        RichText(
          text: TextSpan(text: """هنوز هیچ مقاله ای به جامعه گیک های فارسی 
اضافه نکردی !!!""", style: textTheme.headlineMedium),
          textAlign: TextAlign.center,
        ),
        SizedBox(
          height: Get.height / 2.8,
        ),
        SizedBox(
            width: Get.width / 1.35,
            height: Get.height / 15.46,
            child: ElevatedButton(
              onPressed: () {
                Get.toNamed(NamedRoute.routeSingleManageArticle);
              },
              child: Text(
                "بریم برای نوشتن یه مقاله باحال",
                style: textTheme.bodyMedium,
              ),
            ))
      ],
    ));
  }

  // ignore: non_constant_identifier_names
  Widget FullArticleState(TextTheme textTheme) {
    return Scaffold(
      bottomNavigationBar: SizedBox(
          height: Get.height / 15.46,
          child: ElevatedButton(
            onPressed: () {
              Get.toNamed(NamedRoute.routeSingleManageArticle);
            },
            child: Text(
              "بریم برای نوشتن یه مقاله باحال",
              style: textTheme.bodyMedium,
            ),
          )),
      body: Obx(
        () => ListView.builder(
            itemCount: manageArticleController.articleList.length,
            itemBuilder: ((context, index) {
              return Padding(
                padding: EdgeInsets.fromLTRB(
                    Get.width / 22, Get.width / 17, Get.width / 22, 0),
                child: InkWell(
                  hoverColor: Colors.white,
                  onTap: () {
                    // TODO
                    // route to single manage
                  },
                  child: SizedBox(
                    height: Get.height / 7.73,
                    width: double.infinity,
                    child: Row(
                      children: [
                        CachedNetworkImage(
                            imageUrl: manageArticleController
                                .articleList[index].image!,
                            placeholder: ((context, url) => const Loading()),
                            errorWidget: ((context, url, error) => Image(
                                    image: Image.asset(
                                  Assets.images.singlePlaceHolder.path,
                                  fit: BoxFit.fill,
                                ).image)),
                            imageBuilder: ((context, imageProvider) {
                              return Container(
                                height: Get.height / 7.73,
                                width: Get.width / 3.9,
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
                            padding: EdgeInsets.only(right: Get.width / 32),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                    manageArticleController
                                        .articleList[index].title!,
                                    style: textTheme.displayMedium),
                                Padding(
                                  padding:
                                      EdgeInsets.only(top: Get.height / 29),
                                  child: Row(
                                    children: [
                                      Padding(
                                        padding: EdgeInsets.only(
                                            right: Get.width / 25),
                                        child: Text(
                                          "بازدید  ",
                                          style: textTheme.displaySmall,
                                        ),
                                      ),
                                      Expanded(
                                        child: Text(
                                          manageArticleController
                                              .articleList[index].view!,
                                          style: textTheme.displaySmall,
                                        ),
                                      ),
                                      InkWell(
                                        onTap: () {},
                                        child: Text(
                                          manageArticleController
                                              .articleList[index].catName!,
                                          style: textTheme.headlineSmall,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
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

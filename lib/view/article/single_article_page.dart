import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:share_plus/share_plus.dart';
import 'package:techblog/constant/my_colors.dart';
import 'package:techblog/component/my_component.dart';
import 'package:techblog/gen/assets.gen.dart';

import '../../controller/article/article_with_tag_controller.dart';
import '../../controller/article/single_article_controller.dart';
import '../../main.dart';
import 'article_list_screen_with_tags.dart';



// ignore: must_be_immutable
class SingleArticle extends StatelessWidget {
  // SingleArticleController singleArticleController =
  //     Get.put(SingleArticleController());
var singleArticleController=Get.find<SingleArticleController>();


  SingleArticle({super.key});



  @override
  Widget build(BuildContext context) {
    // String htmlData =
    //     "<h1>${singleArticleController.singleArticle.value.content!}</h1>";
    var textTheme = Theme.of(context).textTheme;
    var size = MediaQuery.of(context).size;

    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Obx(() => singleArticleController.loading.value == false
              ? Column(
                  children: [
                    // poster & icons on poster
                    Stack(
                      children: [
                        // postrer
                        CachedNetworkImage(
                          imageUrl: singleArticleController
                              .singleArticle.value.image!,
                          placeholder: (context, url) {
                            return const Loading();
                          },
                          errorWidget: (context, url, error) {
                            return Image(
                                image: Image.asset(
                              Assets.images.singlePlaceHolder.path,
                              fit: BoxFit.fill,
                            ).image);
                          },
                          imageBuilder: (context, imageProvider) {
                            return Container(
                              foregroundDecoration: const BoxDecoration(
                                  gradient: LinearGradient(
                                      colors:
                                          GradiantColor.singleArticlegradient,
                                      begin: Alignment.topCenter,
                                      end: Alignment.center)),
                              child: Image(
                                image: imageProvider,
                                fit: BoxFit.fill,
                              ),
                            );
                          },
                        ),
                        // icons on poster
                        Positioned(
                          top: 10,
                          right: 10,
                          child: InkWell(
                              onTap: () {
                                Get.back();
                              },
                              child: const Icon(
                                Icons.arrow_back,
                                color: Colors.white,
                                size: 30,
                              )),
                        ),
                        Positioned(
                          top: 10,
                          left: 60,
                          child: InkWell(
                              onTap: () {},
                              child: ImageIcon(
                                color: Colors.white,
                                Image.asset(Assets.icons.bookmark.path).image,
                              )),
                        ),
                        Positioned(
                          top: 10,
                          left: 10,
                          child: InkWell(
                              onTap: () {
                                Share.share(singleArticleController.singleArticle.value.title!+singleArticleController.singleArticle.value.image!);
                              },
                              child: ImageIcon(
                                  color: Colors.white,
                                  Image.asset(Assets.icons.share.path).image)),
                        )
                      ],
                    ),
                    Column(
                      children: [
                        // title/auther/view/content/tags
                        Padding(
                          padding: EdgeInsets.fromLTRB(size.width / 22,
                              size.width / 32, size.width / 22, 0),
                          child: Column(
                            children: [
                              // title
                              Align(
                                alignment: Alignment.centerRight,
                                child: Text(
                                  singleArticleController
                                      .singleArticle.value.title!,
                                  style: textTheme.labelLarge,
                                ),
                              ),
                              SizedBox(
                                height: size.height / 60,
                              ),
                              // profile icon/author/createdAt
                              Row(
                                children: [
                                  Image(
                                      image: Image.asset(
                                    Assets.images.profileAvatar.path,
                                    scale: 25,
                                  ).image),
                                  SizedBox(
                                    width: size.width / 30,
                                  ),
                                  Text(
                                    singleArticleController
                                        .singleArticle.value.author!,
                                    style: textTheme.displayMedium,
                                  ),
                                  SizedBox(
                                    width: size.width / 20,
                                  ),
                                  Text(
                                    singleArticleController
                                        .singleArticle.value.createdAt!,
                                    style: textTheme.displaySmall,
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: size.height / 30,
                              ),

                              // content

                              // Html(
                              //   data: htmlData,
                              //   style: {
                              //     "h1": Style(
                              //         color: Colors.black,
                              //         fontFamily: 'dana',
                              //         fontSize: FontSize(14),
                              //         fontWeight: FontWeight.w300)
                              //   },
                              //   //Optional parameters:
                              // ),
                              // HtmlWidget(
                              //   singleArticleController
                              //       .singleArticle.value.content!,
                              //   textStyle: textTheme.headlineLarge,
                              //   enableCaching: true,
                              //   onLoadingBuilder:
                              //       ((context, element, loadingProgress) =>
                              //           const Loading()),
                              // ),
                              Text(
                                singleArticleController
                                    .singleArticle.value.content!,
                                style: textTheme.headlineLarge,
                              ),

                              SizedBox(
                                height: size.height / 30,
                              ),

                              // tags
                              SizedBox(
                                height: size.height / 22.83,
                                child: ListView.builder(
                                    itemCount: singleArticleController
                                        .singleArticleTag.length,
                                    scrollDirection: Axis.horizontal,
                                    itemBuilder: (context, index) {
                                      return Padding(
                                        padding: EdgeInsets.only(
                                            left: size.width / 35),
                                        child: InkWell(
                                          onTap: () async {
                                            var tagId = singleArticleController
                                                .singleArticleTag[index].id!;
                                            await Get.find<
                                                    ArticleListWithTagController>()
                                                .getArticleListWithTagId(tagId);
                                            String tagTitle=singleArticleController.singleArticleTag[index].title!;

                                            Get.to( ()=>ArticleListScreenWithTags(title: tagTitle,));

                                          },
                                          child: Container(
                                            decoration: const BoxDecoration(
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(50)),
                                                color: Color.fromARGB(
                                                    255, 242, 242, 242)),
                                            child: Padding(
                                              padding: EdgeInsets.fromLTRB(
                                                  size.width / 25,
                                                  size.height / 110,
                                                  size.width / 20,
                                                  0),
                                              child: Text(
                                                singleArticleController
                                                    .singleArticleTag[index]
                                                    .title!,
                                                style: textTheme.titleMedium,
                                              ),
                                            ),
                                          ),
                                        ),
                                      );
                                    }),
                              ),

                              SizedBox(
                                height: size.height / 15,
                              ),
                              // header of"نوشته های مرتبط"
                              Align(
                                  alignment: Alignment.centerRight,
                                  child: Text("نوشته های مرتبط",
                                      style: textTheme.labelMedium)),
                              SizedBox(
                                height: size.height / 15,
                              ),
                            ],
                          ),
                        ),
                        // Article horizontal listveiw at the end
                        SizedBox(
                          height: size.height / 4,
                          child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: singleArticleController
                                  .singleArticleRelated.length,
                              itemBuilder: (context, index) {
                                return InkWell(
                                  highlightColor: Colors.white,
                                  onTap: () async{
                                   var reladed=singleArticleController.singleArticleRelated[index].id!;
                                   await singleArticleController.getSingleSceenWithRelated(reladed);

                                    Get.toNamed(  NamedRoute.routeSingleArticlePage);
                                  },
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      // image & Stack
                                      Padding(
                                          padding: EdgeInsets.fromLTRB(
                                              0, 0, size.width / 22, 0),
                                          child: Stack(
                                            children: [
                                              SizedBox(
                                                height: size.height / 5.53,
                                                width: size.width / 2.66,
                                                child: CachedNetworkImage(
                                                    imageUrl:
                                                        singleArticleController
                                                            .singleArticleRelated[
                                                                index]
                                                            .image!,
                                                    imageBuilder:
                                                        ((context,
                                                                imageProvider) =>
                                                            Container(
                                                              decoration: BoxDecoration(
                                                                  borderRadius:
                                                                      const BorderRadius
                                                                              .all(
                                                                          Radius.circular(
                                                                              20)),
                                                                  image: DecorationImage(
                                                                      image:
                                                                          imageProvider,
                                                                      fit: BoxFit
                                                                          .cover)),
                                                            )),
                                                    placeholder:
                                                        ((context, url) =>
                                                            const Loading()),
                                                    errorWidget: ((context, url,
                                                            error) =>
                                                        Image(
                                                            image: Image.asset(
                                                          Assets
                                                              .images
                                                              .singlePlaceHolder
                                                              .path,
                                                          fit: BoxFit.fill,
                                                        ).image))),
                                              ),
                                              Positioned(
                                                left: 10,
                                                right: 10,
                                                bottom: 10,
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Text(
                                                      "ساسان صفری",
                                                      style:
                                                          textTheme.displayLarge,
                                                    ),
                                                    Row(
                                                      children: [
                                                        Text(
                                                            singleArticleController
                                                                .singleArticleRelated[
                                                                    index]
                                                                .view!,
                                                            style: textTheme
                                                                .displayLarge),
                                                        const SizedBox(
                                                          width: 8,
                                                        ),
                                                        const Icon(
                                                          CupertinoIcons.eye,
                                                          color: Colors.white,
                                                          size: 7,
                                                        ),
                                                      ],
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          )),
                                      // under image text
                                      SizedBox(
                                        width: size.width / 2.66,
                                        child: Padding(
                                          padding: EdgeInsets.fromLTRB(
                                              0,
                                              8,
                                              index == 0
                                                  ? size.width / 22
                                                  : size.width / 22,
                                              0),
                                          child: Text(
                                            singleArticleController
                                                .singleArticleRelated[index]
                                                .title!,
                                            style: textTheme.displayMedium,
                                            overflow: TextOverflow.ellipsis,
                                            maxLines: 2,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                );
                              }),
                        )
                      ],
                    ),
                  ],
                )
              : SizedBox(height: size.height / 2, child: const Loading())),
        ),
      ),
    );
  }
}

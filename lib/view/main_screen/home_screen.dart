import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:techblog/controller/home_screen_controller.dart';
import 'package:techblog/main.dart';
import 'package:techblog/view/podcast.dart';
import '../../Models/fake_data.dart';
import '../../component/dimens.dart';
import '../../constant/my_colors.dart';
import '../../component/my_component.dart';
import '../../constant/my_string.dart';
import '../../controller/article/article_with_tag_controller.dart';
import '../../controller/article/single_article_controller.dart';
import '../../gen/assets.gen.dart';
import '../article/article_list_screen_with_tags.dart';

// ignore: must_be_immutable
class HomeScreen extends StatelessWidget {
  HomeScreen({
    Key? key,
 
    required this.textTheme,
  }) : super(key: key);
  final HomeScreenController homeScreenController =
      Get.put(HomeScreenController());
  SingleArticleController singleArticleController =
      Get.put(SingleArticleController());
  ArticleListWithTagController articleListWithTagController =
      Get.put(ArticleListWithTagController());

 
  final TextTheme textTheme;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: SizedBox(
        child: Obx(() => homeScreenController.loading.value == false
            ? Column(
                children: [
                  const SizedBox(
                    height: 10,
                  ),
                  poster(),
                  const SizedBox(
                    height: 50,
                  ),
                  tags(),
                  const SizedBox(
                    height: 40,
                  ),
                  viewHottestArticle(context, MyStrings.viewHottestBlog),
                  const SizedBox(
                    height: 10,
                  ),
                  topVisited(),
                  const SizedBox(
                    height: 40,
                  ),
                  viewHottestPodcast(),
                  const SizedBox(
                    height: 10,
                  ),
                  topPodcasts(),
                  SizedBox(
                    height: Get.height / 10,
                  ),
                ],
              )
            : SizedBox(
                height: Get.height / 2,
                child: const Center(child: Loading()),
              )),
      ),
    );
  }

  Widget topVisited() {
    return SizedBox(
      height: Get.height / 4,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: homeScreenController.topVisitedList.length,
          itemBuilder: (context, index) {
            return InkWell(
              
              onTap: () {
                singleArticleController.getArticleInfoAndRouteToSingleScreen(
                    homeScreenController.topVisitedList[index].id!);
              },
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // image & Stack
                  Padding(
                      padding: EdgeInsets.fromLTRB(
                          0, 0, index == 0 ? Get.width / 12 : 15, 0),
                      child: Stack(
                        children: [
                          SizedBox(
                            height: Get.height / 5.53,
                            width: Get.width / 2.66,
                            child: CachedNetworkImage(
                                imageUrl: homeScreenController
                                    .topVisitedList[index].image!,
                                imageBuilder: ((context, imageProvider) =>
                                    Container(
                                      decoration: BoxDecoration(
                                          borderRadius: const BorderRadius.all(
                                              Radius.circular(20)),
                                          image: DecorationImage(
                                              image: imageProvider,
                                              fit: BoxFit.cover)),
                                    )),
                                placeholder: ((context, url) =>
                                    const Loading()),
                                errorWidget: ((context, url, error) => Image(
                                        image: Image.asset(
                                      Assets.images.singlePlaceHolder.path,
                                      fit: BoxFit.fill,
                                    ).image))),
                          ),
                          Positioned(
                            left: 10,
                            right: 10,
                            bottom: 10,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  homeScreenController
                                      .topVisitedList[index].author!,
                                  style: textTheme.displayLarge,
                                ),
                                Row(
                                  children: [
                                    Text(
                                        homeScreenController
                                            .topVisitedList[index].view!,
                                        style: textTheme.displayLarge),
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
                    width: Get.width / 2.66,
                    child: Padding(
                      padding: EdgeInsets.fromLTRB(
                          0, 8, index == 0 ? Dimens.bodyMargin : 15, 0),
                      child: Text(
                        homeScreenController.topVisitedList[index].title!,
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
    );
  }

  Widget topPodcasts() {
    return SizedBox(
        height: Get.height / 4,
        child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: homeScreenController.topPodcastList.length,
            itemBuilder: (context, index) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // image & Stack
                  Padding(
                      padding: EdgeInsets.fromLTRB(
                          0, 0, index == 0 ? Get.width / 12 : 15, 0),
                      child: CachedNetworkImage(
                        imageUrl:
                            homeScreenController.topPodcastList[index].poster!,
                        imageBuilder: ((context, imageProvider) => Container(
                              height: Get.height / 5.53,
                              width: Get.width / 2.66,
                              decoration: BoxDecoration(
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(20)),
                                  image: DecorationImage(
                                      image: imageProvider, fit: BoxFit.fill)),
                            )),
                        placeholder: ((context, url) => const Loading()),
                        errorWidget: ((context, url, error) => Image(
                                image: Image.asset(
                              Assets.images.singlePlaceHolder.path,
                              fit: BoxFit.fill,
                            ).image)),
                      )),
                  // under image text
                  SizedBox(
                    width: Get.width / 2.66,
                    child: Padding(
                      padding: EdgeInsets.fromLTRB(
                          0, 8, index == 0 ? Dimens.bodyMargin : 15, 0),
                      child: Text(
                        homeScreenController.topPodcastList[index].title!,
                        style: textTheme.displayMedium,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 2,
                      ),
                    ),
                  ),
                ],
              );
            }));
  }

  Widget poster() {
    return Obx(
      () => InkWell(
        onTap: () {

      
          singleArticleController
              .getArticleInfoAndRouteToSingleScreen(homeScreenController.poster.value.id!);
        },
        child: Stack(children: [
          // image & gradient
          Container(
            height: Get.height / 4.2,
            width: Get.width / 1.2,
            foregroundDecoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(30)),
                gradient: LinearGradient(
                    colors: GradiantColor.homepostercolorgradiant,
                    end: Alignment.bottomCenter,
                    begin: Alignment.topCenter)),
            child: CachedNetworkImage(
              imageUrl: homeScreenController.poster.value.image!,
              imageBuilder: ((context, imageProvider) => Container(
                    decoration: BoxDecoration(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(30)),
                        image: DecorationImage(
                            image: imageProvider, fit: BoxFit.cover)),
                  )),
              placeholder: ((context, url) => const Loading()),
              errorWidget: ((context, url, error) => Image(
                      image: Image.asset(
                    Assets.images.singlePlaceHolder.path,
                    fit: BoxFit.fill,
                  ).image)),
            ),
          ),
          //  poster text

          Positioned(
            left: 20,
            right: 20,
            bottom: 10,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "${homeScreenController.topVisitedList[1].author!} - ${homeScreenController.topVisitedList[1].createdAt!}",
                      style: textTheme.displayLarge,
                    ),
                    Row(
                      children: [
                        Text(homeScreenController.topVisitedList[1].view!,
                            style: textTheme.displayLarge),
                        const SizedBox(
                          width: 8,
                        ),
                        const Icon(
                          CupertinoIcons.eye,
                          color: Colors.white,
                          size: 15,
                        ),
                      ],
                    ),
                  ],
                ),
                Text(
                  homeScreenController.poster.value.title!,
                  style: textTheme.titleSmall,
                )
              ],
            ),
          )
        ]),
      ),
    );
  }

  Widget viewHottestPodcast() {
    return Padding(
      padding: EdgeInsets.fromLTRB(0, 0, Dimens.bodyMargin, 0),
      child: InkWell(
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
        hoverColor: Colors.transparent,
        onTap: () {
          Get.to(() => Podcast());
        },
        child: Row(
          children: [
            ImageIcon(
              Image.asset(Assets.icons.microphon.path).image,
              color: SolidColors.colorTitle,
              size: Get.height / 37.77,
            ),
            const SizedBox(
              width: 8,
            ),
            Text(
              MyStrings.viewHottestPodcast,
              style: textTheme.labelMedium,
            )
          ],
        ),
      ),
    );
  }

  Widget tags() {
    return SizedBox(
      height: Get.height / 22.83,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: tagList.length,
          itemBuilder: (context, index) {
            return InkWell(
              highlightColor: Colors.white,
              onTap: () async {
//  articleListWithTagController.id.value=int.parse(homeScreenController.tagList[index].id!);

                await articleListWithTagController.getArticleListWithTagId(
                    homeScreenController.tagList[index].id!);

                Get.to(ArticleListScreenWithTags(
                    title: homeScreenController.tagList[index].title!));
              },
              child: Padding(
                padding:
                    EdgeInsets.fromLTRB(0, 0, index == 0 ? Get.width / 12 : 15, 0),
                child: MainTags( index: index, textTheme: textTheme),
              ),
            );
          }),
    );
  }

Widget viewHottestArticle(BuildContext context,String title) {
  var textTheme = Theme.of(context).textTheme;

  return Padding(
    padding: EdgeInsets.fromLTRB(0, 0, Get.width / 12, 0),
    child: InkWell(
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      hoverColor: Colors.transparent,
      onTap: () {
        Get.toNamed(NamedRoute.routeArticleListPage);
        // Get.to(()=>ArticleListScreen(title: MyStrings.articlelist));
      },
      child: Row(
        children: [
          ImageIcon(
            Image.asset(Assets.icons.pencil.path).image,
            color: SolidColors.colorTitle,
            size: Get.height / 37.77,
          ),
          const SizedBox(
            width: 8,
          ),
          Text(
            title,
            style: textTheme.labelMedium,
          )
        ],
      ),
    ),
  );
}
}



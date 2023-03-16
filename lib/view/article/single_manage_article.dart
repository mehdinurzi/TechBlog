import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:techblog/controller/article/manage_article_controller.dart';
import 'package:techblog/controller/article/single_article_controller.dart';
import 'package:techblog/gen/assets.gen.dart';
import 'package:techblog/services/pick_file.dart';
import '../../constant/my_colors.dart';
import '../../controller/article/article_controller.dart';
import '../../controller/file_controller.dart';
import '../../controller/home_screen_controller.dart';
import 'article_content_web.dart';

// ignore: must_be_immutable
class SingleManageArticle extends StatelessWidget {
  SingleManageArticle({super.key});
  var singleArticleController = Get.find<SingleArticleController>();
  FilePickerControler filePickerControler = Get.put(FilePickerControler());
  var manageArticleController = Get.find<ManageArticleController>();
  ArticleListController articleListController =
      Get.put(ArticleListController());
  getTitle() {
    Get.defaultDialog(
      title: "لطفا یه عنوان پر معنا و کوتاه انتخاب کن",
      backgroundColor: Colors.white,
      titleStyle: const TextStyle(
        color: SolidColors.colorTitle,
      ),
      content: TextField(
        controller: manageArticleController.titleTextEditingController,
        style: const TextStyle(
          color: SolidColors.colorTitle,
        ),
        keyboardType: TextInputType.text,
        decoration: const InputDecoration(hintText: "اینجا بنویس"),
      ),
      confirm: ElevatedButton(
          onPressed: () {
            manageArticleController.updateTitle();
            Get.back();
          },
          child: const Text("ثبت")),
      cancel: ElevatedButton(
          onPressed: () {
            Get.back();
          },
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(Colors.white),
          ),
          child: const Text(
            "بعدا",
            style: TextStyle(color: SolidColors.primeryColor),
          )),
    );
  }

  var homeScreenController = Get.find<HomeScreenController>();

  @override
  Widget build(BuildContext context) {
    var textTheme = Theme.of(context).textTheme;

    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Obx(
            () => Column(
              children: [
                Stack(
                  children: [
                    SizedBox(
                        height: Get.height / 3.1,
                        width: Get.width,
                        child: filePickerControler.file.value.name == 'nothing'
                            ? Container(
                                decoration: BoxDecoration(
                                    image: DecorationImage(
                                        image: Image.asset(Assets
                                                .images.singlePlaceHolder.path)
                                            .image,
                                        fit: BoxFit.fill)),
                                foregroundDecoration: const BoxDecoration(
                                    gradient: LinearGradient(
                                        colors:
                                            GradiantColor.singleArticlegradient,
                                        begin: Alignment.topCenter,
                                        end: Alignment.center)),
                                // child:  CachedNetworkImage(
                                //       imageUrl:manageArticleController.singleArticle.value.image!,
                                //       placeholder: (context, url) {
                                //         return const Loading();
                                //       },
                                //       errorWidget: (context, url, error) {
                                //         return Image(
                                //             image: Image.asset(
                                //           Assets.images.singlePlaceHolder.path,
                                //           fit: BoxFit.fill,
                                //         ).image);
                                //       },
                                //       imageBuilder: (context, imageProvider) {
                                //         return Container(
                                //           foregroundDecoration: const BoxDecoration(
                                //               gradient: LinearGradient(
                                //                   colors:
                                //                       GradiantColor.singleArticlegradient,
                                //                   begin: Alignment.topCenter,
                                //                   end: Alignment.center)),
                                //           child: Image(
                                //             image: imageProvider,
                                //             fit: BoxFit.fill,
                                //           ),
                                //         );
                                //       },
                                //     ),
                              )
                            : Image.file(
                                File(filePickerControler.file.value.path!),
                                fit: BoxFit.fill,
                              )),
                    Positioned(
                      top: 10,
                      right: 10,
                      child: InkWell(
                          onTap: () {},
                          child: const Icon(
                            Icons.arrow_back,
                            color: Colors.white,
                            size: 30,
                          )),
                    ),
                    Positioned(
                      bottom: 0,
                      left: 0,
                      right: 0,
                      child: Center(
                        // به این خاطر سنتر دادیم که کانتینر از والدش که پوزیشنه جدا بشه و اندازه های کانتینر هم خونده بشن
                        child: InkWell(
                          onTap: () async {
                            await PickFile();
                          },
                          child: Container(
                              height: Get.height / 20,
                              width: Get.width / 3,
                              decoration: const BoxDecoration(
                                  borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(14),
                                      topRight: Radius.circular(14)),
                                  color: SolidColors.primeryColor),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Text("انتخاب تصویر",
                                      style: textTheme.bodyMedium),
                                  const Icon(
                                    CupertinoIcons.plus,
                                    size: 20,
                                    color: Colors.white,
                                  ),
                                ],
                              )),
                        ),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(
                      Get.width / 22, Get.height / 20, Get.width / 22, 0),
                  child: Column(
                    children: [
                      InkWell(
                        onTap: () {
                          getTitle();
                        },
                        splashColor: Colors.transparent,
                        highlightColor: Colors.transparent,
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
                              "ویرایش عنوان مقاله",
                              style: textTheme.labelMedium,
                            )
                          ],
                        ),
                      ),
                      SizedBox(height: Get.height / 50),
                      Text(manageArticleController.singleArticle.value.title!,
                          style: textTheme.headlineMedium),
                      SizedBox(height: Get.height / 25),
                      InkWell(
                        onTap: () {
                          Get.to(() => ArticleContentEditor());
                        },
                        splashColor: Colors.transparent,
                        highlightColor: Colors.transparent,
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
                              "ویرایش متن اصلی مقاله",
                              style: textTheme.labelMedium,
                            )
                          ],
                        ),
                      ),
                      SizedBox(height: Get.height / 50),
                      Text(manageArticleController.singleArticle.value.content!,
                          style: textTheme.headlineMedium),
                      SizedBox(height: Get.height / 20),
                      InkWell(
                        onTap: () {
                          chooseCatsBottomSheet(context);
                        },
                        splashColor: Colors.transparent,
                        highlightColor: Colors.transparent,
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
                              "انتخاب دسته بندی",
                              style: textTheme.labelMedium,
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: Get.height / 40),
                      manageArticleController.singleArticle.value.catName ==
                              null
                          ? const Text("")
                          : Container(
                              height: Get.height / 15,
                              decoration: const BoxDecoration(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(50)),
                                  color: Color.fromARGB(255, 242, 242, 242)),
                              child: Padding(
                                padding: EdgeInsets.fromLTRB(
                                    0, 0, Get.width / 32, 0),
                                child: Padding(
                                  padding: EdgeInsets.fromLTRB(
                                      Get.width / 15, 15, Get.width / 20, 0),
                                  child: Text(
                                    manageArticleController
                                        .singleArticle.value.catName!,
                                    style: textTheme.titleMedium,
                                  ),
                                ),
                              )),
                      Padding(
                        padding: EdgeInsets.only(
                            top: Get.height / 20, bottom: Get.height / 40),
                        child: SizedBox(
                            width: Get.width / 2.6,
                            height: Get.height / 15.46,
                            child: ElevatedButton(
                              onPressed: ()async{await manageArticleController.storeArticle();},
                              style:
                                  Theme.of(context).elevatedButtonTheme.style,
                              child: Text(
                                manageArticleController.loading.value==true?
                                "صبر کنید...":
                                "تموم شد",
                                style: textTheme.bodyMedium,
                              ),
                            )),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget cats(BuildContext context) {
    var textTheme = Theme.of(context).textTheme;

    var homeScreenController = Get.find<HomeScreenController>();
    return SizedBox(
      height: Get.height / 8,
      child: GridView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: homeScreenController.tagList.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisSpacing: 10,
              mainAxisSpacing: 20,
              crossAxisCount: 2,
              childAspectRatio: Get.width / 1500),
          itemBuilder: (context, index) {
            return InkWell(
              onTap: () {
                manageArticleController.singleArticle.update((val) {
                  val?.catName = homeScreenController.tagList[index].title!;
                  val?.catId = homeScreenController.tagList[index].id!;
                });
              },
              splashColor: Colors.transparent,
              child: Container(
                  decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(24)),
                      gradient: LinearGradient(
                          colors: GradiantColor.tags,
                          begin: Alignment.centerRight,
                          end: Alignment.centerLeft)),
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(0, 0, Get.width / 32, 0),
                    child: Row(
                      children: [
                        ImageIcon(
                          Image.asset(Assets.icons.hashtag.path).image,
                          color: Colors.white,
                          size: Get.height / 60,
                        ),
                        SizedBox(
                          width: Get.width / 20,
                        ),
                        Text(
                          homeScreenController.tagList[index].title!,
                          style: textTheme.bodyMedium,
                        ),
                      ],
                    ),
                  )),
            );
          }),
    );
  }

  Widget mycat(BuildContext context) {
    var textTheme = Theme.of(context).textTheme;
    return Obx(
      () => manageArticleController.singleArticle.value.catName == null
          ? const Text("")
          : Container(
              height: Get.height / 15,
              decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(50)),
                  color: Color.fromARGB(255, 242, 242, 242)),
              child: Padding(
                padding: EdgeInsets.fromLTRB(0, 0, Get.width / 32, 0),
                child: Padding(
                  padding: EdgeInsets.fromLTRB(
                      Get.width / 15, 15, Get.width / 20, 0),
                  child: Text(
                    manageArticleController.singleArticle.value.catName!,
                    style: textTheme.titleMedium,
                  ),
                ),
              )),
    );
  }

  chooseCatsBottomSheet(BuildContext context) {
    var textTheme = Theme.of(context).textTheme;
    Get.bottomSheet(
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      Container(
        height: Get.height / 1.5,
        decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
                topRight: Radius.circular(30), topLeft: Radius.circular(30))),
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.fromLTRB(
                  Get.height / 30, Get.height / 30, Get.height / 30, 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SvgPicture.asset(
                    Assets.images.happyBot.path,
                    height: Get.height / 20,
                  ),
                  SizedBox(
                    width: Get.width / 30,
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: Get.height / 65),
                    child: Text(
                        "روی دسته بندی مرتبط ضربه بزن تا به مقاله اضافه بشه",
                        style: textTheme.displaySmall),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: Get.height / 20,
            ),
            cats(context),
            SizedBox(
              height: Get.height / 20,
            ),
            Image.asset(
              Assets.icons.downCatArrow.path,
              scale: 3,
            ),
            SizedBox(
              height: Get.height / 20,
            ),
            mycat(context),
            SizedBox(
              height: Get.height / 10,
            ),
            SizedBox(
                width: Get.width / 2.54,
                height: Get.height / 15.46,
                child: ElevatedButton(
                    onPressed: () {
                      Get.back();
                    },
                    child: const Text("تایید"))),
          ],
        ),
      ),
    );
  }
}

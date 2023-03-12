import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:techblog/controller/article/manage_article_controller.dart';
import 'package:techblog/controller/article/single_article_controller.dart';
import 'package:techblog/gen/assets.gen.dart';
import 'package:techblog/services/pick_file.dart';
import '../../constant/my_colors.dart';
import '../../controller/article/article_controller.dart';
import '../../controller/file_controller.dart';

// ignore: must_be_immutable
class SingleManageArticle extends StatelessWidget {
  SingleManageArticle({super.key});
  var singleArticleController = Get.find<SingleArticleController>();
  FilePickerControler filePickerControler=Get.put(FilePickerControler());
  var manageArticleController=Get.find<ManageArticleController>();
ArticleListController articleListController=Get.put(ArticleListController());
  @override
  Widget build(BuildContext context) {
    var textTheme = Theme.of(context).textTheme;
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Obx(
         ()=> Column(
            children: [
              SizedBox(
                height: Get.height / 3.1,
                child: Stack(
                  children: [
                    filePickerControler.file.value.name=='nothing'?
                    Container(
                      height: Get.height / 3.1,
                      width: Get.width,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: Image.asset(
                                      Assets.images.singlePlaceHolder.path)
                                  .image,
                              fit: BoxFit.fill)),
                      foregroundDecoration: const BoxDecoration(
                          gradient: LinearGradient(
                              colors: GradiantColor.singleArticlegradient,
                              begin: Alignment.topCenter,
                              end: Alignment.center)),
                      // child:  CachedNetworkImage(
                      //       imageUrl:singleArticleController.getArticleInfoAndRouteToSingleScreen("2"),
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
                    :Image.file(File(filePickerControler.file.value.path!),fit: BoxFit.cover,),
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
                          onTap: () async{
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
                                mainAxisAlignment: MainAxisAlignment.spaceAround,
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
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(
                    Get.width / 22, Get.height / 20, Get.width / 22, 0),
                child: Column(
                  children: [
                    InkWell(
                      onTap: () {},
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
                    Text(
                        "اینجا عنوان مقاله قرار میگیره ، یه عنوان جذاب انتخاب کن",
                        style: textTheme.headlineMedium),
                    SizedBox(height: Get.height / 25),
                    InkWell(
                      onTap: () {},
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
                    Text(
                        """من متن و بدنه اصلی مقاله هستم ، اگه میخوای من رو ویرایش کنی و یه مقاله جذاب بنویسی ، نوشته آبی رنگ بالا که نوشته "ویرایش متن اصلی مقاله" رو با انگشتت لمس کن تا وارد ویرایشگر بشی""",
                        style: textTheme.headlineMedium),
                    SizedBox(height: Get.height / 20),
                    InkWell(
                      onTap: () {},
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
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: Get.height / 8),
                      child: SizedBox(
                          width: Get.width / 2.6,
                          height: Get.height / 15.46,
                          child: ElevatedButton(
                            onPressed: () {},
                            style: Theme.of(context).elevatedButtonTheme.style,
                            child: Text(
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
    );
  }
}

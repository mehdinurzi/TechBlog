import 'dart:developer';

import 'package:dio/dio.dart' as dio;
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:techblog/Models/article_model.dart';
import 'package:techblog/constant/commands.dart';
import 'package:techblog/controller/file_controller.dart';
import '../../Models/single_article_model.dart';
import '../../Models/tags_model.dart';
import '../../constant/api_constant.dart';
import '../../constant/storage_const.dart';
import '../../services/dio_service.dart';


class ManageArticleController extends GetxController{

RxList <ArticleModel>articleList=RxList.empty();
RxList <TagsModel>tagList=RxList.empty();
Rx <SingleArticleModel>singleArticle=SingleArticleModel(
  content:"""من متن و بدنه اصلی مقاله هستم ، اگه میخوای من رو ویرایش کنی و یه مقاله جذاب بنویسی ، نوشته آبی رنگ بالا که نوشته "ویرایش متن اصلی مقاله" رو با انگشتت لمس کن تا وارد ویرایشگر بشی""" ,
  image: "",
  title: "اینجا عنوان مقاله قرار میگیره ، یه عنوان جذاب انتخاب کن" ,).obs;
  RxBool loading=RxBool(false);
  TextEditingController titleTextEditingController=TextEditingController();

  
  @override
  onInit() {
    super.onInit();
    getManagedArticle();
  }
getManagedArticle()async{
   loading.value = true;

    var response =
        await DioService().getMethod(ApiUrlConstant.getPublishedByMe+GetStorage().read(StorageKey.userId)); 
    if (response.statusCode == 200) {
      response.data.forEach((element) {
        articleList.add(ArticleModel.fromJson(element));
      });

      loading.value = false;
      // articleList.clear();
    }
 }


updateTitle(){
  singleArticle.update((val) {
    val!.title=titleTextEditingController.text;
  });
}

storeArticle()async{
  var filecontroller=Get.find<FilePickerControler>();
loading.value=true;
Map <String ,dynamic>map={
ApiArticleKeyConstant.title:singleArticle.value.title,
ApiArticleKeyConstant.tagList:"[]",
ApiArticleKeyConstant.catId:singleArticle.value.catId,
ApiArticleKeyConstant.command:Commands.store,
ApiArticleKeyConstant.image:await dio.MultipartFile.fromFile(filecontroller.file.value.path!),
ApiArticleKeyConstant.content:singleArticle.value.content,
ApiArticleKeyConstant.userId:GetStorage().read(StorageKey.userId),
};

var response=await DioService().postMethod(map, ApiUrlConstant.articlepost);
log(response.data.toString());
log(articleList.length.toString());

}
}
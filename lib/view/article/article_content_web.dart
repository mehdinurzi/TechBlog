import 'dart:developer';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:html_editor_enhanced/html_editor.dart';
import 'package:techblog/component/my_component.dart';
import '../../controller/article/manage_article_controller.dart';

// ignore: must_be_immutable
class ArticleContentEditor extends StatelessWidget {
   ArticleContentEditor({super.key});
 final HtmlEditorController controller=HtmlEditorController();
   var manageArticleController = Get.find<ManageArticleController>();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(

      onTap: () {
        if(!kIsWeb){
          controller.clearFocus();
        }
      },
       child: Scaffold(
        appBar: appBar("یک مقاله جذاب بنویس",),
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [  
              HtmlEditor(controller: controller,
              htmlEditorOptions:  HtmlEditorOptions(
                hint: "...میتونی مقالتو اینجا بنویسی",
                shouldEnsureVisible: true,
                initialText: manageArticleController.singleArticle.value.content!
                

              ),
              
              callbacks: Callbacks(onChangeContent: (p0) {
                manageArticleController.singleArticle.update((val) {val!.content=p0;});
                log(manageArticleController.singleArticle.value.content.toString());
              },),)
              
            ],
          ),
        ),
       ),
    );
  }
}
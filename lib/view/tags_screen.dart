// import 'package:cached_network_image/cached_network_image.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:techblog/view/single_article_page.dart';
// import '../component/my_component.dart';
// import '../component/my_string.dart';
// import '../controller/article_controller.dart';
// import '../controller/single_article_controller.dart';
// import '../controller/tags_controller.dart';
// import '../gen/assets.gen.dart';

// // ignore: must_be_immutable
// class TagsScreen extends StatefulWidget {

//   const TagsScreen({super.key});

//   @override
//   State<TagsScreen> createState() => _TagsScreenState();
// }

// class _TagsScreenState extends State<TagsScreen> {
//   ArticleListController articleListController =
//       Get.put(ArticleListController());

//   SingleArticleController singleArticleController =
//       Get.put(SingleArticleController());

//       TagsController tagsController=Get.put(TagsController());



//       @override
//   void initState() {
//     super.initState();
//     tagsController.getArticleWithTagId();
//   }
//   @override
//   Widget build(BuildContext context) {
//     var textTheme = Theme.of(context).textTheme;
//     var size = MediaQuery.of(context).size;
//     return Scaffold(
//       backgroundColor: Colors.white,
//       appBar: appBar(size, textTheme, MyStrings.articlelist),
//       body: Obx(
//         () => ListView.builder(
//             itemCount: tagsController.tagArticleList.length,
//             itemBuilder: ((context, index) {
//               return Padding(
//                 padding: EdgeInsets.fromLTRB(
//                     size.width / 22, size.width / 17, size.width / 22, 0),
//                 child: InkWell(
//                   hoverColor: Colors.white,
//                   onTap: () {
//                     singleArticleController.id.value=int.parse(articleListController.articleList[index].id!) ;
//                     Get.to(()=>const SingleArticle());
//                   },
//                   child: SizedBox(
//                     height: size.height / 7.73,
//                     width: double.infinity,
//                     child: Row(
//                       children: [
//                         CachedNetworkImage(
//                             imageUrl:
//                                 tagsController.tagArticleList[index].image!,
//                             placeholder: ((context, url) => const Loading()),
//                             errorWidget: ((context, url, error) => Image(image: Image.asset(Assets.images.singlePlaceHolder.path,fit: BoxFit.fill,).image)),
//                             imageBuilder: ((context, imageProvider) {
//                               return Container(
//                                 height: size.height / 7.73,
//                                 width: size.width / 3.9,
//                                 decoration: BoxDecoration(
//                                     borderRadius: const BorderRadius.all(
//                                         Radius.circular(20)),
//                                     image: DecorationImage(
//                                         image: imageProvider,
//                                         fit: BoxFit.cover)),
//                               );
//                             })),
//                         Flexible(
//                           child: Padding(
//                             padding: EdgeInsets.only(right: size.width / 32),
//                             child: Column(
//                               crossAxisAlignment: CrossAxisAlignment.start,
//                               children: [
//                                 Text(
//                                    tagsController.tagArticleList[index].title!,
//                                     style: textTheme.displayMedium),
//                                 Padding(
//                                   padding:
//                                       EdgeInsets.only(top: size.height / 29),
//                                   child: Row(
//                                     children: [
//                                       Text(
//                                         articleListController
//                                             .articleList[index].author!,
//                                         style: textTheme.displaySmall,
//                                       ),
//                                       Padding(
//                                         padding: EdgeInsets.only(
//                                             right: size.width / 25),
//                                         child: Text(
//                                           "بازدید  ",
//                                           style: textTheme.displaySmall,
//                                         ),
//                                       ),
//                                       Expanded(
//                                         child: Text(
//                                           articleListController
//                                               .articleList[index].view!,
//                                           style: textTheme.displaySmall,
//                                         ),
//                                       ),
//                                       InkWell(
//                                         onTap: () {},
//                                         child: Text(
//                                           articleListController
//                                               .articleList[index].catName!,
//                                           style: textTheme.headlineSmall,
//                                         ),
//                                       ),
//                                     ],
//                                   ),
//                                 )
//                               ],
//                             ),
//                           ),
//                         )
//                       ],
//                     ),
//                   ),
//                 ),
//               );
//             })),
//       ),
//     );
//   }
// }

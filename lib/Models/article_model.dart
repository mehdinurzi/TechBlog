import 'package:techblog/constant/api_constant.dart';

class ArticleModel {
  String? id;
  String? title;
  String? image;
  String? catId;
  String? catName;
  String? author;
  String? view;
  String? status;
//  فک کنم به خاطر اینه که مشخص کنه مقاله منتشر شده است یا نه(نباید بکند کار میاورد)
  String? createdAt;
  // String? isFavorite;

  ArticleModel({
     this.id,
     this.title,
     this.image,
     this.catId,
     this.catName,
     this.author,
     this.view,
     this.createdAt,
     this.status,
    // required this.isFavorite,
  });

  ArticleModel.fromJson(Map<String, dynamic> element) {
    id = element["id"];
    title = element["title"];
    image =ApiConstant.hostDlUrl+ element["image"];
    catId = element["cat_id"];
    catName = element["cat_name"];
    author = element["author"];
    view = element["view"];
    status = element["status"];
    createdAt = element["created_at"];
  }
}

import 'package:techblog/constant/api_constant.dart';

class PodcastListModel {
  String? id;
  String? title;
  String? poster;
  String? publisher;
  String? view;
  String? status;
  String? createdAt;
  String? isFavorite;

  PodcastListModel({
    required this.id,
    required this.title,
    required this.poster,
    required this.publisher,
    required this.view,
    required this.status,
    required this.createdAt,
    required this.isFavorite,
  });

  PodcastListModel.fromjson(Map<String,dynamic>element){
id=element["id"];
title=element["title"];
poster=ApiConstant.hostDlUrl+ element["poster"];
publisher=element["publisher"];
view=element["view"];
status=element["status"];
createdAt=element["createdAt"];
isFavorite=element["isFavorite"];
  }

}

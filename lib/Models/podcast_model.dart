import '../constant/api_constant.dart';

class PodcastModel {
  String? id;
  String? title;
  String? poster;
  String? catName;
  String? author;
  String? view;
  String? status;
  String? createdAt;

  PodcastModel({
    required this.id,
    required this.title,
    required this.poster,
    required this.catName,
    required this.author,
    required this.view,
    required this.status,
    required this.createdAt,
  });
  PodcastModel.fromJson(Map<String, dynamic> element) {
    id = element["id"];
    title = element["title"];
    poster =ApiUrlConstant.hostDlUrl+ element["poster"];
    catName = element["catName"];
    author = element["author"];
    view = element["view"];
    status = element["status"];
    createdAt = element["createdAt"];
  }
}

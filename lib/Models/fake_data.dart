import 'package:techblog/gen/assets.gen.dart';
import 'data_models.dart';

Map homePagePosterMap = {
  "image": Assets.images.mainpic.path,
  "writer": "ملیکا عزیزی",
  "date": "یک روز پیش",
  "title": "دوازده قدم برنامه نویسی یک دوره",
  "view": "251"
};

// blog fake data
List<HashTagModel> tagList = [
  HashTagModel(title: "جاوا",),
  HashTagModel(title: "کاتلین", ),
  HashTagModel(title: "وب",),
  HashTagModel(title: "هوش مصنوعی",),
  HashTagModel(title: " iot", ),
  HashTagModel(title: "دارت", ),
];



List<HashTagModel> selectedTags=[];
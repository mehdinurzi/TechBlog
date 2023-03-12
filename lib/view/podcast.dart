import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:techblog/component/my_component.dart';
import 'package:techblog/constant/my_string.dart';
import 'package:techblog/controller/podcast_controller.dart';

import '../gen/assets.gen.dart';

// ignore: must_be_immutable
class Podcast extends StatelessWidget {

PodcastController podcastController=Get.put(PodcastController());

  Podcast({super.key});
  @override
  Widget build(BuildContext context) {
    var textTheme = Theme.of(context).textTheme;
    var size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: appBar( MyStrings.podcastlist),
      body: Obx(
        ()=> ListView.builder(
            itemCount: podcastController.podcastList.length,
            itemBuilder: (context, index) {
              return InkWell(
                onTap: () {},
                child: Padding(
                  padding:  EdgeInsets.fromLTRB(
                      size.width / 22, size.width / 17, size.width / 22, 0),
                  child: SizedBox(
                    height: size.height / 7.73,
                    width: size.width,
                    // color: Colors.amber,
                    child: Row(children: [
                     CachedNetworkImage(
                              imageUrl:podcastController.podcastList[index].poster!,
                              placeholder: ((context, url) => const Loading()),
                              errorWidget: ((context, url, error) => Image(image: Image.asset(Assets.images.singlePlaceHolder.path,fit: BoxFit.fill,).image)),
                              imageBuilder: ((context, imageProvider) {
                                return Container(
                                  height: size.height / 7.73,
                                  width: size.width / 3.9,
                                  decoration: BoxDecoration(
                                      borderRadius: const BorderRadius.all(
                                          Radius.circular(20)),
                                      image: DecorationImage(
                                          image: imageProvider,
                                          fit: BoxFit.cover)),
                                );
                              })),
                     Padding(
                       padding:  EdgeInsets.only(right: size.width / 32),
                       child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                        Text(podcastController.podcastList[index].title!  , style: textTheme.displayMedium),
                        SizedBox(height: size.height/350,),
                        Text(podcastController.podcastList[index].author!,  style: textTheme.displaySmall),
                       ],),
                     )
                    
                    ],),
                  ),
                ),
              );
            }),
      ),
    );
  }
}

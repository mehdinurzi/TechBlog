import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:techblog/component/text_style.dart';
import 'package:url_launcher/url_launcher.dart';
import '../constant/my_colors.dart';
import '../controller/home_screen_controller.dart';
import '../gen/assets.gen.dart';


class TechDivider extends StatelessWidget {
  const TechDivider({
    Key? key,
  }) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Divider(
      color: SolidColors.dividerColor,
      indent: Get.width / 4.76,
      endIndent: Get.width / 4.76,
      thickness: 1,
    );
  }
}

mylunchUrl(String url) async {
  if (await canLaunchUrl(Uri.parse(url))) {
    await launchUrl(Uri.parse(url));
  } else {
    log("can not launch $url");
  }
}

class Loading extends StatelessWidget {
  const Loading({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Align(
      alignment: Alignment.centerLeft,
      child: SpinKitFadingCube(
        color: SolidColors.primeryColor,
        size: 32,
      ),
    );
  }
}

class MainTags extends StatelessWidget {
  const MainTags({
    super.key,
    required this.textTheme,
    required this.index,
  });

  final TextTheme textTheme;
  // ignore: prefer_typing_uninitialized_variables
  final index;
  @override
  Widget build(BuildContext context) {
    return Container(
        height: Get.height / 22.83,
        decoration: const BoxDecoration(
            gradient: LinearGradient(
                colors: GradiantColor.tags,
                begin: Alignment.centerRight,
                end: Alignment.centerLeft),
            borderRadius: BorderRadius.all(Radius.circular(24))),
        child: Padding(
          padding: EdgeInsets.fromLTRB(Get.width / 20, 0, Get.width / 32, 0),
          child: Row(
            children: [
              //safari used ImageIcon class instead of icon
              ImageIcon(Image.asset(Assets.icons.hashtag.path).image,
                  size: 13, color: Colors.white),
              // const Icon(
              //   Icons.tag,
              //   color: Colors.white,
              //   size: 20,
              // ),
              const SizedBox(
                width: 20,
              ),
              Text(
                Get.find<HomeScreenController>().tagList[index].title!,
                style: textTheme.bodyMedium,
              )
            ],
          ),
        ));
  }
}

PreferredSize appBar(String text) {
  return PreferredSize(
    preferredSize: const Size.fromHeight(60),
    child: Padding(
      padding: EdgeInsets.only(left: Get.width / 14, right: Get.width / 25),
      child: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: [
          Center(
              child: Text(
            text,
            style: appBarTextStyle,
          )),
        ],
        leading: InkWell(
          splashColor: Colors.transparent,
          highlightColor: Colors.transparent,
          hoverColor: Colors.transparent,
          onTap: () {
            Get.back();
          },
          child: Container(
            height: Get.height / 7.5,
            width: Get.width / 7.5,
            decoration: const BoxDecoration(
                shape: BoxShape.circle, color: SolidColors.backward),
            child: const Icon(
              Icons.keyboard_arrow_right_rounded,
              size: 30,
            ),
          ),
        ),

        // title: Padding(
        //   padding:  EdgeInsets.only(left:size.width/32 ,right:size.width/110  ),
        //   child: Row(
        //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //     children: [
        //       InkWell(
        //         onTap: () {
        //         },
        //         child: Container(
        //           height: size.height / 7.5,
        //           width: size.width / 7.5,
        //           decoration: const BoxDecoration(
        //               shape: BoxShape.circle, color: SolidColors.backward),
        //           child: const Icon(
        //             Icons.keyboard_arrow_right_rounded,
        //             size: 30,
        //           ),
        //         ),
        //       ),
        //       Text(
        //         text,
        //         style: textTheme.titleLarge,
        //       ),
        //     ],
        //   ),
        // ),
      ),
    ),
  );
}



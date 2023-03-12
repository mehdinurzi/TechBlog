import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:techblog/Models/fake_data.dart';
import 'package:techblog/gen/assets.gen.dart';
import '../constant/my_colors.dart';
import '../constant/my_string.dart';
import '../main.dart';

class MyCats extends StatefulWidget {
  const MyCats({super.key});

  @override
  State<MyCats> createState() => _MyCatsState();
}

class _MyCatsState extends State<MyCats> {
  @override
  Widget build(BuildContext context) {
    //  var selectedindex;
    //  dastebandiList2.add(selectedindex);
    //  print(dastebandiList2);

    var size = MediaQuery.of(context).size;
    var textTheme = Theme.of(context).textTheme;
    return SafeArea(
        child: Scaffold(
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Center(
          child: Column(
            children: [
              // happybot
              Padding(
                padding: EdgeInsets.only(top: size.height / 16),
                child: SvgPicture.asset(
                  Assets.images.happyBot.path,
                  height: size.height / 6.2,
                ),
              ),
              SizedBox(
                height: size.height / 50,
              ),
              // congrajulation Text
              RichText(
                text: TextSpan(
                    text: MyStrings.gongrajulation, style: textTheme.bodyLarge),
                textAlign: TextAlign.center,
              ),
              // TextField
              Padding(
                padding: EdgeInsets.fromLTRB(size.width / 7, size.height / 30,
                    size.width / 7, size.height / 25),
                child: TextField(
                  style: textTheme.titleMedium,
                  decoration: InputDecoration(
                    hintText: "نام و نام خانوادگی",
                    hintStyle: textTheme.bodySmall,
                  ),
                ),
              ),
              Text(
                MyStrings.dastebandi,
                style: textTheme.bodyLarge,
              ),
              SizedBox(
                height: size.height / 35,
              ),
              // defultTaglist
              SizedBox(
                width: double.infinity,
                height: size.height / 8,
                child: GridView.builder(
                    physics: const ClampingScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    shrinkWrap: true,
                    itemCount: tagList.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisSpacing: 10,
                        mainAxisSpacing: 20,
                        crossAxisCount: 2,
                        childAspectRatio: size.width / 1100),
                    itemBuilder: (context, index) {
                      return InkWell(
                        splashColor: Colors.black26,
                        onTap: () {
                          if (!selectedTags.contains(tagList[index])) {
                            setState(() {
                              selectedTags.add(tagList[index]);
                            });
                          }
                        },
                        child: Container(
                            decoration: const BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(24)),
                                gradient: LinearGradient(
                                    colors: GradiantColor.tags,
                                    begin: Alignment.centerRight,
                                    end: Alignment.centerLeft)),
                            child: Padding(
                              padding:
                                  EdgeInsets.fromLTRB(0, 0, size.width / 32, 0),
                              child: Row(
                                children: [
                                  ImageIcon(
                                    Image.asset(Assets.icons.hashtag.path)
                                        .image,
                                    color: Colors.white,
                                    size: size.height / 60,
                                  ),
                                  SizedBox(
                                    width: size.width / 20,
                                  ),
                                  Text(
                                    tagList[index].title,
                                    style: textTheme.bodyMedium,
                                  ),
                                ],
                              ),
                            )),
                      );
                    }),
              ),
              SizedBox(
                height: size.height / 50,
              ),
              Image.asset(
                Assets.icons.downCatArrow.path,
                scale: 3,
              ),
              SizedBox(
                height: size.height / 35,
              ),
              // selectedTagList
              SizedBox(
                width: double.infinity,
                height: size.height / 8,
                child: GridView.builder(
                    physics: const ClampingScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    shrinkWrap: true,
                    itemCount: selectedTags.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisSpacing: 10,
                        mainAxisSpacing: 20,
                        crossAxisCount: 2,
                        childAspectRatio: size.width / 1350),
                    itemBuilder: (context, index) {
                      return Container(
                        decoration: const BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(50)),
                            color: Color.fromARGB(255, 242, 242, 242)),
                        child: Padding(
                          padding: EdgeInsets.fromLTRB(
                              size.width / 25, 0, size.width / 20, 0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                selectedTags[index].title,
                                style: textTheme.titleMedium,
                              ),
                              InkWell(
                                  onTap: () {
                                    setState(() {
                                      selectedTags.removeAt(index);
                                    });
                                  },
                                  child: const Icon(
                                    CupertinoIcons.delete,
                                    size: 20,
                                  ))
                            ],
                          ),
                        ),
                      );
                    }),
              ),
              SizedBox(
                height: size.height / 30,
              ),
              // bottom
              SizedBox(
                  width: size.width / 2.54,
                  height: size.height / 15.46,
                  child: ElevatedButton(
                      onPressed: () {
                        Get.offAndToNamed(NamedRoute.routeMainPage);
                      }, child: const Text("ادامه"))),
            ],
          ),
        ),
      ),
    ));
  }
}

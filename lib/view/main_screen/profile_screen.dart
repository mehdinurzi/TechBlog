import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../constant/my_colors.dart';
import '../../component/my_component.dart';
import '../../constant/my_string.dart';
import '../../gen/assets.gen.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({
    Key? key,

    required this.textTheme,
  }) : super(key: key);

  final TextTheme textTheme;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 30),
              child: Image.asset(
                Assets.images.profileAvatar.path,
                height: Get.height / 7.19,
                width: Get.width / 3.76,
              ),
            ),
            TextButton.icon(
                onPressed: () {},
                icon: ImageIcon(
                  Image.asset(Assets.icons.pencil.path).image,
                  color: SolidColors.colorTitle,
                  size: Get.height / 37.77,
                ),
                label: Text(
                  MyStrings.imageProfileEdit,
                  style: textTheme.labelMedium,
                )),
            const SizedBox(
              height: 50,
            ),
            Text(
              "فاطمه امیری",
              style: textTheme.titleLarge,
            ),
            const SizedBox(
              height: 8,
            ),
            Text(
              "fatemeamiri@gmail.com",
              style: textTheme.titleLarge,
            ),
            const SizedBox(
              height: 40,
            ),
            const TechDivider(),      
            Material(
              child: InkWell(
                  onTap: () {},
                  splashColor: SolidColors.primeryColor,
                  child: SizedBox(
                    height: Get.height / 18,
                    width:double.infinity,
                    child: Center(
                      child: Text(
                        MyStrings.favoriteArticle,
                        style: textTheme.titleMedium,
                      ),
                    ),
                  ),
                  ),
            ),          
            const TechDivider(),
            Material(
              child: InkWell(
                  onTap: () {},
                  splashColor: SolidColors.primeryColor,
                  child: SizedBox(
                    width:double.infinity,
                    height: Get.height / 18,
                    child: Center(
                      child: Text(
                        MyStrings.favoritePodcast,
                        style: textTheme.titleMedium,
                      ),
                    ),
                  ),
                  ),
            ),
            const TechDivider(),
            Material(
              child: InkWell(
                  onTap: () {},
                  splashColor: SolidColors.primeryColor,
                  child: SizedBox(
                    height: Get.height / 18,
                     width:double.infinity,
                    child: Center(
                      child: Text(
                        MyStrings.logOut,
                        style: textTheme.titleMedium,
                      ),
                    ),
                  )),
            ),
          ],
        ));
  }
}


import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:techblog/component/dimens.dart';
import 'package:techblog/component/my_component.dart';
import 'package:techblog/constant/my_string.dart';
import 'package:techblog/controller/register_controller.dart';
import 'package:techblog/gen/assets.gen.dart';
import 'package:techblog/view/main_screen/profile_screen.dart';
import 'package:share_plus/share_plus.dart';
import '../../constant/my_colors.dart';
import 'home_screen.dart';

final GlobalKey<ScaffoldState> _key = GlobalKey();

class MainScreen extends StatelessWidget {
  final RxInt _selectedPageIndex = 0.obs;

  MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var textTheme = Theme.of(context).textTheme;

    return SafeArea(
        child: Scaffold(
      key: _key,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: SolidColors.scaffoledBg,
        elevation: 0,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            InkWell(
              onTap: () {
                _key.currentState!.openDrawer();
              },
              child: Icon(
                Icons.menu,
                size: Get.height / 40.916,
                color: Colors.black,
              ),
            ),
            Image.asset(
              Assets.images.logo.path,
              height: Get.height / 13.638,
            ),
            Icon(
              Icons.search_sharp,
              size: Get.height / 31.67,
              color: Colors.black,
            )
          ],
        ),
      ),
      drawer: Drawer(
        backgroundColor: SolidColors.scaffoledBg,
        child: Padding(
          padding: EdgeInsets.only(left:Dimens.bodyMargin , right: Dimens.bodyMargin),
          child: ListView(
            children: [
              DrawerHeader(
                  child: Image(
                      image: Image.asset(
                Assets.images.logo.path,
                scale: 3,
              ).image)),
              ListTile(
                onTap: () {},
                title: Text(
                  "پروفایل کاربری",
                  style: textTheme.titleMedium,
                ),
              ),
              const Divider(
                color: SolidColors.dividerColor,
              ),
              ListTile(
                onTap: () {},
                title: Text(
                  "درباره تک‌بلاگ",
                  style: textTheme.titleMedium,
                ),
              ),
              const Divider(
                color: SolidColors.dividerColor,
              ),
              ListTile(
                onTap: () {
                  Share.share(MyStrings.sharetext);
                },
                title: Text(
                  "اشتراک گذاری تک بلاگ",
                  style: textTheme.titleMedium,
                ),
              ),
              const Divider(
                color: SolidColors.dividerColor,
              ),
              ListTile(
                onTap: () {
                  mylunchUrl(MyStrings.techbloggithuburl);
                },
                title: Text(
                  "تک‌بلاگ در گیت هاب",
                  style: textTheme.titleMedium,
                ),
              ),
            ],
          ),
        ),
      ),
      body: Stack(children: [
        Positioned.fill(child: Obx(() {
          return IndexedStack(
            index: _selectedPageIndex.value,
            children: [
              HomeScreen(
                   textTheme: textTheme, ),
              ProfileScreen(
                   textTheme: textTheme)
            ],
          );
        })),
        BottomNavigationBar(
            
            changeScreen: (int value) {
              _selectedPageIndex.value = value;
            }),
      ]),
    ));
  }
}

// ignore: must_be_immutable
class BottomNavigationBar extends StatelessWidget {
    const BottomNavigationBar({
    Key? key,

    required this.changeScreen,
  }) : super(key: key);


  final Function(int) changeScreen;


  // RegisterController registerController=Get.put(RegisterController());

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: 0,
      bottom: 0,
      right: 0,
      child: Container(
        height: Get.height / 12,
        decoration: const BoxDecoration(
            gradient: LinearGradient(
                colors: GradiantColor.bottemNvbBackground,
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter)),
        child: Padding(
          padding: EdgeInsets.only(
              right: Get.width/7.4, left: Get.width/7.4, bottom: Get.height / 110),
          child: Container(
            height: Get.height / 12.3,
            decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(30)),
                gradient: LinearGradient(colors: GradiantColor.bottemNvb)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                IconButton(
                  onPressed: () {
                    changeScreen(0);
                  },
                  icon: ImageIcon(Image.asset(Assets.icons.home.path).image),
                  color: Colors.white,
                ),
                IconButton(
                    onPressed: () {
                     Get.find<RegisterController>().toggleLogin(context);
                    },
                    icon: ImageIcon(Image.asset(Assets.icons.write.path).image),
                    color: Colors.white),
                IconButton(
                    onPressed: () {
                      changeScreen(1);
                    },
                    icon: ImageIcon(Image.asset(Assets.icons.user.path).image),
                    color: Colors.white),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

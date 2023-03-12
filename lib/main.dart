import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:techblog/view/article/article_list_screen.dart';
import 'package:techblog/view/article/manage_article.dart';
import 'package:techblog/view/article/single_article_page.dart';
import 'package:techblog/view/binding.dart';
import 'package:techblog/view/main_screen/main_screen.dart';
import 'package:techblog/view/my_http_override.dart';
import 'package:techblog/view/splash_screen.dart';
import 'package:techblog/view/article/single_manage_article.dart';
import 'constant/my_colors.dart';
import 'constant/my_string.dart';

void main() async {
  HttpOverrides.global = MyHttpOverrides();
// simple kind
// SystemChrome.setSystemUIOverlayStyle( SystemUiOverlayStyle.dark);
// profesion kind
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: SolidColors.statusBarColor,
    statusBarIconBrightness: Brightness.dark,
    systemNavigationBarColor: SolidColors.systemNavigationBarColor,
    systemNavigationBarIconBrightness: Brightness.dark,
  ));
  await GetStorage.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        locale: const Locale('fa'),
        debugShowCheckedModeBanner: false,
        theme: lightTheme(),
        getPages: [
          GetPage(
              name: NamedRoute.routeMainPage,
              page: () => MainScreen(),
              binding: RegisterBinding()),
          GetPage(
              name: NamedRoute.routeSingleArticlePage,
              page: () => SingleArticle(),
              binding: ArticleBinding()),
          GetPage(
              name: NamedRoute.routeManageArticlePage,
              page: () =>  ManageArticle(),
              binding: ManageArticleBinding()),
          GetPage(
              name: NamedRoute.routeArticleListPage,
              page: () => ArticleListScreen(
                    title: MyStrings.articlelist,
                  ),
              binding: ArticleBinding()),
          GetPage(
              name:NamedRoute.routeSingleManageArticle,
              page: () =>  SingleManageArticle(),
              binding: ManageArticleBinding()),
        ],
        home: const SplashScreen());
  }

  ThemeData lightTheme() {
    return ThemeData(
        inputDecorationTheme: const InputDecorationTheme(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(15)),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(15)),
          ),
          filled: true,
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ButtonStyle(
              //     textStyle: MaterialStateProperty.resolveWith((states) {
              //   if (states.contains(MaterialState.pressed)) {
              //     return textTheme.headline1;
              //   } else {
              //     return textTheme.bodyText1;
              //   }
              // }),
              backgroundColor: MaterialStateProperty.resolveWith((states) {
            if (states.contains(MaterialState.pressed)) {
              return Colors.blue;
            } else {
              return SolidColors.primeryColor;
            }
          })),
        ),
        fontFamily: "dana",
        textTheme: const TextTheme(
          titleSmall: TextStyle(
              fontFamily: "dana",
              fontSize: 18,
              fontWeight: FontWeight.w700,
              color: SolidColors.postertext),
          displayLarge: TextStyle(
              fontFamily: "dana",
              fontSize: 13,
              fontWeight: FontWeight.w700,
              color: SolidColors.postertextname),
          bodyMedium: TextStyle(
              fontFamily: "dana",
              fontSize: 13,
              fontWeight: FontWeight.w300,
              color: Colors.white),
          bodySmall: TextStyle(
              fontFamily: "dana",
              fontSize: 12,
              fontWeight: FontWeight.w300,
              color: SolidColors.hintText),
          headlineMedium: TextStyle(
              fontFamily: "dana",
              fontSize: 14,
              fontWeight: FontWeight.w700,
              color: SolidColors.registerTextColor),
          displaySmall: TextStyle(
              fontFamily: "dana",
              fontSize: 12,
              fontWeight: FontWeight.w700,
              color: SolidColors.registerTextColor),
          displayMedium: TextStyle(
              fontFamily: "dana",
              fontSize: 12,
              fontWeight: FontWeight.w700,
              color: Colors.black),
          labelMedium: TextStyle(
              fontFamily: "dana",
              fontSize: 14,
              fontWeight: FontWeight.w700,
              color: SolidColors.colorTitle),
          headlineSmall: TextStyle(
              fontFamily: "dana",
              fontSize: 12,
              fontWeight: FontWeight.w700,
              color: SolidColors.catcolor),
          titleLarge: TextStyle(
              fontFamily: "dana",
              fontSize: 16,
              fontWeight: FontWeight.w700,
              color: SolidColors.headline),
          titleMedium: TextStyle(
              fontFamily: "dana",
              fontSize: 14,
              fontWeight: FontWeight.w700,
              color: SolidColors.profileMenu),
          headlineLarge: TextStyle(
              fontFamily: "dana",
              fontSize: 14,
              fontWeight: FontWeight.w300,
              color: SolidColors.profileMenu),
          bodyLarge: TextStyle(
              fontFamily: "dana",
              fontSize: 14,
              fontWeight: FontWeight.w700,
              color: SolidColors.headline),
          labelLarge: TextStyle(
              fontFamily: "dana",
              fontSize: 18,
              fontWeight: FontWeight.w700,
              color: Colors.black),
        ));
  }
}

class NamedRoute {
  static String routeMainPage = "/MainPage";
  static String routeSingleArticlePage = "/SingleArticlePage";
  static String routeArticleListPage = "/ArticleListPage";
  static String routeManageArticlePage = "/ManageArticlePage";
  static String routeSingleManageArticle = "/SingleManageArticle";
}

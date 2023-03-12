import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:techblog/gen/assets.gen.dart';
import '../constant/my_colors.dart';
import '../main.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    Future.delayed(const Duration(seconds: 3)).then((value) {
      Get.offAndToNamed(NamedRoute.routeMainPage);
      //  Navigator.pushReplacement(context,MaterialPageRoute(builder: (context)=> MainScreen()));
    });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                Assets.images.logo.path,
                width: size.width / 2.5,
                height: size.height / 4,
              ),
              SpinKitFadingCube(
                color: SolidColors.primeryColor,
                size: MediaQuery.of(context).size.height/14,
              ),
              // other kind of loadind
              // const SpinKitRotatingCircle(color:SolidColors.primeryColor,size: 50.0,)
            ],
          ),
        ),
      ),
    );
  }
}
// String RouteMainPage="/MainScreen";
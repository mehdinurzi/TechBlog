import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:techblog/controller/register_controller.dart';
import 'package:techblog/gen/assets.gen.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:validators/validators.dart';
import '../../constant/my_string.dart';

// ignore: must_be_immutable
class RegisterScreen extends StatelessWidget {
   RegisterScreen({super.key});
  RegisterController registerController=Get.put(RegisterController());
  @override
  Widget build(BuildContext context) {
    var textTheme = Theme.of(context).textTheme;
    var size = MediaQuery.of(context).size;

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: size.height / 5,
              ),
              SvgPicture.asset(
                Assets.images.happyBot.path,
                height: size.height / 6.2,
              ),
              SizedBox(
                height: size.height / 40,
              ),
              RichText(
                text: TextSpan(
                  text: MyStrings.welcom,
                  style: textTheme.headlineMedium,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: size.height / 8,
              ),
              SizedBox(
                width: size.width / 2.54,
                height: size.height / 15.46,
                child: ElevatedButton(
                  onPressed: () {
                    _showEmailBottomSheet(context, size, textTheme);
                  },
                  style: Theme.of(context).elevatedButtonTheme.style,
                  child: const Text("بزن بریم"),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  void _showEmailBottomSheet(
      BuildContext context, Size size, TextTheme textTheme) {
    showModalBottomSheet(
        isScrollControlled: true,
        context: context,
        backgroundColor: Colors.transparent,
        builder: (context) {
          return Padding(
            padding: EdgeInsets.only(
                bottom: MediaQuery.of(context).viewInsets.bottom),
            child: Container( 
              height: size.height / 2.57,
              decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30))),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    MyStrings.insertYourEmail,
                    style: textTheme.headlineMedium,
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(size.width / 5.7,
                        size.height / 52, size.width / 5.7, size.height / 15),
                    child: TextField(
                      controller: registerController.emailTextEditing,
                      // onChanged: (value) {
                      //  isEmail(value) ;
                      // },
                      textDirection: TextDirection.ltr,
                      style: textTheme.titleMedium,
                      textAlign: TextAlign.center,
                      decoration: InputDecoration(
                        hintText: "techblog@gmail.com",
                        hintStyle: textTheme.bodySmall,
                      ),
                    ),
                  ),
                  SizedBox(
                      width: size.width / 2.54,
                      height: size.height / 15.46,
                      child: ElevatedButton(
                          onPressed: () {
                            registerController.register();
                              Navigator.pop(context);
                              if(isEmail(registerController.emailTextEditing.text)){
                                _activateCodeBottomSheet(
                                  context, size, textTheme);
                              }else{
                                Get.snackbar("خطا", "لطفا ایمیل را به درستی وارد کنید");

                              }
                              
                            
                          },
                          child: const Text("ادامه"))),
                ],
              ),
            ),
          );
        });
  }



  void _activateCodeBottomSheet(
      BuildContext context, Size size, TextTheme textTheme) {
    showModalBottomSheet(
        isScrollControlled: true,
        context: context,
        backgroundColor: Colors.transparent,
        builder: (context) {
          return Padding(
            padding: EdgeInsets.only(
                bottom: MediaQuery.of(context).viewInsets.bottom),
            child: Container(
              height: size.height / 2.57,
              decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30))),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    MyStrings.activateCodeBottomSheet,
                    style: textTheme.headlineMedium,
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(size.width / 5.7,
                        size.height / 52, size.width / 5.7, size.height / 15),
                    child: TextField(
                      controller: registerController.activateCode,

                      style: textTheme.titleMedium,
                      textDirection: TextDirection.ltr,
                      textAlign: TextAlign.center,
                      decoration: InputDecoration(
                        hintText: "******",
                        hintStyle: textTheme.bodySmall,
                      ),
                    ),
                  ),
                  SizedBox(
                      width: size.width / 2.54,
                      height: size.height / 15.46,
                      child: ElevatedButton(
                          onPressed: () {

                            registerController.verify(context);
                            Navigator.pop(context);
                            



                          }, child: const Text("ادامه"))),
                ],
              ),
            ),
          );
        });
  }
}

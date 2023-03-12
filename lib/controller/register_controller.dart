import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:techblog/constant/api_constant.dart';
import 'package:techblog/constant/storage_const.dart';
import 'package:techblog/gen/assets.gen.dart';
import 'package:techblog/services/dio_service.dart';
import 'package:techblog/view/my_cats.dart';
import '../main.dart';
import '../view/register/register_screen.dart';

class RegisterController extends GetxController {
  TextEditingController emailTextEditing = TextEditingController();
  TextEditingController activateCode = TextEditingController();
  var email = '';
  var userId = '';
  // چون یوزر ایدی رو از این میخوند که اشتباهه و باید از استورح کانست بخونه
  

  register() async {
    Map<String, dynamic> map = {
      'email': emailTextEditing.text,
      'command': 'register'
    };
    var response = await DioService().postMethod(map, ApiConstant.postRegister);
            // debugPrint(GetStorage().read(StorageKey.userId));

    
     email = emailTextEditing.text;
   userId = response.data['user_id'];
  }

  verify(BuildContext context) async {
    Map<String, dynamic> map = {
      'email': email,
      'command': 'verify',
      'code': activateCode.text,
      'user_id': userId
    };

    var response = await DioService().postMethod(map, ApiConstant.postRegister);
    debugPrint(response.data.toString()); 

    // if (response.data['response'] == 'verified') {
    //   var box = GetStorage();
    //   box.write(token, response.data['token']);
    //   box.write(userId, response.data['user_id']);
    //   //  Print('read==='+box.read(token));
    //   // print('read==='+box.read(userId));
    //   Get.to(const MyCats());
    // } else {
    //   Get.snackbar("خطا", "کد وارد شده نادرست است");
    // }
    var status = response.data['response'];
    switch (status) {
      case 'verified':
        var box = GetStorage();
        box.write(StorageKey.token, response.data['token']);
        box.write(StorageKey.userId, response.data['user_id']);
        debugPrint(response.data['user_id']);

        Get.to(const MyCats());
        break;
      case 'incorrect_code':
        Get.snackbar("خطا", "کد وارد شده نادرست است");
        break;
      case 'expired':
        Get.snackbar("خطا", "کد وارد شده منقضی شده است");
        break;
    }
  }

  toggleLogin(BuildContext context) {

    if (GetStorage().read(StorageKey.token) == null) {
      Get.to(RegisterScreen());
    } else {
routeToWriteBottomSheet(context);
        debugPrint(GetStorage().read(StorageKey.userId));

      // Get.to(RegisterScreen());

//       showModalBottomSheet(
//         backgroundColor: Colors.transparent,
//         context: context, 
//       builder: (context){
// return Container(
//   height: size.height/3.278,
//   decoration: const BoxDecoration(
//     color: Colors.white,
//     borderRadius: BorderRadius.only(topLeft:Radius.circular(30) ,topRight: Radius.circular(30))
//   ),
//   child: Padding(
//     padding:  EdgeInsets.all(size.width/20),
//     child: Column(
//       children: [
//         Row(
//           children: [
//             SvgPicture.asset(Assets.images.happyBot.path,height: size.height/20,),
//              Padding(
//                padding:  EdgeInsets.only(top:size.height/60,right: size.height/40),
//                child: Text('دونسته هات رو با بقیه به اشتراک بذار ...',style: textTheme.titleMedium,),
//              )
//           ],
//         ),
//          SizedBox(height:  size.height/40,),
//         Text("""فکر کن !!  اینجا بودنت به این معناست که یک گیک تکنولوژی هستی
// دونسته هات رو با  جامعه‌ی گیک های فارسی زبان به اشتراک بذار..""",style: textTheme.displaySmall,),
// SizedBox(height:  size.height/20,),
// Row(
//   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//   children: [
//     TextButton.icon(onPressed: (){Get.toNamed(routeNewArticlePage);}, icon: Image.asset(Assets.icons.writeArticleIcon.path,height: size.height/25,), label:  Text("مدیریت مقاله ها",style: textTheme.headlineLarge)),
//   TextButton.icon(onPressed: (){}, icon: Image.asset(Assets.icons.writeMicrophone.path,height: size.height/25,), label:  Text("مدیریت پادکست ها",style: textTheme.headlineLarge,)),
// ],)
//       ],
//     ),
//   ),
// );
//       });
      debugPrint("already login");
      
    }
  }
}  
 
routeToWriteBottomSheet(BuildContext context){
      var textTheme = Theme.of(context).textTheme;

   Get.bottomSheet(
       Container(
  height: Get.height/3.278,
  decoration: const BoxDecoration(
    color: Colors.white,
    borderRadius: BorderRadius.only(topLeft:Radius.circular(30) ,topRight: Radius.circular(30))
  ),
  child: Padding(
    padding:  EdgeInsets.all(Get.width/20),
    child: Column(
      children: [
        Row(
          children: [
            SvgPicture.asset(Assets.images.happyBot.path,height: Get.height/20,),
             Padding(
               padding:  EdgeInsets.only(top:Get.height/60,right: Get.height/40),
               child: Text('دونسته هات رو با بقیه به اشتراک بذار ...',style: textTheme.titleMedium,),
             )
          ],
        ),
         SizedBox(height:  Get.height/40,),
        Text("""فکر کن !!  اینجا بودنت به این معناست که یک گیک تکنولوژی هستی
دونسته هات رو با  جامعه‌ی گیک های فارسی زبان به اشتراک بذار..""",style: textTheme.displaySmall,),
SizedBox(height:  Get.height/20,),
Row(
  mainAxisAlignment: MainAxisAlignment.spaceBetween,
  children: [
    TextButton.icon(onPressed: (){
      navigator?.pop(context);
      Get.toNamed(NamedRoute.routeManageArticlePage);}, icon: Image.asset(Assets.icons.writeArticleIcon.path,height: Get.height/25,), label:  Text("مدیریت مقاله ها",style: textTheme.headlineLarge)),
  TextButton.icon(onPressed: (){}, icon: Image.asset(Assets.icons.writeMicrophone.path,height: Get.height/25,), label:  Text("مدیریت پادکست ها",style: textTheme.headlineLarge,)),
],)
      ],
    ),
  ),
)
      );
}
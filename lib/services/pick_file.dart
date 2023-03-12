import 'package:file_picker/file_picker.dart';
import 'package:get/get.dart';
import 'package:techblog/controller/file_controller.dart';


FilePickerControler filePickerController=Get.put(FilePickerControler());
// ignore: non_constant_identifier_names
Future PickFile() async{

FilePickerResult? result=await FilePicker.platform.pickFiles(type:FileType.image);

filePickerController.file.value=result!.files.first;
  return filePickerController.file.value;

}

 

  



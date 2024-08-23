import 'dart:io';

import 'package:complete_firebase/constant/colorclass.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:image_picker/image_picker.dart';

class ImageStorageController extends GetxController{
  Rx<File?> image = Rx<File?>(null);
  //RxString image =''.obs;
  final picker = ImagePicker();
  XFile? pickFile;

  void galleryCameraFun(){
    Get.bottomSheet(
      backgroundColor: MyColors.camel,
        Container(
          height: 100,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                icon: Icon(Icons.image,size: 50,),
                onPressed: () {
                  galleryImage();
                  Get.back();
                },
              ),
              SizedBox(width: 60,),
              IconButton(
                icon: Icon(Icons.camera_alt,size: 50,),
                onPressed: () {
                  cameraImage();
                  Get.back();
                },
              ),
            ],
          ),
        ));

    }

  Future galleryImage() async{
    try{
      pickFile = await picker.pickImage(source: ImageSource.gallery,imageQuality: 90);
      if(pickFile!=null){
        image.value=File(pickFile!.path);
      }
    }catch(e){
      Get.snackbar('Error', 'issue to take image from gallery', snackPosition: SnackPosition.TOP);
    }

  }

  Future cameraImage() async{
    try{
      final pickFile = await picker.pickImage(source: ImageSource.camera,imageQuality: 90);
      if(pickFile!=null){
        image.value=File(pickFile.path);
      }
    }catch(e){
      Get.snackbar('Error', 'issue to take image from camera', snackPosition: SnackPosition.TOP);
    }

  }
}
import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:complete_firebase/Controller/FireBaseControler/CRUDoperation/image_storage_controller.dart';
import 'package:complete_firebase/Controller/loader_controller.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class UploadImageSaveUrlStorageController extends GetxController{

  final LoaderController loader=Get.put(LoaderController());
  final ImageStorageController controllerImage = Get.put(ImageStorageController());
  final TextEditingController brand =TextEditingController();
  final TextEditingController price =TextEditingController();

  FirebaseStorage storage = FirebaseStorage.instance;



  final fireStoreUserInfo=FirebaseFirestore
                          .instance.collection("Shoes")
                          .doc("2345").collection("nike");

  Future<void> UploadItemFireStorage()async{
        loader.loaderFunction();
  try{
    XFile? imageFile = controllerImage.pickFile;

    if (imageFile != null && brand.value != null && price.value != null) {
      // Create a reference to the location you want to upload the file to
      final id = DateTime.now().millisecondsSinceEpoch;
      final ref = storage.ref().child('shoes/nike/$id');

      // Upload the file
      await ref.putFile(File(imageFile.path));
      // Get the download URL
      String downloadURL = await ref.getDownloadURL();

      await fireStoreUserInfo.doc("123").set({
        "ShoesPikUrl":downloadURL.toString(),
        "brand":brand.value,
        "price":price.value
      });
      Get.snackbar('post upload', 'post is successfully uploaded', snackPosition: SnackPosition.TOP);
    }
    else{
      Get.snackbar('Error', 'enter complete information', snackPosition: SnackPosition.TOP);
    }

  }catch(e){
    Get.snackbar('Error', 'please stable your Internet', snackPosition: SnackPosition.TOP);
  }
        loader.loaderFunction();
  }
}

// fireStoreUserInfo.doc(currentUsers!.uid).set({
//         "uid":currentUsers!.uid,
//         "name":currentUsers!.displayName??"Gust",
//         "email":currentUsers!.email??"example@gmail.com",
//         "phonenumber":currentUsers!.phoneNumber??"03000000000",
//         "password":"*********",
//         "profilePhoto":currentUsers!.photoURL??"no now"
//     });
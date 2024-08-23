
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../loader_controller.dart';

class NewsController extends GetxController{
  final LoaderController  loaderController=Get.put(LoaderController());
  final TextEditingController news =TextEditingController();
// ya line ek table create kara ga post ka name sa
  final realtimeDataBaseRef = FirebaseDatabase.instance.ref("post");

  Future newsUpload() async{
    loaderController.loaderFunction();
    try{
      //DateTime.now().microsecondsSinceEpoch.toString()  ya ise unique id da ga
      final id=DateTime.now().microsecondsSinceEpoch.toString();
      realtimeDataBaseRef.child(id).set({
        "id":id,
        "add":news.text.toString()
      }).then((v){
      Get.snackbar('Post', 'your post successfully upload', snackPosition: SnackPosition.TOP);
      });
    }
    catch(e){
      Get.snackbar('Error', 'An error occurred: $e', snackPosition: SnackPosition.BOTTOM);
    }
    loaderController.loaderFunction();
  }

}
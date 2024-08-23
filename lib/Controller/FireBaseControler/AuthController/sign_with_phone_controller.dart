import 'package:complete_firebase/Controller/loader_controller.dart';
import 'package:complete_firebase/Screens/RegistrationScreens/verify_phone_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignWithPhoneController extends GetxController{
  final LoaderController  loaderController =Get.put(LoaderController());

  final phone=TextEditingController();
  final _auth=FirebaseAuth.instance;

  Future phoneController() async{
    try{
        loaderController.loaderFunction();
          await _auth.verifyPhoneNumber
            (
            phoneNumber: phone.text,
            verificationCompleted:   (_){}, 
            verificationFailed: (e){
              Get.snackbar('Error', 'An error occurred: $e', snackPosition: SnackPosition.BOTTOM);
        
            }, 
            codeSent: (String verificationId ,int? tokenId){
               loaderController.loaderFunction();
               Get.to(()=>VerifyPhoneScreen(verificationId:verificationId));
            }, 
            codeAutoRetrievalTimeout: (e){
              Get.snackbar('Error', 'An error occurred: $e', snackPosition: SnackPosition.BOTTOM);
            }
            );
    }catch(e){
      Get.snackbar('Error', 'An error occurred: $e', snackPosition: SnackPosition.BOTTOM);

    }
  loaderController.loaderFunction();
  }
  
}
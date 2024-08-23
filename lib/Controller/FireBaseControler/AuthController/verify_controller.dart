import 'package:complete_firebase/Screens/NavigatorScreens/navigatorscreen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class VerifyController extends GetxController{

  final code=TextEditingController(); 
  final _auth=FirebaseAuth.instance;

  void verifyController({required String verificationId}) async{
            
            
    try{
     final AuthCredential credential = PhoneAuthProvider.credential(
      verificationId: verificationId, 
     smsCode: code.text.toString()
     );

    await _auth.signInWithCredential(credential);
     Get.off(()=>const NavigatorScreen());

    }catch(e){
      Get.snackbar('Error', 'An error occurred: $e', snackPosition: SnackPosition.BOTTOM);

    }

  }
  
}
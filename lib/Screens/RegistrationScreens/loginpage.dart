import 'package:complete_firebase/Controller/FireBaseControler/AuthController/sign_in_controller.dart';
import 'package:complete_firebase/Controller/FireBaseControler/AuthController/sign_in_google.dart';
import 'package:complete_firebase/Controller/loader_controller.dart';
import 'package:complete_firebase/Screens/RegistrationScreens/login_with_phone.dart';
import 'package:complete_firebase/constant/colorclass.dart';
import 'package:complete_firebase/constant/font_weight.dart';
import 'package:complete_firebase/constant/string_constant.dart';
import 'package:complete_firebase/wedgits/container_decoration.dart';
import 'package:complete_firebase/wedgits/textwidget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../wedgits/inputdecorationwidget.dart';


  

class LoginPagState extends StatefulWidget {
  const LoginPagState({super.key});

  @override
  State<LoginPagState> createState() => _LoginPagStateState();
}

class _LoginPagStateState extends State<LoginPagState> {
//signInController ya SignInController class ka object hai
  SignInController signInController=Get.put(SignInController());

 final SignInWithGoogleController googleController = Get.put(SignInWithGoogleController());
 final LoaderController  loaderController=Get.put(LoaderController());



  @override
  Widget build(BuildContext context) {
    final height=MediaQuery.of(context).size.height;
    final width=MediaQuery.of(context).size.width;
    return   SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.only(right: 21,left: 21),
          child:  SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: height*0.07),
                  
                  Center(child:  TextWidget(text:MyText.login, fSize: 28,fWeight: MyFontWeight.extra,),),
                  SizedBox(  height: height*0.025),
                   SizedBox(
                    height: height*0.07,
                     child: TextField(
                      controller: signInController.emailPhone,
                         decoration: inputDecorationWidget(text: MyText.email)
                     ),
                   ),
                   SizedBox(height: height*0.015),
                   SizedBox(
                    height: height*0.07,
                     child: TextField(
                      controller: signInController.password,
                          decoration: inputDecorationWidget(text: MyText.password)
                     ),
                   ),
              SizedBox(  height: height*0.025),
                   SizedBox(
                     height: height*0.07,
                     child: InkWell(
                       onTap: (){
                         signInController.signInControllerButton();
                       },
                    child: Container(
                      decoration: containerDecorationWidget(color: MyColors.verify),
                      child: Center(
                        child: Obx((){
                          return loaderController.loader.value?
                          CircularProgressIndicator(color: MyColors.white,):
                          TextWidget(text: MyText.login, fSize: 17,textColor: MyColors.white,);
                        }),
                      ),
                    ),
                     )
                   ),
               
                  SizedBox(  height: height*0.1),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                     TextWidget(text: MyText.registerwith, fSize: 20,textColor: MyColors.camel,fWeight: MyFontWeight.extra,),
                      SizedBox(  height: height*0.025),
                     
            
                          InkWell(
                            onTap: ()=>googleController.signInWithGoogle(),
                            child: Container(
                              height: height*0.06,
                              padding:const EdgeInsets.all(10),
                              decoration: containerDecorationWidget(color: MyColors.blackTransparent),
                              child: Row(
                                children: [
                                  Image.asset('assect/icons/googleIcon.png'),
                                  SizedBox(  width: width*0.025),
                                  TextWidget(text: MyText.continoueWithGoogle, fSize: 15,fWeight: MyFontWeight.medium,)
                                ],
                              )
                            ),
                          ),
            
                            SizedBox(  height: height*0.015),
                     
            
                          InkWell(
                            onTap: (){Get.to(()=>const LoginWithPhone());},
                            child: Container(
                              height: height*0.06,
                              padding:const EdgeInsets.all(10),
                              decoration: containerDecorationWidget(color: MyColors.blackTransparent),
                              child: Row(
                                children: [
                                  Image.asset('assect/icons/phone-call.png'),
                                  SizedBox(  width: width*0.025),
                                  TextWidget(text: MyText.continoueWithPhone, fSize: 15,fWeight: MyFontWeight.medium,)
                                ],
                              )
                            ),
                          )
            
                      
                    ],
                  ),
              
              
                ],
            
              ),
          ),
          
        ),
      ),
    );
  }
}
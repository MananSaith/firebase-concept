import 'package:complete_firebase/Controller/FireBaseControler/AuthController/sign_with_phone_controller.dart';
import 'package:complete_firebase/Controller/loader_controller.dart';
import 'package:complete_firebase/constant/colorclass.dart';
import 'package:complete_firebase/constant/font_weight.dart';
import 'package:complete_firebase/constant/string_constant.dart';
import 'package:complete_firebase/wedgits/container_decoration.dart';
import 'package:complete_firebase/wedgits/inputdecorationwidget.dart';
import 'package:complete_firebase/wedgits/textwidget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginWithPhone extends StatefulWidget {
 const LoginWithPhone({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _LoginWithPhoneState createState() => _LoginWithPhoneState();
}

class _LoginWithPhoneState extends State<LoginWithPhone> {
  final SignWithPhoneController controller=Get.put(SignWithPhoneController());
  final LoaderController  loaderController=Get.put(LoaderController());
  @override
  Widget build(BuildContext context) {
    final height=MediaQuery.of(context).size.height;
    return   SafeArea(
      child: Scaffold(
       // resizeToAvoidBottomInset: true,
        body: Padding(
          padding: const EdgeInsets.only(right: 21,left: 21),
          child:  SingleChildScrollView(
            child: Column(
                children: [
                  SizedBox(height: height*0.07),
                  
                  Center(child:  TextWidget(text:MyText.phone, fSize: 28,fWeight: MyFontWeight.extra,),),
                  SizedBox(  height: height*0.025),
                   SizedBox(
                    height: height*0.07,
                     child: TextField(
                      keyboardType: TextInputType.phone,
                      controller: controller.phone,
                         decoration: inputDecorationWidget(text: MyText.exampleNumber)
                     ),
                   ),
                   SizedBox(height: height*0.015),
                 
              SizedBox(  height: height*0.025),
                   SizedBox(
                     height: height*0.07,
                     child: InkWell(
                       onTap: (){
                         controller.phoneController();
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
                          
              
                ],
            
              ),
          ),
          
        ),
      ),
    );
  }
}
import 'package:complete_firebase/Controller/FireBaseControler/AuthController/verify_controller.dart';
import 'package:complete_firebase/constant/colorclass.dart';
import 'package:complete_firebase/constant/font_weight.dart';
import 'package:complete_firebase/constant/string_constant.dart';
import 'package:complete_firebase/wedgits/container_decoration.dart';
import 'package:complete_firebase/wedgits/inputdecorationwidget.dart';
import 'package:complete_firebase/wedgits/textwidget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class VerifyPhoneScreen extends StatefulWidget {
   final String verificationId;
 const VerifyPhoneScreen({super.key,required this.verificationId,});

  @override
  _VerifyPhoneScreenState createState() => _VerifyPhoneScreenState();
}

class _VerifyPhoneScreenState extends State<VerifyPhoneScreen> {
     final VerifyController controller=Get.put(VerifyController());
  @override
  Widget build(BuildContext context) {
      
    final height=MediaQuery.of(context).size.height;
    return   SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.only(right: 21,left: 21),
          child:  Column(
              children: [
                SizedBox(height: height*0.07),
                
                Center(child:  TextWidget(text:MyText.verifyCode, fSize: 28,fWeight: MyFontWeight.extra,),),
                SizedBox(  height: height*0.025),
                 SizedBox(
                  height: height*0.07,
                   child: TextField(
                     maxLength: 6,
                    keyboardType: TextInputType.phone,
                    controller: controller.code,
                       decoration: inputDecorationWidget(text: MyText.examplecode)
                   ),
                 ),
                 SizedBox(height: height*0.015),
               
            SizedBox(  height: height*0.025),
                 SizedBox(
                   height: height*0.07,
                   child: InkWell(
                     onTap: (){
                       controller.verifyController(verificationId:widget.verificationId);
                     },
                  child: Container(
                    decoration: containerDecorationWidget(color: MyColors.verify),
                    child: Center(
                      child: TextWidget(text: MyText.verify, fSize: 17,textColor: MyColors.white,)
                    ),
                  ),
                   )
                 ),
                        
  
              ],

            ),
          
        ),
      ),
    );
  }
}
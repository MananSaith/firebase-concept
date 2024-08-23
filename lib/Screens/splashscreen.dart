//import 'package:complete_firebase/Controller/wrapper.dart';
import 'package:complete_firebase/Controller/wrapper.dart';
import 'package:complete_firebase/constant/string_constant.dart';
import 'package:complete_firebase/wedgits/textwidget.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
class Splashscreen extends StatefulWidget {
  const Splashscreen({super.key});

  @override
  State<Splashscreen> createState() => _SplashscreenState();
}

class _SplashscreenState extends State<Splashscreen> {
  @override
  void initState() { 
    _gohome();
    super.initState();

    
  }
   void _gohome() async{
     await Future.delayed(const Duration(milliseconds: 2000),(){});
      Get.off(()=> const Wrapper());
       }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: TextWidget(
          text: MyText.splashText,
          fSize: 20,
          )
      ,),
    );
  }
}
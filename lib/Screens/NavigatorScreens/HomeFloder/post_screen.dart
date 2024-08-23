import 'package:complete_firebase/Controller/loader_controller.dart';
import 'package:complete_firebase/constant/colorclass.dart';
import 'package:complete_firebase/constant/font_weight.dart';
import 'package:complete_firebase/constant/string_constant.dart';
import 'package:complete_firebase/wedgits/container_decoration.dart';
import 'package:complete_firebase/wedgits/inputdecorationwidget.dart';
import 'package:complete_firebase/wedgits/textwidget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../Controller/FireBaseControler/CRUDoperation/add_news_post_controller.dart';
class PostScreen extends StatefulWidget {
  const PostScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _PostScreenState createState() => _PostScreenState();
}

class _PostScreenState extends State<PostScreen> {
  final NewsController  newsController=Get.put(NewsController());
   final LoaderController  loaderController=Get.put(LoaderController());
  @override
  Widget build(BuildContext context) {
    final height=MediaQuery.of(context).size.height;
    final width=MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: MyColors.blackTransparent,
          foregroundColor: MyColors.white,
          centerTitle: true,
          title: TextWidget(text: MyText.postTitle, fSize: 18,fWeight: MyFontWeight.bold,),
        ),
      body:  Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: SingleChildScrollView(
          child: Column(
            children: [
                    SizedBox(  height: height*0.025),
                      TextField(
                         controller: newsController.news,
                        maxLines: 4,
                            decoration: inputDecorationWidget(text: MyText.postHint)
                        ),

                    SizedBox(  height: height*0.035),
                     SizedBox(
                     height: height*0.07,
                     width: width/1.5,
                     child: InkWell(
                       onTap: (){
                         newsController.newsUpload();
                         newsController.news.clear();
                       },
                    child: Container(
                      decoration: containerDecorationWidget(color: MyColors.verify),
                      child: Center(
                        child: Obx((){
                          return loaderController.loader.value?
                          CircularProgressIndicator(color: MyColors.white,):
                          TextWidget(text: MyText.post, fSize: 17,textColor: MyColors.white,);
                        }),
                      ),
                    ),
                     )
                   ),
                          
            ],
          ),
        ),
        ),    
      )
    );
  }
}
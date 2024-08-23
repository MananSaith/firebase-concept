import 'package:complete_firebase/constant/colorclass.dart';
import 'package:complete_firebase/constant/font_weight.dart';
import 'package:complete_firebase/wedgits/textwidget.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import '../../../constant/string_constant.dart';
import '../../../wedgits/inputdecorationwidget.dart';
class EditNewsPost extends GetxController{
  final TextEditingController editingController =TextEditingController();
  String? add;
  String? id;
  final readRealtimeDataBaseRef = FirebaseDatabase.instance.ref("post");


  Future<void> showAlertDialog(add ,id) async{
    editingController.text=add;
    Get.defaultDialog(
      title: 'Edit your post',
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TextField(
              controller: editingController,
              maxLines: 4,
              decoration: inputDecorationWidget(text: MyText.postHint)
          ),
        ],
      ),
      actions: [
        TextButton(
          onPressed: () {
            //readRealtimeDataBaseRef.child(id)
            Get.back();
          },
          child:TextWidget(text: "Cancel", fSize: 15,textColor: MyColors.red,fWeight: MyFontWeight.bold,),
        ),
        TextButton(
          onPressed: () {
            readRealtimeDataBaseRef.child(id).update(
                {
                  'id':id,
                  'add': editingController.text.toLowerCase(),
            });
            Get.back();
          },
          child:TextWidget(text: "Update", fSize: 15,textColor: MyColors.green,fWeight: MyFontWeight.bold,),
        ),
      ],
    );
  }



}


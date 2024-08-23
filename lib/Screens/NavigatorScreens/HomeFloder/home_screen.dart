import 'package:complete_firebase/Controller/loader_controller.dart';
import 'package:complete_firebase/Screens/NavigatorScreens/HomeFloder/post_screen.dart';
import 'package:complete_firebase/constant/colorclass.dart';
import 'package:complete_firebase/constant/font_weight.dart';
import 'package:complete_firebase/constant/string_constant.dart';
import 'package:complete_firebase/wedgits/container_decoration.dart';
import 'package:complete_firebase/wedgits/textwidget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../Controller/FireBaseControler/CRUDoperation/image_storage_controller.dart';
import '../../../Controller/FireBaseControler/CRUDoperation/upload_image_save_uril_storage.dart';
import '../../../wedgits/inputdecorationwidget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final UploadImageSaveUrlStorageController StorageController=Get.put(UploadImageSaveUrlStorageController());
  final ImageStorageController controllerImage = Get.put(ImageStorageController());
  final LoaderController  loaderController=Get.put(LoaderController());

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: MyColors.blackTransparent,
          foregroundColor: MyColors.white,
          centerTitle: true,
          title: TextWidget(
            text: MyText.homeTitle,
            fSize: 18,
            fWeight: MyFontWeight.bold,
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                TextWidget(text: "Firebase Storage", fSize: 30),
                SizedBox(height: height * 0.1),
                Center(
                  child: InkWell(
                    onTap: (){
                      controllerImage.galleryCameraFun();
                    },
                    child: Container(
                      width: width * 0.4, // Set the desired width
                      height: height * 0.175, // Set the desired height
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100), // Optional: Add border radius
                        border: Border.all(color: Colors.grey), // Optional: Add border
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(100),
                        child: Obx(() {
                          // Using Obx to reactively update the image display
                          return controllerImage.image.value != null
                              ? Image.file(controllerImage.image.value!, fit: BoxFit.cover)
                              : Icon(Icons.photo);
                        }),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: height*0.025,),
                SizedBox(
                  height: height*0.07,
                  child: TextField(
                    controller:StorageController.brand,
                    decoration: inputDecorationWidget(text: MyText.shose),
                  ),
                ),
                SizedBox(height: height*0.025,),
                SizedBox(
                  height: height*0.07,
                  child: TextField(
                    controller:StorageController.price,
                    decoration: inputDecorationWidget(text: MyText.price),
                    keyboardType: TextInputType.number,
                  ),
                ),
                SizedBox(height: height*0.025,),

                SizedBox(
                     height: height*0.07,
                     child: InkWell(
                       onTap: (){
                         StorageController.UploadItemFireStorage();

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




        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Get.to(const PostScreen());
          },
          backgroundColor: MyColors.blackTransparent,
          foregroundColor: MyColors.white,
          child: const Icon(Icons.post_add),
        ),
      ),
    );
  }
}

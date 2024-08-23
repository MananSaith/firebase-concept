import 'package:complete_firebase/constant/colorclass.dart';
import 'package:complete_firebase/constant/font_weight.dart';
import 'package:complete_firebase/constant/string_constant.dart';
import 'package:complete_firebase/wedgits/textwidget.dart';
import 'package:firebase_database/firebase_database.dart';
//import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../Controller/FireBaseControler/CRUDoperation/edit_news_post.dart';
import '../../wedgits/container_decoration.dart';
import '../../wedgits/inputdecorationwidget.dart';

class NewsScreen extends StatefulWidget {
  const NewsScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _NewsScreenState createState() => _NewsScreenState();
}

class _NewsScreenState extends State<NewsScreen> {
  final EditNewsPost postController=Get.put(EditNewsPost());
  final readRealtimeDataBaseRef = FirebaseDatabase.instance.ref("post");
  final  searchController =TextEditingController();

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
   /// final width = MediaQuery.of(context).size.width;
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        backgroundColor: MyColors.blackTransparent,
        foregroundColor: MyColors.white,
        centerTitle: true,
        title: TextWidget(
          text: MyText.newsTitle,
          fSize: 18,
          fWeight: MyFontWeight.bold,
        ),
      ),
      body:  Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
          child: Column(
            children: [
              SizedBox(
                height: height*0.07,
                child: TextField(
                    controller: searchController,
                    decoration: inputDecorationWidget(text: MyText.search),
                    onChanged: (String v){setState(() {});},
                ),
              ),
              Expanded(
                child: StreamBuilder(
                  stream: readRealtimeDataBaseRef.onValue,
                  builder: (context, AsyncSnapshot<DatabaseEvent> snapshot) {
                    if (!snapshot.hasData) {
                      return TextWidget(
                        text: "nothing right now",
                        fSize: 14,
                      );
                    } else {
                      Map<dynamic, dynamic> map =
                          snapshot.data!.snapshot.value as dynamic;
                      List<dynamic> listOfNews = [];
                      listOfNews.clear();
                      listOfNews = map.values.toList();
                      return ListView.builder(
                        itemCount: snapshot.data!.snapshot.children.length,
                        itemBuilder: (context, index) {
                          String item=listOfNews[index]["add"];
                          String id=listOfNews[index]["id"];
                          if(searchController.text.isEmpty){
                            return Container(
                              margin: const EdgeInsets.all(10),
                              padding: const EdgeInsets.all(10),
                              decoration: containerDecorationWidget(
                                  color: MyColors.camelTransparent),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  TextWidget(text: listOfNews[index]["add"], fSize: 17),
                                  SizedBox(height: height*0.025,),
                                  Row(
                                    children: [
                                      PopupMenuButton(
                                          shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(15), // Border radius
                                          ),

                                        icon:const Icon(Icons.more_vert),
                                          itemBuilder: (context)=>[
                                            PopupMenuItem(
                                                child: ListTile(
                                              onTap: (){
                                                   Get.back();
                                                   postController.showAlertDialog(item,id);
                                              },
                                              leading: const Icon(Icons.edit),
                                              title: TextWidget(text: "Edit",fSize: 14,),
                                            )),
                                            PopupMenuItem(child: ListTile(
                                              onTap: (){
                                                readRealtimeDataBaseRef.child(id).remove();
                                                Get.back();
                                              },
                                              leading: const Icon(Icons.delete),
                                              title: TextWidget(text: "Delete",fSize: 14,),
                                            )),

                                          ]

                                      ),
                                    ],
                                  )
                                ],
                              ),
                            );
                          }

                          else if(item.toLowerCase().contains(searchController.text.toLowerCase().toLowerCase())){
                            return Container(
                              margin: const EdgeInsets.all(10),
                              padding: const EdgeInsets.all(10),
                              decoration: containerDecorationWidget(
                                  color: MyColors.camelTransparent),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  TextWidget(text: listOfNews[index]["add"], fSize: 17),
                                ],
                              ),
                            );
                          }
                          else{
                               return Container();
                          }
                        },
                      );
                    }
                  },
                ),
              ),
            ],
          ),

      ),
    ));
  }
}

// child: FirebaseAnimatedList(
//   query: readRealtimeDataBaseRef,
//   defaultChild: TextWidget(text: "nothing right now",fSize: 14,),
//   reverse: true,
//   itemBuilder: (context,snapshot,animation,index){
//     return Container(
//       margin:const  EdgeInsets.all(10),
//       padding:const EdgeInsets.all(10),
//       decoration: containerDecorationWidget(color: MyColors.camelTransparent),
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.start,
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           TextWidget(text: snapshot.child("add").value.toString(), fSize: 17),
//         ],
//       ),
//     );
//   },
// )

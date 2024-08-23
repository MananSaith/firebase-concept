import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:complete_firebase/constant/colorclass.dart';
import 'package:complete_firebase/constant/font_weight.dart';
import 'package:complete_firebase/constant/string_constant.dart';
import 'package:complete_firebase/wedgits/container_decoration.dart';
import 'package:complete_firebase/wedgits/textwidget.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {

    User? currentUsers = FirebaseAuth.instance.currentUser;
  final fireStoreUserNode=FirebaseFirestore.instance.collection("user info") ;

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
           actions: [
          IconButton(
            icon:const Icon(Icons.logout),
          
            onPressed: () async{
            await  FirebaseAuth.instance.signOut();
            },
          ),
        ],
          title: TextWidget(text: MyText.profileTitle, fSize: 18,fWeight: MyFontWeight.bold,),
        ),

           body:  Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
          child: FutureBuilder<DocumentSnapshot>(
            future: fireStoreUserNode.doc(currentUsers!.uid).get(),
            builder: (context, AsyncSnapshot<DocumentSnapshot> snapshot) {
              if(snapshot.connectionState==ConnectionState.waiting){
                return const Center(child: CircularProgressIndicator(),);
              }
            else  if (!snapshot.hasData) {
                return TextWidget(
                  text: "nothing right now",
                  fSize: 14,
                );
              } else {
                Map<dynamic, dynamic> userData = snapshot.data!.data() as Map<dynamic, dynamic>;
                List<dynamic> list = userData.values.toList();
                 return Column(
                   children: [
                     Center(
                       child: Container(
                         width: width*0.3, // Set the desired width
                         height: height*0.135, // Set the desired height
                         decoration: BoxDecoration(
                           borderRadius: BorderRadius.circular(100), // Optional: Add border radius
                           border: Border.all(color: Colors.grey), // Optional: Add border
                         ),
                         child: ClipRRect(
                           borderRadius: BorderRadius.circular(100), // Match the border radius
                           child: Image.network(
                             userData["profilePhoto"], // Replace with your image URL
                             fit: BoxFit.cover, // Adjust image scaling
                             loadingBuilder: (BuildContext context, Widget child, ImageChunkEvent? loadingProgress) {
                               if (loadingProgress == null) {
                                 return child; // Return the image once it's fully loaded
                               } else {
                                 return Center(
                                   child: CircularProgressIndicator( // Display a loading indicator
                                     value: loadingProgress.expectedTotalBytes != null
                                         ? loadingProgress.cumulativeBytesLoaded / (loadingProgress.expectedTotalBytes as int)
                                         : null,
                                   ),
                                 );
                               }
                             },
                             errorBuilder: (BuildContext context, Object error, StackTrace? stackTrace) {
                               return Center(child: Text('Failed to load image')); // Display error message
                             },
                           ),
                         ),
                       ),
                     ),
                     Expanded(
                       child: ListView.builder(
                         itemCount: list.length,
                           itemBuilder: (context,index){
                             return Container(
                               width: width,
                               margin: const EdgeInsets.all(10),
                               padding: const EdgeInsets.all(10),
                               decoration: containerDecorationWidget(
                                   color: MyColors.camelTransparent),
                               child: Row(

                                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                 // crossAxisAlignment: CrossAxisAlignment.start,
                                 children: [
                                   Expanded( // Wrap the first TextWidget in Expanded
                                     child: TextWidget(
                                       text: list[index],
                                       fSize: 17,
                                       overFlow: true,
                                       maxLine: 1,
                                     ),
                                   ),
                                   TextWidget(text: "00", fSize: 17)
                                 ],
                               ),
                             );
                           }),
                     ),
                   ],
                 );

              }
            },

          ),

      ),
   
          
      )
    );
  }
}
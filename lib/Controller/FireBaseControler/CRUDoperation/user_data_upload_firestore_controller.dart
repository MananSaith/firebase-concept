import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class UserDataUploadFirestoreController extends GetxController{

   User? currentUsers = FirebaseAuth.instance.currentUser;
  final fireStoreUserInfo=FirebaseFirestore.instance.collection("user info") ;

  Future<void> additionalUserInfo()async{
   bool check = await checkIfUserExists();
   if(check){
       Get.snackbar("Wellcome Back ${currentUsers!.displayName}", "enjoy your journey");
   }
   else{
    fireStoreUserInfo.doc(currentUsers!.uid).set({
        "uid":currentUsers!.uid,
        "name":currentUsers!.displayName??"Gust",
        "email":currentUsers!.email??"example@gmail.com",
        "phonenumber":currentUsers!.phoneNumber??"03000000000",
        "password":"*********",
        "profilePhoto":currentUsers!.photoURL??"no now"
    });
   }

  }



  Future<bool> checkIfUserExists() async {
  // Reference to the 'users' collection
  CollectionReference users = FirebaseFirestore.instance.collection('users');

  // Perform a query to find documents where the 'id' field matches the given id
  QuerySnapshot querySnapshot = await users.where('id', isEqualTo: currentUsers!.uid).get();

  if (querySnapshot.docs.isNotEmpty) {
    // If the list is not empty, the document exists
    return true;
  } else {
    // If the list is empty, the document does not exist

    return false;
  }
}

  

}
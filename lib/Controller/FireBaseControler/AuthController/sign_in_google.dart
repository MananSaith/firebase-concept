import 'package:complete_firebase/Controller/FireBaseControler/CRUDoperation/user_data_upload_firestore_controller.dart';
import 'package:complete_firebase/Controller/wrapper.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:get/get.dart';
// Adjust the import path to your project structure

class SignInWithGoogleController extends GetxController {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn();

  Future<void> signInWithGoogle() async {
    try {
      // opens the Google Sign-In screen where the user can choose 
      //their Google account to sign in with.
      final  googleUser = await _googleSignIn.signIn();

      if (googleUser == null) {
        // The user canceled the sign-in
        return;
      }
     //This line fetches the authentication tokens (access token and ID token) 
     //from the googleUser object.
      final   googleAuth = await googleUser.authentication;

      // Create a new credential
      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      // Sign in to Firebase with the Google user credentials
      await _auth.signInWithCredential(credential);
      //now this function store user info into firestore 
      UserDataUploadFirestoreController().additionalUserInfo();
      // Navigate to the next page after successful sign-in
      Get.off(const Wrapper());
    } catch (error) {
      Get.snackbar(
        'Sign In Error', 
      'Failed to sign in with Google: $error', 
      snackPosition: SnackPosition.BOTTOM
      );
    }


  }

  @override
  void onClose() {
    _googleSignIn.disconnect();
    super.onClose();
  }
}
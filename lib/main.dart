import 'package:complete_firebase/Screens/splashscreen.dart';
import 'package:complete_firebase/constant/string_constant.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:get/get.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();

  try {
    await Firebase.initializeApp(
       options:const FirebaseOptions(
            apiKey: "AIzaSyDC2psrtJPK6_nH0kFvO5f47hzlZ_4Tj2M",
            appId: "1:801727362798:android:77365a36d162a1f137e5ff",
            messagingSenderId:"801727362798",
            projectId:"fir-concept-24399",
         storageBucket: "fir-concept-24399.appspot.com"
        )
     );

  } catch (e) {
    // ignore: avoid_print
    print("Error initializing Firebase: $e");
  }
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: MyText.appTitle,
      debugShowCheckedModeBanner: false,
      home:const Splashscreen(),

    );
    }
}
import 'package:complete_firebase/Screens/NavigatorScreens/HomeFloder/home_screen.dart';
import 'package:complete_firebase/Screens/NavigatorScreens/news_screen.dart';
import 'package:complete_firebase/Screens/NavigatorScreens/profile_screen.dart';
import 'package:complete_firebase/constant/colorclass.dart';
import 'package:flutter/material.dart';
class NavigatorScreen extends StatefulWidget {
  const NavigatorScreen({super.key});

  @override
  State<NavigatorScreen> createState() => _NavigatorScreenState();
}

class _NavigatorScreenState extends State<NavigatorScreen> {
  List<Widget> listOfPages =const [HomeScreen(),NewsScreen(),ProfileScreen()];
  int currentPage=0;
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: IndexedStack(
        index: currentPage,
        children: listOfPages,
      ),

        bottomNavigationBar: BottomNavigationBar(
          onTap: (v){
            setState(() {
              currentPage=v;
            });

          },
          backgroundColor: MyColors.blackTransparent,
          
          iconSize: 20.4,
          selectedFontSize: 14,
          unselectedFontSize: 14,
          currentIndex: currentPage,
          selectedItemColor: MyColors.camel,
          unselectedItemColor: MyColors.white,
          items:  [
            BottomNavigationBarItem(
              icon: Image.asset('assect/icons/home outline.png',color: currentPage==0?MyColors.camel:MyColors.white,height: 30,),
              label: 'Home',
            ),

            BottomNavigationBarItem(
              icon: Image.asset('assect/icons/post.png',color: currentPage==1?MyColors.camel:MyColors.white,height: 30),
              label: 'News',
            ),
            BottomNavigationBarItem(
              icon: Image.asset('assect/icons/person.png',color: currentPage==2?MyColors.camel:MyColors.white,height: 30),
              label: 'Profile',
            ),
          ],
        )

    );
  }
}
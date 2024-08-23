import 'package:complete_firebase/wedgits/text_field_border.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../constant/colorclass.dart';

 inputDecorationWidget({required String text}) {
  return InputDecoration(

      hintText:text,
      border:         borderWidget ,
      enabledBorder:  borderWidget ,
      focusedBorder:  borderWidget ,
      hintStyle: GoogleFonts.poppins(
          fontSize:15,
          color: MyColors.hintInput
      )
  );
}

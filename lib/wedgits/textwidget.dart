import 'package:complete_firebase/constant/colorclass.dart';
import 'package:complete_firebase/constant/font_weight.dart';
import 'package:flutter/cupertino.dart';
import 'package:google_fonts/google_fonts.dart';

// ignore: must_be_immutable
class TextWidget extends StatelessWidget {
  // ignore: prefer_typing_uninitialized_variables
  final text;
   // ignore: prefer_typing_uninitialized_variables
   double fSize;
  FontWeight? fWeight=MyFontWeight.regular;
 
  Color? textColor=MyColors.black;
  final int? maxLine;
  var overFlow=false;
  var dir=false;
  TextWidget({
    super.key,
    required this.text,
    required this.fSize,
    this.fWeight,
    this.textColor,
    this.maxLine=1,
    overFlow,
    dir
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: GoogleFonts.poppins(
        fontWeight: fWeight,
        fontSize: fSize,
        color: textColor,
      ),
      maxLines: maxLine,
      overflow: overFlow?TextOverflow.ellipsis:null,
      textDirection: dir?TextDirection.rtl:null,
    );
  }
}

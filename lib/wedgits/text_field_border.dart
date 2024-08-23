import 'package:complete_firebase/constant/colorclass.dart';
import 'package:flutter/material.dart';



final  borderWidget = OutlineInputBorder(
    borderSide:  BorderSide(
      color: MyColors.hintInput,
      width: 0.5,
      style: BorderStyle.solid,

    ),
    borderRadius: BorderRadius.circular(20)
);



final containerDecoration = BoxDecoration(
    border: Border.all(
      color: MyColors.hintInput,
      width: 0.5,
      style: BorderStyle.solid,
    ),
    borderRadius: BorderRadius.circular(20)
);

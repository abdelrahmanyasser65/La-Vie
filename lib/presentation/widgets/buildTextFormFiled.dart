import 'package:flutter/material.dart';
import 'package:lavie/presentation/constants/app_colors.dart';

TextFormField buildTextForm(
    {
      Function(String)? onChanged,
      required controller,
      bool obscureText=false,
      required type,
      String? hintText,
      int maxLines=1,

    }
    ){
  return  TextFormField(
    controller: controller,
    obscureText: obscureText,
    keyboardType: type,
    maxLines: maxLines,
    onChanged: onChanged,
    decoration: InputDecoration(
      hintText: hintText,
      hintStyle:const TextStyle(
        fontSize: 13,
        color: Colors.black87,
      ),
      filled: true,
      fillColor: Colors.white10,
      border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(6),
          borderSide: BorderSide(width: 1,
              color: AppColors.grey)),
      focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5),
          borderSide: BorderSide(width: 1,
              color: AppColors.grey)),
      enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(6),
          borderSide: BorderSide(width: 1,
              color: AppColors.grey)),
      disabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(6),
          borderSide: BorderSide(width: 1,
              color: AppColors.grey)),
    ),
  );
}

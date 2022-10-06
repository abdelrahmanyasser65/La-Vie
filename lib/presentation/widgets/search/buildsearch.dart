import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sizer/sizer.dart';

import '../../constants/app_colors.dart';
import '../../constants/images.dart';
SizedBox buildSearch(

{
 required  searchC
  ,required onFieldSubmitted,
  required onChange
}
    ) {
  return SizedBox(
    child: TextFormField(

      cursorColor: AppColors.grey,
      controller: searchC,
      keyboardType: TextInputType.text,
      onFieldSubmitted: onFieldSubmitted,
      onChanged: onChange,
      decoration: InputDecoration(
        contentPadding:  EdgeInsets.symmetric(
          vertical: 2.h,
        ),
        prefixIcon:
        Padding(
          padding: EdgeInsets.symmetric(
              horizontal: 3.w
          ),
          child: SvgPicture.asset(search,
            height: 3.h,
            width: 3.w,
            color: Colors.grey.shade400,
          ),
        ),
        hintText: "Search",
        hintStyle:const TextStyle(
            color: Colors.grey
        ),
        filled: true,
        fillColor: Colors.black.withOpacity(0.04),
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide.none
        ),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide.none
        ),
        enabledBorder:OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide.none
        ),
      ),
    ),
  );
}
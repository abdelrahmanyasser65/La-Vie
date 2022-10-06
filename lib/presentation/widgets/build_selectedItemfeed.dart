import 'package:flutter/material.dart';
import 'package:lavie/presentation/constants/app_colors.dart';
import 'package:sizer/sizer.dart';
selectedItemFeed({
  required double height,
  required String text,
  required bool select,
}) {
  return Container(

    padding: EdgeInsets.symmetric(
        vertical: 0.8.h,
        horizontal: 7.w
    ),
    height: height,
    decoration: select
        ? BoxDecoration(
        borderRadius: BorderRadius.circular(5),
       color:AppColors.brand,)
        : BoxDecoration(
        borderRadius: BorderRadius.circular(5),
    border: Border.all(
      width: 0.3.w,
      color: Colors.grey
    )
    ),
    child: Center(
      child: Text(
        text,
        style: select
            ? TextStyle(
            fontSize: 12.sp,
            fontWeight: FontWeight.w500,
            color: AppColors.white)
            : TextStyle(
            fontSize: 12.sp,
            fontWeight: FontWeight.w400,
            color:AppColors.grey),
      ),
    ),
  );
}
import 'package:flutter/material.dart';
import 'package:lavie/presentation/constants/app_colors.dart';
import 'package:lavie/presentation/constants/images.dart';
import 'package:sizer/sizer.dart';

import 'default_image.dart';
import 'default_text.dart';
class CardProfile extends StatelessWidget {
  const CardProfile({Key? key, required this.text, required this.function}) : super(key: key);
final String text;
final Function() function;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: function,
      child: Container(
        margin: EdgeInsets.symmetric(
            vertical:1.5.h
        ),
        height: 8.h,
        padding: EdgeInsets.symmetric(
            vertical: 1.3.h,
            horizontal: 5.w
        ),
        decoration: BoxDecoration(
          border: Border.all(width: 0.5, color:AppColors.grey),
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: const [
            BoxShadow(
              color: Color.fromARGB(255, 228, 228, 228),
              offset: Offset(2, 3),
              blurRadius: 5,
              spreadRadius: 0.1,
            ),
          ],
        ),

        child: Row(
          children: [
            DefaultImage(
              image: changeEmail,
              height: 3.5.h,
              width: 3.5.w,
            ),
            SizedBox(
              width: 3.w,
            ),

            DefaultText(
              text: text,
              fontSize: 14.sp,
              fontWeight: FontWeight.w500,
            ),
            const Spacer(),
            DefaultImage(
                image: backArrow,
                height: 4.h,
                width: 4.w)
          ],
        ),
      ),
    );
  }
}

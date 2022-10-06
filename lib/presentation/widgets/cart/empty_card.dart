import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../constants/images.dart';
import '../default_image.dart';
import '../default_text.dart';
class EmptyCard extends StatelessWidget {
  const EmptyCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: EdgeInsets.symmetric(
          horizontal: 15.w,
          vertical: 10.h
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          DefaultImage(
            image: empty,
            height: 30.h,
            width: double.infinity,
          ),
          SizedBox(height: 3.h,),
          DefaultText(
            text: "Your cart is empty",
            fontSize: 18.sp,
            fontWeight: FontWeight.bold,
          ),
          SizedBox(height: 2.5.h,),
          Text(
            "Sorry, the keyword you entered cannot be found, please check again or search with another keyword.",
            textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: 12.sp,
                color: Colors.grey
            ),

          ),
        ],
      ),
    );
  }
}

import 'package:flutter/cupertino.dart';
import 'package:lavie/presentation/constants/images.dart';
import 'package:lavie/presentation/widgets/default_image.dart';
import 'package:lavie/presentation/widgets/default_text.dart';
import 'package:sizer/sizer.dart';

import '../../constants/app_colors.dart';

ListView buildEmptySearch({
  required cubit,
}){
  return ListView(
    padding: EdgeInsets.symmetric(
      horizontal: 7.w
    ),
    children: [
      Column(
        children: [
          SizedBox(height: 2.5.h,),
          Row(
            children: [
              Text.rich(
                  TextSpan(
                      text: 'Results for "',
                      style: TextStyle(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.bold
                      ),
                      children:[
                        TextSpan(
                          text: cubit.searchChange,
                          style: TextStyle(
                              fontSize: 16.sp,
                              fontWeight: FontWeight.bold,
                              color: AppColors.brand
                          ),

                        ),
                        TextSpan(
                          text: '"',
                          style: TextStyle(
                            fontSize: 14.sp,
                            fontWeight: FontWeight.bold,

                          ),)
                      ]
                  )
              ),
              const Spacer(),
              Text("0 found",
                style: TextStyle(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w600,
                    color: AppColors.brand
                ),
              )
            ],
          ),
          SizedBox(
            height: 12.h,
          ),
          DefaultImage(
              image: empty,
              height: 30.h,
              width: double.infinity
          ),
          SizedBox(height: 5.h,),
          DefaultText(
            text: "Not found",
            fontSize: 20.sp,
            fontWeight:FontWeight.bold,
          ),
          SizedBox(height: 3.h,),
          Text(
            "Sorry, the keyword you entered cannot be found, please check again or search with another keyword.",
            style: TextStyle(
              color: AppColors.grey,
              fontSize: 13.sp,
            ),
            textAlign: TextAlign.center,
          )
        ],
      ),
    ],
  );
}
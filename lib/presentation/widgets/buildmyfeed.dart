import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lavie/bussiness_logic/home/cubit.dart';
import 'package:lavie/data/models/myforums_model.dart';
import 'package:lavie/presentation/constants/app_colors.dart';
import 'package:lavie/presentation/constants/images.dart';
import 'package:sizer/sizer.dart';
Padding buildMyItemsFeed(ForumsModel model,index){
  var image=HomeCubit().userModel!.data.imageUrl;
  var name=HomeCubit().userModel!.data.firstName+HomeCubit().userModel!.data.lastName;
  return Padding(
    padding: EdgeInsets.symmetric(
        horizontal: 5.w
    ),
    child: Column(
      children: [
        Container(
          width: double.infinity,
          decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(
                  width: 0.4.w,
                  color: Colors.grey.shade300

              )
          ),
          padding:  EdgeInsets.all(
              2.h
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  CircleAvatar(
                    backgroundColor: Colors.white,
                    radius: 23,
                    child: Image.network(image),
                  ),
                  SizedBox(width: 4.w,),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(name,style:
                      TextStyle(
                          fontSize: 13.sp,
                          fontWeight: FontWeight.bold
                      ),),
                      SizedBox(height: 0.5.h,),
                      Text('a month ago',style:
                      TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 10.sp,
                          color: AppColors.grey
                      ),)
                    ],
                  )
                ],
              ),
              SizedBox(height: 2.h,),
              Text(model.data[index].title,style:
              TextStyle(
                  fontSize: 15.sp,
                  fontWeight: FontWeight.bold,
                  color: AppColors.brand
              ),),
              SizedBox(height: 2.5.h,),
              Text(model.data[index].description,
                style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 10.sp,
                    color: AppColors.grey
                ),)
            ],
          ),
        ),
        Image.network(
          model.data[index].imageUrl,
          height: 17.h,
          width: double.infinity,
          fit: BoxFit.cover,
        ),
        SizedBox(height: 3.h,),
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            InkWell(
              onTap: (){},
              child: SvgPicture.asset(
                like,
                height: 3.h,
                width: 3.w,
                color: AppColors.brand,
              ),
            ),
            SizedBox(width:2.w ,),
            Text(" ${model.data[index].forumLikes.length} Likes",style:
            TextStyle(
                fontSize: 10.sp,
                fontWeight: FontWeight.w600,
                color:Colors.black54
            ),),
            SizedBox(width: 18.w,),
            Text("${model.data[index].forumComments.length} Replies",style:
            TextStyle(
                fontSize: 10.sp,
                fontWeight: FontWeight.w600,
                color:Colors.black54
            ),),
          ],
        ),
      ],
    ),
  );
}
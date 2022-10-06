import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lavie/data/models/allforums_model.dart';
import 'package:lavie/presentation/constants/app_colors.dart';
import 'package:lavie/presentation/constants/images.dart';
import 'package:sizer/sizer.dart';
Padding buildAllItemsFeed(AllForumsModel model,index){
  var dataModel=model.data[index];
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
                    child: Image.network(
                      dataModel.user.imageUrl
                    ),
                  ),
                  SizedBox(width: 4.w,),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: 60.w,
                        child: Text(
                    dataModel.user.firstName+dataModel.user.lastName
                    ,style:
                        TextStyle(
                            fontSize: 13.sp,
                            fontWeight: FontWeight.bold,
                        ),),
                      ),
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
              Text(dataModel.title,style:
              TextStyle(
                  fontSize: 15.sp,
                  fontWeight: FontWeight.bold,
                  color: AppColors.brand
              ),),
              SizedBox(height: 2.5.h,),
              Text(dataModel.description,
                style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 10.sp,
                    color: AppColors.grey
                ),)
            ],
          ),
        ),
        Image.network(
         "https://lavie.orangedigitalcenteregypt.com${dataModel.imageUrl}",
          
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
            Text("${dataModel.forumLikes.length} Likes",style:
            TextStyle(
                fontSize: 10.sp,
                fontWeight: FontWeight.w600,
                color:Colors.black54
            ),),
            SizedBox(width: 18.w,),
            Text("${dataModel.forumComments.length} Replies",style:
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
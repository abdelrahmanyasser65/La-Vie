import 'package:flutter/material.dart';
import 'package:lavie/presentation/constants/app_colors.dart';
import 'package:lavie/presentation/widgets/default_text.dart';
import 'package:sizer/sizer.dart';
class BlogsItems extends StatelessWidget {
  const BlogsItems({Key? key, required this.index, this.model}) : super(key: key);
  final int index;
  final model;
  @override
  Widget build(BuildContext context) {
    return  Container(
      margin:  EdgeInsets.symmetric(
        horizontal: 7.w,),
      width: double.infinity,
      height: 18.h,
      padding: EdgeInsets.all(1.h),
      decoration: BoxDecoration(
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
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: 35.w,
            decoration: BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.cover,
                image: NetworkImage(
                    model[index].imageUrl == ''
                        ? 'https://lavie.orangedigitalcenteregypt.com/uploads/51416d55-189c-46bc-9e34-296195d18a94.png'
                        : 'https://lavie.orangedigitalcenteregypt.com${model[index].imageUrl}'
                ),
              ),
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          SizedBox(width: 5.w,),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              DefaultText(
                text: "2 days ago",
                fontWeight: FontWeight.w500,
                fontSize: 13.sp,
                color: AppColors.brand,
              ),
              SizedBox(height: 1.5.h,),
              SizedBox(
                width: 40.w,
                child: DefaultText(
                  text: model[index].name,
                  fontWeight: FontWeight.w600,
                  fontSize: 14.sp,
                  color: AppColors.black,
                ),
              ),
              SizedBox(height: 1.5.h,),
              SizedBox(
                width: 40.w,
                child: DefaultText(
                  text: model[index].description,
                  fontWeight: FontWeight.w300,
                  fontSize: 13.sp,
                  color: AppColors.grey,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

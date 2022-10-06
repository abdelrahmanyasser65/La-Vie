import 'package:flutter/material.dart';
import 'package:lavie/presentation/constants/app_colors.dart';
import 'package:lavie/presentation/widgets/default_text.dart';
import 'package:sizer/sizer.dart';
class BuildNotificationItem extends StatelessWidget {
  const BuildNotificationItem({Key? key, required this.image, required this.title, required this.description, required this.date}) : super(key: key);
final String image;
final String title;
final String description;
final String date;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 6.w, vertical: 3.h),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CircleAvatar(
            radius: 20,
            child: Image.asset(
              image,
              height: 40,
              width: 40,
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(
            width: 4.w,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: 70.w,
                child: DefaultText(
                  maxLines: 2,
                  fontWeight: FontWeight.w500,
                  fontSize: 12.sp,
                  text: title,
                ),
              ),
              SizedBox(
                height: 1.h,
              ),
          if (description.isNotEmpty) Column(
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        margin: EdgeInsets.only(
                            right: 3.w
                        ),
                        height: 12.h,
                        width: 1.w,
                        decoration: BoxDecoration(
                            color: Colors.grey.shade300,
                            borderRadius: BorderRadius.circular(10)
                        ),
                      ),
                      SizedBox(
                        width: 68.w,
                        child: DefaultText(
                          text: description,
                          fontWeight: FontWeight.w600,
                          fontSize: 12.sp,
                        ),
                      ),

                    ],
                  ),
                  SizedBox(
                    height: 1.h,
                  ),
                ],
              ) else Container(),

              DefaultText(
                text: date,
                fontSize: 11.sp,
                fontWeight: FontWeight.w500,
                color: AppColors.grey,
              ),
            ],
          ),

        ],
      ),
    );
  }
}

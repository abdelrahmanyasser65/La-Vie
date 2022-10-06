import 'package:flutter/material.dart';
import 'package:lavie/presentation/constants/app_colors.dart';
import 'package:lavie/presentation/constants/constants.dart';
import 'package:lavie/presentation/widgets/build_divder.dart';
import 'package:lavie/presentation/widgets/default_text.dart';
import 'package:sizer/sizer.dart';

class NotificationScreen extends StatelessWidget {
 const  NotificationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        backgroundColor: AppColors.white,
        title: DefaultText(
          text: "Notification",
          fontWeight: FontWeight.bold,
          fontSize: 18.sp,
          color: AppColors.black,
        ),
      ),
      body: ListView.separated(
        physics:const BouncingScrollPhysics(),
        itemCount: 12,
        separatorBuilder: (context,index){
          return BuildDivider(
            color: Colors.grey[300]!,
          );
        },
        itemBuilder: (context,index){
          return itemNot[index];
        },
      ),
    );
  }
}

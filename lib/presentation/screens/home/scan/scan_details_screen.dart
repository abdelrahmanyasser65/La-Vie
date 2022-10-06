import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lavie/bussiness_logic/scan/cubit.dart';
import 'package:lavie/bussiness_logic/scan/state.dart';
import 'package:lavie/presentation/constants/app_colors.dart';
import 'package:lavie/presentation/constants/images.dart';
import 'package:lavie/presentation/screens/home/scan/blogs/blogs_screen.dart';
import 'package:lavie/presentation/widgets/default_button.dart';
import 'package:lavie/presentation/widgets/default_text.dart';
import 'package:lavie/presentation/widgets/navigetor.dart';
import 'package:sizer/sizer.dart';
class ScanDetails extends StatelessWidget {
  ScanDetails({Key? key}) : super(key: key);
  final List image = [
   sun,
    water
    ,thermo
  ];

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ScanCubit,ScanState>(
        listener: (context,state){},
      builder: (context,state){
          var cubit=BlocProvider.of<ScanCubit>(context);
          var model=cubit.oneBlog!.first;
          if (cubit.blogsModel ==null) {
            return const   Center(
                  child: CircularProgressIndicator(),
                );
          } else {
            return Scaffold(
              body: Stack(
                alignment: AlignmentDirectional.bottomCenter,
                children: [
                  Stack(
                    children: [
                      Stack(
                        children: [
                          Image.network(
                            cubit.oneBlog!.first.imageUrl.isEmpty?
                            "https://lavie.orangedigitalcenteregypt.com/uploads/f985a224-ee41-411e-9327-dfb9822544ab.png":
                            "https://lavie.orangedigitalcenteregypt.com${model.imageUrl}",
                            height: 50.h,
                            width: double.infinity,
                            fit: BoxFit.cover,
                          ),
                          Container(
                            height: double.infinity,
                            width: double.infinity,
                            color: Colors.black38,
                          ),
                        ],
                      ),
                      SizedBox(
                        height: double.infinity,
                        child: Column(
                          children: [
                            Padding(
                              padding:  EdgeInsets.only(
                                  top: 14.2.h, left: 15.w),
                              child: Column(
                                children: [
                                  buildRowDetails(image[0],model.sunLight , '%', 'Sun Light'),
                                  SizedBox(
                                    height: 2.h,
                                  ),
                                  buildRowDetails(image[1],model.waterCapacity, '%', 'Water capacity'),
                                  SizedBox(
                                    height: 2.h,
                                  ),
                                  buildRowDetails(image[2], model.temperature, '°', 'Temperature'),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 8.7.h,
                            ),
                            Container(
                              width: double.infinity,
                              height:55.h,
                              padding:  EdgeInsets.only(
                                  bottom: 3.8.h,
                                  left: 6.w,right: 6.w
                              ),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: ListView(
                                physics:const BouncingScrollPhysics(),
                                children: [
                                  Text(
                                    model.name,
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16.sp,
                                        color: Colors.black),
                                  ),
                                  SizedBox(
                                    height: 2.5.h,
                                  ),
                                  DefaultText(
                                    text: model.description,
                                    color: AppColors.text,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 7.w,
                      vertical: 2.h
                    ),
                    child: DefaultButton(
                        text: "Go To Blog",
                        textColor: AppColors.white,
                        onPressed: (){
                          NavigetorApp.navigatorTo(context,const BlogsScreen());
                        },
                        height: 6.h, width: double.infinity,
                        radius: 13, fontSize: 15.sp,
                        primary: AppColors.brand),
                  )
                ],
              )
          );
          }
      },
    );
  }

  Row buildRowDetails(image, text1, text2, text3) {
    return Row(
      children: [
        Container(
          margin:  EdgeInsets.only(
            right: 5.w
          ),
          height:6.h,
          width: 15.w,
          padding:  EdgeInsets.all(3.w),
          decoration: BoxDecoration(
              color: Colors.black54,
              borderRadius: BorderRadius.circular(10)),
          child: Image.asset(
            image,
            height: 5.h,
            width: 10.w,
          ),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "$text1",
                  style:  TextStyle(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w600,
                      color: Colors.white),
                ),
                Text(
                  text2,
                  style:  TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 14.sp,
                      color: Colors.white),
                )
              ],
            ), SizedBox(height: 1.h,),
            Text(
              text3,
              style:  TextStyle(
                  fontSize: 11.sp,
                  fontWeight: FontWeight.w400,
                  color: Colors.white),
            )
          ],
        )
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:lavie/bussiness_logic/search/cubit.dart';
import 'package:lavie/presentation/constants/app_colors.dart';
import 'package:lavie/presentation/widgets/default_text.dart';
import 'package:sizer/sizer.dart';
ListView buildRecentSearch(
    SearchCubit cubit,
    ){
  return ListView(
padding: EdgeInsets.only(
  right: 8.w,
),
    children: [
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(
                left: 10.w,
                top: 2.2.h,
              bottom: 2.5.h

            ),
            child: DefaultText(
              text:"Recent Searches",
              fontSize: 12.sp,
              color: AppColors.grey,
            ),
          ),
          SizedBox(
            height: 79.h,
            child: ListView.separated(
              itemCount: cubit.recentItems.length,
              itemBuilder: (context,index){
                return Container(
                  margin: EdgeInsets.only(
                      left: 10.w
                  ),
                  child: InkWell(
                    onTap: ()async{
                      // cubit.searchController.text=cubit.recentItems[index];
                      // await cubit.search(cubit.recentItems[index]);
                    },
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Icon(Icons.watch_later_outlined,
                          color: Colors.grey.shade400,
                          size: 2.7.h,
                        ),
                        SizedBox(width: 3.w,),
                        SizedBox(
                          width: 55.w,
                          child: DefaultText(
                            text:cubit.recentItems[index],
                            fontSize: 12.sp,
                            color: AppColors.grey,
                          ),
                        ),
                        const  Spacer(),
                        InkWell(
                          onTap: (){
                            // cubit.removeRecentItem(cubit.recentItems[index]);
                          },
                          child: Icon(Icons.close,
                              color: Colors.grey.shade600,
                              size: 2.7.h
                          ),
                        )
                      ],
                    ),
                  ),
                );
              },
              separatorBuilder: (context,index){
                return SizedBox(height: 2.h,);
              },
            ),
          )
        ],
      ),
    ],
  );
}
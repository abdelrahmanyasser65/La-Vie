import 'package:flutter/material.dart';
import 'package:lavie/bussiness_logic/search/cubit.dart';
import 'package:lavie/presentation/constants/app_colors.dart';
import 'package:lavie/presentation/widgets/default_text.dart';
import 'package:sizer/sizer.dart';
class SearchItems extends StatelessWidget {
  const SearchItems({Key? key, required this.cubit,
    }) : super(key: key);
final SearchCubit cubit;
  @override
  Widget build(BuildContext context) {
    return
      Padding(
        padding: EdgeInsets.only(
          left: 7.w,
          right: 7.w,
        ),
        child: ListView.builder(
          shrinkWrap: true,
          physics: const BouncingScrollPhysics(),
          itemCount: cubit.modelItems.length,
          itemBuilder: (context, index) {
            return  buildContainer(index);
          },
        ),
      );
  }

  Container buildContainer(index) {
    var model=cubit.modelItems;
    return Container(
    margin:  EdgeInsets.only(
      top:  3.h,),
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
                model[index].imageUrl==""?
                  'https://lavie.orangedigitalcenteregypt.com/uploads/51416d55-189c-46bc-9e34-296195d18a94.png':
                    "https://lavie.orangedigitalcenteregypt.com${model[index].imageUrl}"

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
              text: model[index].name,
              fontWeight: FontWeight.w600,
              fontSize: 13.sp,
            ),
            SizedBox(height: 1.5.h,),
            DefaultText(
              text:"${model[index].price}",
              fontWeight: FontWeight.w600,
              fontSize: 14.sp,
              color: AppColors.brand,
            ),
            SizedBox(height: 1.5.h,),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                  primary: AppColors.brand),
              onPressed: () {},
              child: const Text(
                'Add To Cart',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ],
    ),
  );
  }
}

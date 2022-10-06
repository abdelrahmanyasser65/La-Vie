import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lavie/bussiness_logic/feed/cubit.dart';
import 'package:lavie/bussiness_logic/feed/state.dart';
import 'package:lavie/presentation/constants/app_colors.dart';
import 'package:lavie/presentation/constants/images.dart';
import 'package:lavie/presentation/screens/home/feed/createpost_screen.dart';
import 'package:lavie/presentation/screens/search/search_screen.dart';
import 'package:lavie/presentation/widgets/build_itemFeed.dart';
import 'package:lavie/presentation/widgets/build_selectedItemfeed.dart';
import 'package:lavie/presentation/widgets/buildmyfeed.dart';
import 'package:lavie/presentation/widgets/default_text.dart';
import 'package:lavie/presentation/widgets/navigetor.dart';
import 'package:lavie/presentation/widgets/retery.dart';
import 'package:sizer/sizer.dart';
class FeedScreen extends StatelessWidget {
  const FeedScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<FeedCubit,FeedState>(
    listener: (context,state){},
    builder: (context,state){
      var cubit=BlocProvider.of<FeedCubit>(context);

     return  Scaffold(
        body:


        Stack(
          alignment: AlignmentDirectional.bottomEnd,
          children: [
            Column(
              children: [
                buildAppBar( "Discussion Forums",(){}
                ),
                buildSearch(context),
                buildSelected(cubit),
                (cubit.allForumsModel ==null)?
                const Center(child: CircularProgressIndicator())
               :((state is GetAllFeedErrorState ||state is GetMyFeedErrorState)?
                Center(
                    child: RETRY(
                      function: (){
                        cubit.getAllForums();
                        cubit.getMyForums();
                      },

                    ))
                :buildFeeds(cubit)
                ) ,

              ],
            ),
            buildAddPost(context),
          ],
        ),

      );
    },
    );
  }

  SizedBox buildFeeds(cubit) {
    var model=cubit.selectedItemHomeScreen==0?
    cubit.allForumsModel:cubit.forumsModel
    ;
    return SizedBox(
                height: 63.h,
                child: ListView.separated(
                  physics:const BouncingScrollPhysics(),
                    itemBuilder: (context,index){
                      return
                        cubit.selectedItemHomeScreen==0?
                            buildAllItemsFeed(model, index):
                        buildMyItemsFeed(model,index);
                    },
                    separatorBuilder: (context,index){
                      return SizedBox(height: 2.h,);
                    },
                    itemCount: model.data.length),
              );
  }

  Padding buildSelected(FeedCubit cubit) {
    return Padding(
                padding: EdgeInsets.only(
                    left: 5.w,right: 5.w,
                    top: 5.h,bottom: 1.h
                ),
                child: Row(
                  children: [
                    InkWell(
                      onTap: (){
                        cubit.changeItemHomeScreen(0);
                      },
                      child: selectedItemFeed(
                        select: cubit.selectedItemHomeScreen==0,
                        text: 'All Forums',
                        height: 4.3.h,

                      ),
                    ),
                    SizedBox(width: 2.w,),
                    InkWell(
                      onTap: (){
                        cubit.changeItemHomeScreen(1);
                      },
                      child:  selectedItemFeed(
                        select: cubit.selectedItemHomeScreen==1,
                        text: 'My forums',
                        height: 4.3.h,

                      ),
                    ),
                  ],
                ),
              );
  }

  Padding buildAddPost(context) {
    return Padding(
            padding: EdgeInsets.symmetric(
              vertical: 10.h,
              horizontal: 5.w
            ),
            child: FloatingActionButton(
              onPressed: (){
                NavigetorApp.navigatorTo(context,const CreatePostScreen());
              },elevation: 0,
              child:const Icon(Icons.add),
            ),
          );
  }

  InkWell buildSearch(context) {
    return InkWell(
      onTap: (){
        NavigetorApp.navigatorTo(context,const SearchScreen());
      },
      child: Container(
                  margin: EdgeInsets.symmetric(
                      horizontal: 5.w
                  ),
                  width:double.infinity,
                  height: 6.h,
                  decoration: BoxDecoration(
                      borderRadius:
                      BorderRadius.circular(10),
                      color:
                      Colors.black.withOpacity(0.04)),
                  child: Row(
                    children: [
                      SizedBox(
                        width: 5.w,
                      ),
                      SvgPicture.asset(search),
                      SizedBox(
                        width: 2.w,
                      ),
                      Text(
                        "Search",
                        style: TextStyle(
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w400,
                            color: AppColors.text),
                      )
                    ],
                  ),
                ),
    );
  }

  Padding buildAppBar(text,onTap) {
    return Padding(
                padding: EdgeInsets.only(
                    top:8.h,
                    bottom: 5.h,
                    left: 9.w
                ),
                child: Center(
                    child: Row(
                      children: [
                        InkWell(
                            onTap: onTap,
                            child: const Icon(Icons.arrow_back_ios)),
                        SizedBox(width: 15.w,),
                        DefaultText(
                          text:text,
                          fontWeight: FontWeight.bold,
                          fontSize: 17.sp,
                        ),
                      ],
                    )
                ),
              );
  }

}

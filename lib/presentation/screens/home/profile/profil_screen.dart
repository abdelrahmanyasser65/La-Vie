import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lavie/bussiness_logic/home/cubit.dart';
import 'package:lavie/bussiness_logic/home/state.dart';
import 'package:lavie/presentation/constants/app_colors.dart';
import 'package:lavie/presentation/constants/images.dart';
import 'package:lavie/presentation/screens/home/profile/edit_email.dart';
import 'package:lavie/presentation/screens/home/profile/edit_name.dart';
import 'package:lavie/presentation/widgets/default_button.dart';
import 'package:lavie/presentation/widgets/default_image.dart';
import 'package:lavie/presentation/widgets/default_text.dart';
import 'package:lavie/presentation/widgets/logout.dart';
import 'package:lavie/presentation/widgets/navigetor.dart';
import 'package:lavie/presentation/widgets/retery.dart';
import 'package:sizer/sizer.dart';

import '../../../widgets/build_card_profile.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit,HomeState>(
      listener: (context,state){},
      builder: (context,state){
        var cubit=BlocProvider.of<HomeCubit>(context);
        var model=cubit.userModel!.data;
        var size=MediaQuery.of(context).size;
        return state is GetUserDataLoadingState?
           const Center(
              child: CircularProgressIndicator(),
            ):(
        state is GetUserDataErrorState?
        Center(
            child: RETRY(
              function: (){
                cubit.getUserData();
              },
              size: size,
            )):
        Scaffold(
            body: Stack(
              children: [
                Stack(
                  children: [
                    Image.network(
                      model.imageUrl,
                      height: 50.h,
                      width:double.infinity,
                      fit: BoxFit.cover,
                    ),
                    Container(
                      color: Colors.black.withOpacity(0.75),
                      height: 43.4.h,
                      child: Column(
                        children: [
                          Padding(
                            padding: EdgeInsets.symmetric(
                              // top: 40, left: 24, right: 24, bottom: 20
                                vertical: 5.h,
                                horizontal: 4.w
                            ),
                            child: Row(
                              children: [
                                IconButton(
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                    icon: DefaultImage(
                                      image: vector,
                                      width: 3.w,
                                      height: 2.h,
                                    )),
                                const Spacer(),
                                IconButton(
                                    onPressed: () {},
                                    icon: Icon(
                                      Icons.more_horiz,
                                      color: Colors.white,
                                      size: 3.h,
                                    ))
                              ],
                            ),
                          ),
                          Container(
                            width: 35.w,
                            height: 19.h,
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                image: DecorationImage(image:
                                NetworkImage(model.imageUrl),
                                    fit: BoxFit.cover)
                            ),

                          ),

                          Text(
                            "${model.firstName} ${model.lastName}",
                            style: TextStyle(
                              fontSize: 20.sp,
                              fontWeight: FontWeight.w700,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
                Container(
                    margin: EdgeInsets.only(
                        top: 41.5.h
                    ),
                    height: 60.h,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.white
                    ),
                    padding: EdgeInsets.symmetric(
                        vertical: 4.h,
                        horizontal: 6.w
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          margin: EdgeInsets.only(
                              bottom: 3.h
                          ),
                          padding: EdgeInsets.all(2.h),
                          decoration:BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: AppColors.second
                          ),
                          child: Row(
                            children: [
                              DefaultImage(
                                  image: stars,
                                  height: 5.h,
                                  width: 5.w),
                              SizedBox(
                                width: 4.5.w,
                              ),
                              DefaultText(
                                text: 'You have ${
                                    model.userPoints ?? "0"
                                } points',
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w500,
                              )
                            ],
                          ),
                        ),
                        DefaultText(
                          text: "Edit Profile",
                          fontWeight: FontWeight.bold,
                          fontSize: 15.sp,
                        ),

                        CardProfile(
                          text: "Change Name",
                          function: (){
                            NavigetorApp.navigatorTo(context, ChangeNameScreen());
                          },
                        ),
                        CardProfile(
                            text: "Change Email",
                            function: (){
                              NavigetorApp.navigatorTo(context, ChangeEmailScreen());
                            }),
                        SizedBox(
                          height: 1.3.h,
                        ),
                        DefaultButton(
                            text: "Log Out",
                            textColor: AppColors.white,
                            onPressed: (){
                              showDialog(
                                  context: context,
                                  builder: (context)=>const LogoutScreen());
                            },
                            height: 6.h,
                            width: double.infinity,
                            radius: 10,
                            fontSize: 15.sp,
                            primary: AppColors.brand)
                      ],
                    )
                ),
              ],
            )
        )
        );
      }
    );
  }
}

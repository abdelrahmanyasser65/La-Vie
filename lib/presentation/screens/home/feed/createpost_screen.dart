import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lavie/bussiness_logic/feed/cubit.dart';
import 'package:lavie/bussiness_logic/feed/state.dart';
import 'package:lavie/presentation/app_layout/app_layout.dart';
import 'package:lavie/presentation/constants/app_colors.dart';
import 'package:lavie/presentation/screens/home/feed/feed_screen.dart';
import 'package:lavie/presentation/widgets/default_button.dart';
import 'package:lavie/presentation/widgets/default_formFiled.dart';
import 'package:lavie/presentation/widgets/default_text.dart';
import 'package:lavie/presentation/widgets/navigetor.dart';
import 'package:sizer/sizer.dart';

class CreatePostScreen extends StatelessWidget {
  const CreatePostScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<FeedCubit, FeedState>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = BlocProvider.of<FeedCubit>(context);
        return Scaffold(
          body: ListView(
            children: [
              const FeedScreen().buildAppBar('Create New Post', () {
                Navigator.pop(context);
              }),
              Center(
                child: cubit.postImage == null
                    ? InkWell(
                  onTap: (){

                      showModalBottomSheet(
                          context: context,
                          builder: (context) {
                            return buildBottomSheet(() {
                              cubit.tackPostImage().then((value) {
                                Navigator.pop(context);
                              });
                            }, () {
                              cubit.getPostImage().then((value) {
                                Navigator.pop(context);
                              });
                            });
                          });

                  },
                      child: Container(
                          height: 17.h,
                          width: 35.w,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              border:
                                  Border.all(width: 1, color: AppColors.brand)),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.add,
                                color: AppColors.brand,
                                size: 25.sp,
                              ),
                              SizedBox(
                                height: 2.h,
                              ),
                              DefaultText(
                                  text: "Add photo",
                                  fontWeight: FontWeight.w500,
                                  fontSize: 12.sp,
                                  color: AppColors.brand)
                            ],
                          ),
                        ),
                    )
                    : SizedBox(
                        height: 17.h,
                        width: 35.w,
                        child:
                Stack(
                  alignment: AlignmentDirectional.topEnd,
                  children: [
                    Image(image: FileImage(cubit.postImage!)),
                    IconButton(
                        onPressed: (){
                          cubit.removePostImage();
                        },
                        icon:const CircleAvatar(
                            radius: 20,
                            child: Icon(Icons.close,size: 16,))),
                  ],
                )
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 7.w, vertical: 4.h),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    DefaultFiled(
                      text: "Title",
                      controller: cubit.titleController,
                      type: TextInputType.text,
                      onChanged: (val) {},
                      obscureText: false,
                    ),
                    SizedBox(
                      height: 4.h,
                    ),
                    DefaultFiled(
                      text: "Description",
                      controller: cubit.descriptionController,
                      type: TextInputType.text,
                      onChanged: (val) {},
                      obscureText: false,
                      maxLines: 5,
                      height: 15.h,
                    ),
                    SizedBox(
                      height: 4.h,
                    ),
                    DefaultButton(
                        text: "Post",
                        textColor: AppColors.white,
                        onPressed: () async{
                           cubit.postNewPost();
                           NavigetorApp.navigatorAndFinish(context, AppLayout());
                        },
                        height: 6.h,
                        width: double.infinity,
                        radius: 13,
                        fontSize: 15.sp,
                        primary: AppColors.brand)
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Container buildBottomSheet(onTap1, onTap2) {
    return Container(
      height: 120,
      padding: const EdgeInsets.all(12),
      color: Colors.blueGrey,
      child: Column(
        children: [
          InkWell(
            onTap: onTap1,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  height: 40,
                  width: 40,
                  decoration: const BoxDecoration(
                      shape: BoxShape.circle, color: Colors.black45),
                  child: const Icon(
                    Icons.camera_alt,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                const Text(
                  "Tack Photo",
                  style: TextStyle(
                      fontSize: 16,
                      color: Colors.white,
                      fontWeight: FontWeight.w600),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          InkWell(
            onTap: onTap2,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  height: 40,
                  width: 40,
                  decoration: const BoxDecoration(
                      shape: BoxShape.circle, color: Colors.black45),
                  child: const Icon(
                    Icons.file_copy,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                const Text(
                  "Upload Photo",
                  style: TextStyle(
                      fontSize: 16,
                      color: Colors.white,
                      fontWeight: FontWeight.w600),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lavie/bussiness_logic/home/cubit.dart';
import 'package:lavie/bussiness_logic/home/state.dart';
import 'package:lavie/presentation/constants/app_colors.dart';
import 'package:lavie/presentation/widgets/default_button.dart';
import 'package:lavie/presentation/widgets/default_formFiled.dart';
import 'package:lavie/presentation/widgets/default_text.dart';
import 'package:sizer/sizer.dart';
class ChangeEmailScreen extends StatelessWidget {
  ChangeEmailScreen({Key? key}) : super(key: key);
  final emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit,HomeState>(
      listener: (context,state){},
      builder: (context,state){
        var cubit=BlocProvider.of<HomeCubit>(context);
        emailController.text=cubit.userModel!.data.email;
        return Scaffold(
          appBar: AppBar(
            elevation: 0,
            centerTitle: true,
            backgroundColor: AppColors.white,
            title: DefaultText(
              text: "Change Email",
              fontWeight: FontWeight.bold,
              fontSize: 18.sp,
              color: AppColors.black,
            ),
          ),
          backgroundColor: AppColors.white,
          body: ListView(
            padding: EdgeInsets.symmetric(
                vertical: 15.h,
                horizontal: 8.w
            ),
            children: [
              DefaultFiled(
                  text: "Email",
                  controller: emailController,
                  obscureText: false,
                  type: TextInputType.name,
                  onChanged: (val){}),
              SizedBox(height: 5.h,),
              DefaultButton(
                  text: "Change",
                  textColor: AppColors.white,
                  onPressed: (){


                  },
                  height: 6.h,
                  width: double.infinity,
                  radius: 10,
                  fontSize: 14.sp,
                  primary: AppColors.brand)
            ],
          ),
        );
      },
    );
  }
}

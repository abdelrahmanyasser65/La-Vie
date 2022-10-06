import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lavie/bussiness_logic/auth/cubit.dart';
import 'package:lavie/bussiness_logic/home/cubit.dart';
import 'package:lavie/bussiness_logic/home/state.dart';
import 'package:lavie/presentation/constants/app_colors.dart';
import 'package:lavie/presentation/constants/constants.dart';
import 'package:lavie/presentation/widgets/default_button.dart';
import 'package:lavie/presentation/widgets/default_formFiled.dart';
import 'package:lavie/presentation/widgets/default_text.dart';
import 'package:sizer/sizer.dart';
class ChangeNameScreen extends StatelessWidget {
   ChangeNameScreen({Key? key}) : super(key: key);
   final firstNameController = TextEditingController();
   final lastNameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var size=MediaQuery.of(context).size;
    return BlocConsumer<HomeCubit,HomeState>(
    listener: (context,state){},
    builder: (context,state){
      var cubit=BlocProvider.of<HomeCubit>(context);
      firstNameController.text=cubit.userModel!.data.firstName;
      lastNameController.text=cubit.userModel!.data.lastName;
      return Scaffold(
        appBar: AppBar(
          elevation: 0,
          centerTitle: true,
          backgroundColor: AppColors.white,
          title: DefaultText(
            text: "Change Name",
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

                text: "First Name",
                controller: firstNameController,
                obscureText: false,
                type: TextInputType.name,
                onChanged: (val){}),
            SizedBox(
              height: 4.h,
            ),
            DefaultFiled(
                text: "Last Name",
                controller: lastNameController,
                obscureText: false,
                type: TextInputType.name,
                onChanged: (val){}),
            SizedBox(height: 5.h,),
            DefaultButton(
                text: "Change",
                textColor: AppColors.white,
                onPressed: (){

                  cubit.changeName(
                    firstName: firstNameController.text,
                    lastName: lastNameController.text
                  );
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

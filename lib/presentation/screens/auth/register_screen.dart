import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../bussiness_logic/auth/cubit.dart';
import '../../../bussiness_logic/auth/state.dart';
import '../../constants/app_colors.dart';
import '../../widgets/build_continue.dart';
import '../../widgets/default_button.dart';
import '../../widgets/default_formFiled.dart';
class RegisterScreen extends StatelessWidget {
  const RegisterScreen({Key? key, required this.size}) : super(key: key);
final Size size;
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit,AuthState>(
      listener: (context,state){},
      builder: (context,state){
        var cubit=BlocProvider.of<AuthCubit>(context);
        return Padding(
          padding: EdgeInsets.symmetric(
              horizontal: size.width / 12),
          child: Column(
            children: [
              Row(
                children: [
                  Expanded(child: DefaultFiled(

                      text: 'First Name',
                      controller: cubit.firstNameController,
                      obscureText: false,
                      type: TextInputType.name,
                      onChanged: (val) {}),),
                  SizedBox(width:size.width/30,),
                  Expanded(child: DefaultFiled(
                      text: 'Last Name',
                      controller: cubit.lastNameController,
                      obscureText: false,
                      type: TextInputType.name,
                      onChanged: (val) {}),),

                ],
              ),
              SizedBox(
                height: size.height / 40,
              ),
              DefaultFiled(

                  text: 'E-mail',
                  controller: cubit.rEmailController,
                  obscureText: false,
                  type: TextInputType.emailAddress,
                  onChanged: (val) {}),
              SizedBox(
                height: size.height / 40,
              ),
              DefaultFiled(

                  text: 'Password',
                  controller: cubit.rPasswordController,
                  obscureText: true,
                  type: TextInputType.visiblePassword,
                  onChanged: (val) {}),
              SizedBox(
                height: size.height / 40,
              ),
              DefaultFiled(
                  text: 'Confirm password',
                  controller: cubit.rCPasswordController,
                  obscureText: true,
                  type: TextInputType.visiblePassword,
                  onChanged: (val) {}),
              SizedBox(
                height: size.height / 30,
              ),
              DefaultButton(
                  text: "Sign Up",
                  textColor: AppColors.white,
                  onPressed: (){
                    cubit.validationReg(context);

                  },
                  height: size.height/17,
                  width: size.height/2,
                  radius: 5,
                  fontSize: size.width*0.05,
                  primary: AppColors.brand),
              BuildContinue(size: size)
            ],
          ),
        );
      },
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lavie/bussiness_logic/auth/cubit.dart';
import 'package:lavie/bussiness_logic/auth/state.dart';
import '../../constants/app_colors.dart';
import '../../widgets/build_continue.dart';
import '../../widgets/default_button.dart';
import '../../widgets/default_formFiled.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key, required this.size}) : super(key: key);
  final Size size;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state) {
      },
      builder: (context, state) {
        var cubit = BlocProvider.of<AuthCubit>(context);
        return Padding(
          padding: EdgeInsets.symmetric(horizontal: size.width / 12),
          child: Column(
            children: [
              DefaultFiled(
                  text: 'Email',
                  controller: cubit.emailController,
                  obscureText: false,
                  type: TextInputType.emailAddress,
                  onChanged: (val) {}),
              SizedBox(
                height: size.height / 35,
              ),
              DefaultFiled(
                  text: 'Password',
                  controller: cubit.passwordController,
                  obscureText: true,
                  type: TextInputType.visiblePassword,
                  onChanged: (val) {}),
              SizedBox(
                height: size.height / 35,
              ),
              DefaultButton(
                  text: "Login",
                  textColor: AppColors.white,
                  onPressed: () {

                    cubit.validationLogin(context);
                  },
                  height: size.height / 17,
                  width: size.height / 2,
                  radius: 5,
                  fontSize: size.width * 0.05,
                  primary: AppColors.brand),
              BuildContinue(size: size)
            ],
          ),
        );
      },
    );
  }
}

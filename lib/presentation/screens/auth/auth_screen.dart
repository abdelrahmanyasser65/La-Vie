import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lavie/bussiness_logic/auth/cubit.dart';
import 'package:lavie/bussiness_logic/auth/state.dart';
import 'package:lavie/presentation/constants/images.dart';
import 'package:lavie/presentation/screens/auth/login_screen.dart';
import 'package:lavie/presentation/screens/auth/register_screen.dart';
import 'package:lavie/presentation/widgets/buildTextFormFiled.dart';
import 'package:lavie/presentation/widgets/build_continue.dart';
import 'package:lavie/presentation/widgets/build_divder.dart';
import 'package:lavie/presentation/widgets/default_button.dart';
import 'package:lavie/presentation/widgets/default_formFiled.dart';
import 'package:lavie/presentation/widgets/default_image.dart';
import 'package:lavie/presentation/widgets/default_text.dart';

import '../../constants/app_colors.dart';

class AuthScreen extends StatelessWidget {
  const AuthScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = BlocProvider.of<AuthCubit>(context);
        return Scaffold(
          backgroundColor: AppColors.white,
          body: ListView(
            children: [
              Padding(
                padding: EdgeInsets.only(left: size.width / 1.5),
                child: DefaultImage(
                  image: leafTop,
                  height: size.height / 5.5,
                  width: size.width / 5.5,
                ),
              ),
              Center(
                child: DefaultImage(
                  image: logo,
                  height: size.height / 18,
                  width: size.width / 18,
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                    vertical: size.height / 25, horizontal: size.width / 8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    InkWell(
                      onTap: () {
                        cubit.changeSign();
                      },
                      child: Column(
                        children: [
                          DefaultText(
                            text: 'Sign Up',
                            fontSize: size.width * 0.04,
                            color: cubit.isLogin
                                ? AppColors.grey
                                : AppColors.brand,
                            fontWeight: cubit.isLogin
                                ? FontWeight.w500
                                : FontWeight.bold,
                          ),
                          cubit.isLogin ? Container() : buildDivider()
                        ],
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        cubit.changeLogin();
                      },
                      child: Column(
                        children: [
                          DefaultText(
                            text: 'Login',
                            fontWeight: cubit.isLogin
                                ? FontWeight.bold
                                : FontWeight.w500,
                            fontSize: size.width * 0.04,
                            color: cubit.isLogin
                                ? AppColors.brand
                                : AppColors.grey,
                          ),
                          cubit.isLogin ? buildDivider() : Container(),
                        ],
                      ),
                    )
                  ],
                ),
              ),
              cubit.isLogin
                  ? LoginScreen(size: size)
                  : RegisterScreen(size: size),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  DefaultImage(
                    image: leafBottom,
                    height: size.height / 5.5,
                    width: size.width / 5.5,
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }

  Container buildDivider() {
    return Container(
      margin: const EdgeInsets.only(top: 5),
      height: 3,
      width: 40,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        color: AppColors.brand,
      ),
    );
  }
}

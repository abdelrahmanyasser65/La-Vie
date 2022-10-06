import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lavie/bussiness_logic/auth/state.dart';
import 'package:lavie/data/local/cache_helper.dart';
import 'package:lavie/data/models/login_model.dart';
import 'package:lavie/data/models/register_model.dart';
import 'package:lavie/data/remote/dio_helper.dart';
import 'package:lavie/presentation/app_layout/app_layout.dart';
import 'package:lavie/presentation/constants/app_colors.dart';
import 'package:lavie/presentation/constants/end_points.dart';
import 'package:lavie/presentation/widgets/default_toast.dart';

import '../../presentation/constants/constants.dart';
import '../../presentation/widgets/navigetor.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() :super(AuthInitialState());

  static AuthCubit get(context) => BlocProvider.of(context);
  bool isLogin = true;
  bool isSign = false;

  void changeLogin() {
    isLogin = true;
    isSign = false;
    emit(ChangeLoginState());
  }

  void changeSign() {
    isSign = true;
    isLogin = false;
    emit(ChangeSignState());
  }

  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  LoginModel ?loginModel;

  Future postLogin(context) async {
    var json = {
      'email': emailController.text,
      'password': passwordController.text,
    };
    emit(LoginLoadingState());
    DioHelper.postData(

        url: loginEndPoint, data: json).then((value){
      if(value.statusCode==200){
        loginModel=LoginModel.fromJson(value.data);
        buildToast(
          text: loginModel!.message,
          color: AppColors.green,
        );
        CachHelper.put(key: 'token', value: loginModel!.data.accessToken)
            .then((value) {
          token=loginModel!.data.accessToken;

        });
        NavigetorApp.navigatorAndFinish(context, AppLayout());
        emailController.text='';
        passwordController.text='';
      }

      emit(LoginSuccessState());
    } ).catchError((e){
      buildToast(
          text:  'Incorrect Email or Password',
          color: AppColors.red
      );
      emit(LoginErrorState());
    });
  }
  void validationLogin(context){
    if(emailController.text.isEmpty){
      buildToast(
        text: "Enter Your Email",
        color: AppColors.red
      );
    }
    else if(passwordController.text.length<8){
      buildToast(
        text: "Short Password",
        color: AppColors.red
      );
    }
    else{
      postLogin(context);
    }

  }

  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();
  final rEmailController = TextEditingController();
  final rPasswordController = TextEditingController();
  final rCPasswordController = TextEditingController();
  RegExp regex =
  RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$');
  void validationReg(context){

    if(firstNameController.text.isEmpty){
      buildToast(
        text: "Enter Your First Name",
        color: AppColors.red
      );
    }
    else if(lastNameController.text.isEmpty){
      buildToast(
        text: "Enter Your Last Name",
        color: AppColors.red
      );
    }
    else if(rEmailController.text.isEmpty){
      buildToast(
        text: "Enter Your Email",
        color: AppColors.red
      );
    }
    else if(rPasswordController.text.length<8){
      buildToast(
        text: "Short Password",
        color: AppColors.red
      );
    }
    else if (!regex.hasMatch(rPasswordController.text)){
      buildToast(
        text: "Password too weak",
        color: AppColors.red,
      );
    }
    else if(rCPasswordController.text!=rPasswordController.text){
      buildToast(
        text: "Confirm Password is not right",
        color: AppColors.red,
      );
    }
    else{
      postSignUp(context);
    }
  }
  RegisterModel ?registerModel;
  Future postSignUp(context)async{
    var json = {
      'firstName': firstNameController.text,
      'lastName': lastNameController.text,
      'email':rEmailController.text,
      'password':rPasswordController.text,
    };
    emit(SignUpLoadingState());
    DioHelper.postData(
        url: registerEndPoint,
        data: json).then((value){
      if(value.statusCode==200){
        registerModel=RegisterModel.fromJson(value.data);
        buildToast(
          text: registerModel!.message,
          color: AppColors.green,
        );

        NavigetorApp.navigatorAndFinish(context, AppLayout());
        firstNameController.text='';
        lastNameController.text='';
        rEmailController.text='';
        rPasswordController.text='';
        rCPasswordController.text='';
        CachHelper.put(key: 'token', value: registerModel!.data.accessToken)
            .then((value) {
          token=registerModel!.data.accessToken;

        });
      }
      emit(SignUPSuccessState());


    }).catchError((e){
      buildToast(
          text: "Email already Exists",
          color: AppColors.red
      );
   emit(SignUpErrorState());
    });
  }

}
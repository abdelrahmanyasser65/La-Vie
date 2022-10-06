
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lavie/bolcobserver.dart';
import 'package:lavie/bussiness_logic/auth/cubit.dart';
import 'package:lavie/bussiness_logic/feed/cubit.dart';
import 'package:lavie/bussiness_logic/home/cubit.dart';
import 'package:lavie/bussiness_logic/scan/cubit.dart';
import 'package:lavie/bussiness_logic/search/cubit.dart';
import 'package:lavie/data/local/cache_helper.dart';
import 'package:lavie/data/local/sql_helper.dart';
import 'package:lavie/data/remote/dio_helper.dart';
import 'package:lavie/presentation/app_layout/app_layout.dart';
import 'package:lavie/presentation/constants/app_colors.dart';
import 'package:lavie/presentation/constants/constants.dart';
import 'package:lavie/presentation/screens/auth/auth_screen.dart';
import 'package:lavie/presentation/screens/auth/splash_screen.dart';
import 'package:sizer/sizer.dart';
void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  DioHelper.init();
  await CachHelper.init();
  HelperSql.initialDB();
  Bloc.observer=MyBlocObserver();
  token=CachHelper.get(key: "token")??"";
  Widget? startWidget;

  if(token==""){
    startWidget=const AuthScreen();
  }else{
   startWidget= AppLayout();
  }
  runApp( MyApp(
    startWidget: startWidget,
  ));

}

class MyApp extends StatelessWidget {
  const MyApp({Key? key,required  this.startWidget}) : super(key: key);
final Widget startWidget;
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers:[
        BlocProvider(
          create: (context)=>AuthCubit(),
        ),
        BlocProvider(
          create: (context)=>HomeCubit()..getAllProductData()..getToolsData()
          ..getPlantsData()
            ..getSeedsData()..getUserData(),
        ),
        BlocProvider(
          create: (context)=>FeedCubit()..getMyForums()
            ..getAllForums(),
        ),
        BlocProvider(
          create: (context)=>ScanCubit()..getAllBlogs(context)
        ),
        BlocProvider(
            create: (context)=>SearchCubit()
        ),
      ],
      child: Sizer(

        builder: (context,s,t){
          return MaterialApp(
              debugShowCheckedModeBanner: false,
              title: 'La Vie',
              theme: ThemeData(
                primaryColor: AppColors.brand,
                primarySwatch: Colors.green,
              ),
              home:
             SplashScreen( startScreen: startWidget)
          );
        },
      ),
    );
  }
}


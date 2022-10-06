import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lavie/bussiness_logic/home/cubit.dart';
import 'package:lavie/bussiness_logic/home/state.dart';
import 'package:lavie/presentation/constants/images.dart';
import 'package:lavie/presentation/screens/home/feed/feed_screen.dart';
import 'package:lavie/presentation/screens/home/home_screen.dart';
import 'package:lavie/presentation/screens/home/notification_screen.dart';
import 'package:lavie/presentation/screens/home/profile/profil_screen.dart';
import 'package:lavie/presentation/screens/home/scan/qr_screen.dart';
class AppLayout extends StatelessWidget {
    AppLayout({Key? key}) : super(key: key);
  final List screens=const [
    FeedScreen(),
    QRScreen(),
    HomeScreen(),
     NotificationScreen(),
    ProfileScreen()
  ];
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit,HomeState>(
    listener: (context,state){},
    builder: (context,state){
      var cubit=BlocProvider.of<HomeCubit>(context);
      return Scaffold(
        extendBody: true,
        body: screens[cubit.index],
        bottomNavigationBar: CurvedNavigationBar(
          backgroundColor: Colors.transparent,
          buttonBackgroundColor: Colors.green,
          color: Colors.white,
          height: 60,
          index: cubit.index,
          items: [
            SvgPicture.asset(leaveNav,
              color: cubit.index==0?Colors.white:Colors.black,),
            SvgPicture.asset(qrScan,
              color: cubit.index==1?Colors.white:Colors.black,),
            SvgPicture.asset(home,
              color: cubit.index==2?Colors.white:Colors.black,),
            SvgPicture.asset(notification,
              color: cubit.index==3?Colors.white:Colors.black,),
            SvgPicture.asset(profile,
              color: cubit.index==4?Colors.white:Colors.black,),
          ],
          onTap: (val){
            cubit.changeBottomNav(val);
          },
        ),
      );
    },
    );
  }
}

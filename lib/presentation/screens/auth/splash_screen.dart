import 'package:flutter/material.dart';
import 'package:lavie/presentation/constants/app_colors.dart';
import 'package:lavie/presentation/constants/images.dart';
import 'package:lavie/presentation/widgets/default_image.dart';
import 'package:lavie/presentation/widgets/navigetor.dart';
class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key, required this.startScreen}) : super(key: key);
final Widget startScreen;
  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState (){
    super.initState();
    Future.delayed(const Duration(seconds: 3),
        (){
          NavigetorApp.navigatorTo(context,widget.startScreen);
        }
    );
  }
  @override
  Widget build(BuildContext context) {
    var size=MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: AppColors.white,
      body: Center(
        child: DefaultImage(
          image: logo,
          height:size.height/15 ,
          width: size.width/15,
        ),

      ),
    );
  }
}


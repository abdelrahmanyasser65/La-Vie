import 'package:flutter/material.dart';
import 'package:lavie/data/local/cache_helper.dart';
import 'package:lavie/presentation/constants/app_colors.dart';
import 'package:lavie/presentation/screens/auth/login_screen.dart';
import 'package:lavie/presentation/widgets/default_button.dart';
import 'package:lavie/presentation/widgets/default_text.dart';

import 'navigetor.dart';
class LogoutScreen extends StatelessWidget {
  const LogoutScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size=MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white.withOpacity(0),
      body: Center(
        child: Container(
          padding: EdgeInsets.all(
              size.width*0.05
          ),
          height: size.height/4.5,
          width: size.width/1.3,
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(5)
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              DefaultText(
                text: "Logout",
                fontWeight: FontWeight.w500,
                fontSize: size.width*0.06,
              ),
              SizedBox(height: size.height/40,),
              DefaultText(
                text: "Are you sure ?",
                fontWeight: FontWeight.w400,
                fontSize: size.width*0.05,
              ),
              SizedBox(height: size.height/30,),
              Row(
                children: [
                  Expanded(
                    child: DefaultButton(
                    textColor:    Colors.white,
                    height:    size.height/20,
                     fontSize:   size.width*0.034,
                      radius:  7,
                       primary: AppColors.brand,
                     width:   size.width/10,
                     text:   'cancel',
                       onPressed:     (){
                          Navigator.pop(context);
                        },

                    ),
                  ),
                  const SizedBox(width: 10,),
                  Expanded(
                    child: DefaultButton(
                      text:'sure',
                       textColor:AppColors.white,
                       fontSize:size.width*0.042,
                        height:size.height/20,
                        radius:7,
                       primary: AppColors.brand,
                       width: size.width/10,
                       onPressed: (){
                         NavigetorApp.navigatorAndFinish(context, LoginScreen(size: size));

                         CachHelper.removeData(key: 'token');
                       } ,

                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

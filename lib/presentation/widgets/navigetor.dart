import 'package:flutter/material.dart';
class NavigetorApp{
  static void navigatorTo(context,widget)=>
      Navigator.push(context, MaterialPageRoute(builder: (context)=>widget));

static void navigatorAndFinish(context,widget)=>
    Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=>widget), (route) => false);
}
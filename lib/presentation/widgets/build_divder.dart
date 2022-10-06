import 'package:flutter/material.dart';
class BuildDivider extends StatelessWidget {
  const BuildDivider({Key? key, required this.color}) : super(key: key);
final Color color;
  @override
  Widget build(BuildContext context) {
    return
      Container(
        height: 1,
        margin:const EdgeInsets.only(
         left: 7
        ),
        color:color,

      );
  }

}
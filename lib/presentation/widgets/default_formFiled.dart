import 'package:flutter/material.dart';
import 'package:lavie/presentation/constants/app_colors.dart';
import 'package:lavie/presentation/widgets/buildTextFormFiled.dart';
import 'package:lavie/presentation/widgets/default_text.dart';
import 'package:sizer/sizer.dart';
class DefaultFiled extends StatelessWidget {
 const  DefaultFiled({Key? key, required this.text, required this.controller, required this.obscureText, required this.type, required this.onChanged,  this.maxLines=1,
    this.height}) : super(key: key);
  final int maxLines;
  final String text;
  final TextEditingController controller;
  final bool obscureText;
  final TextInputType type;
  final Function(String) onChanged;
  final double? height;
  @override
  Widget build(BuildContext context) {
    var size=MediaQuery.of(context).size;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        DefaultText(
          text: text,
          color: AppColors.text,
          fontWeight: FontWeight.w600,
          fontSize: size.width*0.04,
        ),
        SizedBox(height: size.height/130,),
        SizedBox(
          height: height??6.h,
          child: buildTextForm(
            onChanged:onChanged,
            controller: controller,
            obscureText: obscureText,
            type: type,
            maxLines: maxLines

          ),
        ),
      ],
    );
  }
}

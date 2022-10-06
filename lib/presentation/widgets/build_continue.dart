import 'package:flutter/material.dart';
import 'package:lavie/presentation/widgets/build_divder.dart';

import '../constants/app_colors.dart';
import '../constants/images.dart';
import 'default_text.dart';

class BuildContinue extends StatelessWidget {
  const BuildContinue({Key? key, required this.size}) : super(key: key);
  final Size size;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: size.height / 30,
        ),
        Row(
          children: [
             Expanded(child: BuildDivider(
              color:  Colors.grey[500]!,
            )),
            SizedBox(
              width: size.width / 47,
            ),
            DefaultText(
              text: 'or continue with',
              fontSize: size.width * 0.04,
              color: AppColors.grey,
              fontWeight: FontWeight.w500,
            ),
             Expanded(child: BuildDivider(
              color:  Colors.grey[500]!,
            )),
          ],
        ),
        SizedBox(
          height: size.height / 40,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(googlePng),
            SizedBox(width: size.width / 15),
            Image.asset(facebookPng)
          ],
        ),
      ],
    );
  }
}

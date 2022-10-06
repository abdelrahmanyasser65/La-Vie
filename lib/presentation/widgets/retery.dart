import 'package:flutter/material.dart';
import 'package:lavie/presentation/constants/images.dart';
import 'package:lavie/presentation/widgets/default_text.dart';
import 'package:sizer/sizer.dart';
class RETRY extends StatelessWidget {
  const RETRY({Key? key, required this.function,  this.size}) : super(key: key);
final Function() function;
final Size ?size;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(internet),
        TextButton(
            onPressed: function,
            child: DefaultText(
              text: "RETRY",
              fontWeight: FontWeight.bold,
              fontSize: 15.sp,
            ))
      ],
    );
  }
}

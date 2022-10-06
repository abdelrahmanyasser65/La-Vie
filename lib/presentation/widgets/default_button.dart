import 'package:flutter/material.dart';
import 'package:lavie/presentation/widgets/default_text.dart';

class DefaultButton extends StatelessWidget {
  const DefaultButton(
      {Key? key,
      required this.text,
      required this.textColor,
      required this.onPressed,
      required this.height,
      required this.width,
      required this.radius,
      required this.fontSize,
      required this.primary})
      : super(key: key);
  final String text;
  final Color textColor;
  final Function() onPressed;
  final double height;
  final double width;
  final double radius;
  final double fontSize;
  final Color primary;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: onPressed,
        autofocus: true,
        style: ElevatedButton.styleFrom(
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(radius),
          ),
          primary: primary,
        ),
        child: SizedBox(
          height: height,
          width: width,
          child: Center(
            child: DefaultText(
              text: text,
              fontWeight: FontWeight.bold,
              fontSize: fontSize,
              color: textColor,
            ),
          ),
        ));
  }
}

import 'package:flutter/material.dart';

class DefaultText extends StatelessWidget {
  const DefaultText(
      {Key? key,
      required this.text,
      this.color,
      this.maxLines,
      this.fontSize,
      this.fontWeight,
      this.textOverflow})
      : super(key: key);
  final String text;
  final Color? color;
  final int? maxLines;
  final double? fontSize;
  final FontWeight? fontWeight;
  final TextOverflow? textOverflow;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      overflow: textOverflow,
        maxLines: maxLines,
      style: TextStyle(
        fontSize: fontSize,
        fontWeight: fontWeight,
        color: color
      ),
    );
  }
}

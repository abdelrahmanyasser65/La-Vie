import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
class DefaultImage extends StatelessWidget {
  const DefaultImage({
    Key? key, required this.image,
    required this.height, required this.width}) : super(key: key);
final String image;
final double height;
final double width;

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      image,
      height: height,
      width: width,
    );
  }
}

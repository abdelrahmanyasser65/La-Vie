import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

selectedItemsHome({
  required double height,
  required String text,
  required Size size,
  required bool select,
}) {
  return Container(
    margin: EdgeInsets.only(right: size.width / 30),
    padding: EdgeInsets.symmetric(
        vertical: size.height / 120, horizontal: size.width / 23),
    height: height,
    decoration: select
        ? BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(width: 2, color: HexColor('#1ABC00')))
        : BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.black.withOpacity(0.04)),
    child: Center(
      child: Text(
        text,
        style: select
            ? TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w500,
            color: HexColor("#1ABC00"))
            : TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w400,
            color: HexColor("#979797")),
      ),
    ),
  );
}

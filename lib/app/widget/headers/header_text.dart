import 'package:flutter/material.dart';

Widget headerText({
  String text = "",
  Color color = Colors.black,
  FontWeight fontWeight = FontWeight.bold,
  required double? fontSize,
  TextAlign textAlign = TextAlign.justify,
}) {
  return Text(
    text,
    textAlign: textAlign,
    style: TextStyle(
      color: color,
      fontWeight: fontWeight,
      fontSize: fontSize,
    ),
  );
}

import 'package:flutter/material.dart';
import 'package:base_project/app/widget/headers/header_text.dart';
import 'package:base_project/app/utils/size_config.dart';

const shape = StadiumBorder();

Widget createButton({
  required BuildContext context,
  double width = 350,
  double height = 45.0,
  double radius = 15,
  bool isWithIcon = false,
  ImageProvider<Object>? icon,
  required String labelButton,
  Color labelButtonColor = Colors.white,
  double labelFontSize = 15.0,
  Color buttonColor = Colors.blue,
  OutlinedBorder shape = shape,
  Function()? func,
}) {
  return Container(
    width: getProportionateScreenWidth(width),
    height: getProportionateScreenHeight(height),
    margin: const EdgeInsets.only(top: 20.0),
    child: isWithIcon
        ? _raisedButtonWithIcon(
            radius,
            icon,
            labelButton,
            labelButtonColor,
            labelFontSize,
            buttonColor,
            shape,
            func,
          )
        : _raisedButtonNotIcon(
            radius,
            labelButton,
            labelButtonColor,
            labelFontSize,
            buttonColor,
            shape,
            func,
          ),
  );
}

Widget _raisedButtonWithIcon(
  double radius,
  ImageProvider<Object>? icon,
  String labelButton,
  Color labelButtonColor,
  double labelFontSize,
  Color color,
  OutlinedBorder shape,
  Function()? func,
) {
  return ElevatedButton(
    onPressed: func,
    style: ElevatedButton.styleFrom(
      shape: shape,
      backgroundColor: color,
      elevation: 0.5,
    ),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image(
          image: icon ?? const NetworkImage(""),
          width: getProportionateScreenWidth(20),
          height: getProportionateScreenHeight(20),
        ),
        Container(
          margin: const EdgeInsets.only(left: 10.0),
          child: headerText(
            text: labelButton,
            color: labelButtonColor,
            fontSize: labelFontSize,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    ),
  );
}

Widget _raisedButtonNotIcon(
  double radius,
  String labelButton,
  Color labelButtonColor,
  double labelFontSize,
  Color color,
  OutlinedBorder shape,
  Function()? func,
) {
  return ElevatedButton(
    onPressed: func,
    style: ElevatedButton.styleFrom(
      shape: shape,
      backgroundColor: color,
      elevation: 0.5,
    ),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          margin: const EdgeInsets.only(left: 10.0),
          child: headerText(
            text: labelButton,
            color: labelButtonColor,
            fontSize: labelFontSize,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    ),
  );
}

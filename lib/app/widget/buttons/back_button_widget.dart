import 'package:flutter/material.dart';

Widget backButtonWidget({
  required BuildContext context,
  required Color color,
}) {
  return IconButton(
      icon: Icon(
        Icons.arrow_back,
        color: color,
        size: 28.0,
      ),
      onPressed: () {
        Navigator.pop(context);
      });
}

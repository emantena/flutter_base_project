import 'package:base_project/app/theme/app_collor.dart';
import 'package:base_project/app/utils/size_config.dart';
import 'package:base_project/app/widget/headers/header_text.dart';
import 'package:flutter/material.dart';

Widget loader({text = "Carregando..."}) {
  return Column(
    children: [
      Stack(
        children: [
          Center(
            child: Card(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: SizedBox(
                  width: getProportionateScreenWidth(180),
                  height: getProportionateScreenHeight(80),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          headerText(
                            fontSize: 17,
                            text: "Por favor aguarde",
                          ),
                        ],
                      ),
                      SizedBox(
                        height: getProportionateScreenHeight(15),
                      ),
                      Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 20),
                            child: CircularProgressIndicator(
                                color: AppColor.primary),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                              left: 20,
                            ),
                            child: Text(text),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    ],
  );
}

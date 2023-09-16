import 'package:e_mart_app/consts/consts.dart';
import 'package:flutter/material.dart';

Widget ourButton({onPress, color, textColor,String? title}) {
  return ElevatedButton(
    style: ElevatedButton.styleFrom(
      backgroundColor: color,
      padding: const EdgeInsets.all(12),
    ),
    onPressed: onPress,
    child: title?.text.color(textColor).fontFamily(bold).make(),
  );
}

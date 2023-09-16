import 'package:e_mart_app/consts/consts.dart';
import 'package:flutter/cupertino.dart';

Widget homeButton({height,width,icon,String? title,onPress}) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Image.asset(
        icon,
        width: 26,
      ),
      10.heightBox,
      title!.text.color(darkFontGrey).fontFamily(semibold).make(),
    ],
  ).box.rounded.white.shadowSm.size(width, height).make();
}

import 'package:e_mart_app/consts/consts.dart';
import 'package:e_mart_app/views/category_screen/category_details.dart';
import 'package:flutter/cupertino.dart';

Widget featuredButton({String? title, icon}) {
  return Row(
    children: [
      Image.asset(
        icon,
        width: 60,
        fit: BoxFit.fill,
      ),
      10.widthBox,
      title!.text.fontFamily(semibold).color(darkFontGrey).make(),
    ],
  )
      .box
      .width(200)
      .outerShadowSm
      .padding(EdgeInsets.all(4))
      .margin(EdgeInsets.symmetric(horizontal: 4))
      .roundedSM
      .white
      .make().onTap(() { 
        Get.to(() => CategoryDetails(title: title));
  });
}

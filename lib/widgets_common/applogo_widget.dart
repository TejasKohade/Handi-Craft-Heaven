import 'package:e_mart_app/consts/consts.dart';
import 'package:flutter/cupertino.dart';

Widget appLogoWidget() {
  return Image.asset(icAppLogo)
      .box
      .white
      .size(77, 77)
      .padding(EdgeInsets.all(8))
      .rounded
      .make();
}

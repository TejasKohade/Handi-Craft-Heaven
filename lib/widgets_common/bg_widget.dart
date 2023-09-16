import 'package:e_mart_app/consts/consts.dart';
import 'package:flutter/cupertino.dart';

Widget bgWidget({Widget? child}) {
  return SafeArea(
    child: Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage(imgBackground),
          fit: BoxFit.fill,
        ),
      ),
      child: child,
    ),
  );
}

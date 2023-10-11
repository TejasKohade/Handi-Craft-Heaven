import 'package:e_mart_app/consts/consts.dart';

Widget orderStatus({icon,color,title,showDone}) {
  return ListTile(
    leading: Icon(icon, color: color)
        .box
        .border(color: color).roundedSM.padding(const EdgeInsets.all(4))
        .make(),
    trailing: SizedBox(
      height: 100,
      width: 120,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          "$title".text.color(darkFontGrey).make(),
          showDone ? const Icon(
            Icons.done,
            color: redColor,
          ) : Container(),
        ],
      ),
    ),
  );
}

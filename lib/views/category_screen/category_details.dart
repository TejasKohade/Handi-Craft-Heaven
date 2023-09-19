import 'package:e_mart_app/consts/consts.dart';
import 'package:e_mart_app/controllers/product_controller.dart';
import 'package:e_mart_app/views/category_screen/item_details.dart';
import 'package:e_mart_app/widgets_common/bg_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CategoryDetails extends StatelessWidget {
  final String? title;
  const CategoryDetails({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var controller = Get.find<ProductController>();
    return bgWidget(
      child: Scaffold(
        appBar: AppBar(
          title: title!.text.fontFamily(bold).white.make(),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              child: Row(
                children: List.generate(
                  controller.subcat.length,
                  (index) => "${controller.subcat[index]}".text
                      .size(12)
                      .fontFamily(semibold)
                      .color(darkFontGrey)
                      .makeCentered()
                      .box
                      .size(120, 60)
                      .margin(
                        const EdgeInsets.symmetric(horizontal: 4),
                      )
                      .rounded
                      .white
                      .make(),
                ),
              ),
            ),
            20.heightBox,
            Expanded(
              child: GridView.builder(
                physics: const BouncingScrollPhysics(),
                shrinkWrap: true,
                itemCount: 6,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisExtent: 250,
                    mainAxisSpacing: 9,
                    crossAxisSpacing: 8),
                itemBuilder: (context, index) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Image.asset(
                        imgP5,
                        width: 200,
                        height: 150,
                        fit: BoxFit.cover,
                      ),
                      "ABC"
                          .text
                          .fontFamily(semibold)
                          .color(darkFontGrey)
                          .make(),
                      "\$600"
                          .text
                          .color(redColor)
                          .fontFamily(bold)
                          .size(16)
                          .make(),
                    ],
                  )
                      .box
                      .white
                      .roundedSM
                      .outerShadowSm
                      .margin(
                        const EdgeInsets.symmetric(horizontal: 12),
                      )
                      .padding(const EdgeInsets.all(8))
                      .make()
                      .onTap(() {
                    Get.to(
                      () => const ItemDetails(
                        title: "Dummy title",
                      ),
                    );
                  });
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

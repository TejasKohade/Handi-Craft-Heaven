import 'package:e_mart_app/consts/consts.dart';
import 'package:e_mart_app/consts/lists.dart';
// import 'package:e_mart_app/widgets_common/bg_widget.dart';
import 'package:e_mart_app/widgets_common/our_button.dart';
import 'package:flutter/material.dart';

class ItemDetails extends StatelessWidget {
  final String? title;
  const ItemDetails({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: title!.text.color(darkFontGrey).make(),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.share,
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.favorite_outline,
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    VxSwiper.builder(
                      autoPlay: true,
                      height: 350,
                      aspectRatio: 16 / 9,
                      itemCount: 3,
                      itemBuilder: (context, index) {
                        return Image.asset(
                          imgFc5,
                          width: double.infinity,
                          fit: BoxFit.cover,
                        );
                      },
                    ),
                    10.heightBox,
                    title!.text
                        .size(16)
                        .color(darkFontGrey)
                        .fontFamily(semibold)
                        .make(),
                    10.heightBox,
                    VxRating(
                      onRatingUpdate: (value) {},
                      normalColor: textfieldGrey,
                      selectionColor: golden,
                      size: 25,
                      stepInt: true,
                      count: 5,
                    ),
                    10.heightBox,
                    "\$30,000"
                        .text
                        .color(redColor)
                        .fontFamily(bold)
                        .size(18)
                        .make(),
                    10.heightBox,
                    Row(
                      children: [
                        Expanded(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              "Seller".text.white.fontFamily(semibold).make(),
                              5.heightBox,
                              "In House Brands"
                                  .text
                                  .fontFamily(semibold)
                                  .color(darkFontGrey)
                                  .size(16)
                                  .make(),
                            ],
                          ),
                        ),
                        const CircleAvatar(
                          backgroundColor: Colors.white,
                          child: Icon(
                            Icons.message_rounded,
                            color: darkFontGrey,
                          ),
                        ),
                      ],
                    )
                        .box
                        .height(60)
                        .padding(
                          const EdgeInsets.symmetric(
                            horizontal: 16,
                          ),
                        )
                        .color(textfieldGrey)
                        .make(),
                    20.heightBox,
                    Column(
                      children: [
                        Row(
                          children: [
                            SizedBox(
                              width: 100,
                              child:
                                  "Color : ".text.color(textfieldGrey).make(),
                            ),
                            Row(
                              children: List.generate(
                                3,
                                (index) => VxBox()
                                    .roundedFull
                                    .size(40, 40)
                                    .color(Vx.randomPrimaryColor)
                                    .margin(
                                      EdgeInsets.symmetric(horizontal: 4),
                                    )
                                    .make(),
                              ),
                            ),
                          ],
                        ).box.padding(EdgeInsets.all(8)).make(),
                        Row(
                          children: [
                            SizedBox(
                              width: 100,
                              child: "Quantity : "
                                  .text
                                  .color(textfieldGrey)
                                  .make(),
                            ),
                            Row(
                              children: [
                                IconButton(
                                    onPressed: () {}, icon: Icon(Icons.remove)),
                                "0"
                                    .text
                                    .size(16)
                                    .color(darkFontGrey)
                                    .fontFamily(bold)
                                    .make(),
                                IconButton(
                                    onPressed: () {}, icon: Icon(Icons.add)),
                                10.widthBox,
                                "(0 Available)".text.color(darkFontGrey).make(),
                              ],
                            ),
                          ],
                        ).box.padding(EdgeInsets.all(8)).make(),
                        Row(
                          children: [
                            SizedBox(
                              width: 100,
                              child: "Total Price : "
                                  .text
                                  .color(textfieldGrey)
                                  .make(),
                            ),
                            "\$0.00"
                                .text
                                .color(redColor)
                                .size(16)
                                .fontFamily(bold)
                                .make(),
                          ],
                        ).box.padding(EdgeInsets.all(8)).make(),
                      ],
                    ).box.white.shadowSm.make(),
                    10.heightBox,
                    "Description"
                        .text
                        .color(darkFontGrey)
                        .fontFamily(semibold)
                        .make(),
                    10.heightBox,
                    "This is a Dummy description of a Dummmy Item"
                        .text
                        .color(darkFontGrey)
                        .make(),
                    10.heightBox,
                    ListView(
                      physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      children: List.generate(
                        itemDetailsButtonList.length,
                        (index) => ListTile(
                          title: "${itemDetailsButtonList[index]}"
                              .text
                              .fontFamily(semibold)
                              .color(darkFontGrey)
                              .make(),
                          trailing: Icon(Icons.arrow_forward),
                        ),
                      ),
                    ),
                    20.heightBox,
                    productyoumaylike.text.size(16).fontFamily(bold).color(darkFontGrey).make(),
                    10.heightBox,
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: List.generate(
                          6,
                              (index) => Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Image.asset(
                                imgP1,
                                width: 150,
                                fit: BoxFit.cover,
                              ),
                              10.heightBox,
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
                              .margin(
                            const EdgeInsets.symmetric(horizontal: 4),
                          )
                              .padding(const EdgeInsets.all(8))
                              .make(),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          SizedBox(
            width: double.infinity,
            height: 60,
            child: ourButton(
              color: redColor,
              onPress: () {},
              textColor: whiteColor,
              title: "Add To Cart",
            ),
          )
        ],
      ),
    );
  }
}

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_mart_app/consts/consts.dart';
import 'package:e_mart_app/services/firestore_services.dart';
import 'package:e_mart_app/widgets_common/loading_indicator.dart';

class WishListScreen extends StatelessWidget {
  const WishListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteColor,
      appBar: AppBar(
        title:
            "My Wish List".text.fontFamily(semibold).color(darkFontGrey).make(),
      ),
      body: StreamBuilder(
        stream: FirestoreServices.getWishlists(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (!snapshot.hasData) {
            return Center(
              child: loadingIndicator(),
            );
          } else if (snapshot.data!.docs.isEmpty) {
            return "No Wish Item Yet"
                .text
                .color(darkFontGrey)
                .fontFamily(semibold)
                .makeCentered();
          } else {
            var data = snapshot.data!.docs;
            return Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: data.length,
                    itemBuilder: (BuildContext context, int index) {
                      return ListTile(
                        leading: Image.network(
                          '${data[index]['p_imgs'][0]}',
                          fit: BoxFit.cover,
                          width: 80,
                        ),
                        title: "${data[index]['p_name']}"
                            .text
                            .fontFamily(semibold)
                            .size(16)
                            .make(),
                        subtitle: "${data[index]['p_price']}"
                            .numCurrency
                            .text
                            .fontFamily(semibold)
                            .size(14)
                            .color(redColor)
                            .make(),
                        trailing: const Icon(Icons.favorite, color: redColor)
                            .onTap(() async {
                          await firestore
                              .collection(productColllection)
                              .doc(data[index].id)
                              .set(
                            {
                              'p_wishlist':
                                  FieldValue.arrayRemove([currentUser!.uid])
                            },
                            SetOptions(merge: true),
                          );
                        }),
                      );
                    },
                  ),
                ),
              ],
            );
          }
        },
      ),
    );
  }
}

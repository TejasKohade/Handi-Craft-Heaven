import 'package:e_mart_app/consts/consts.dart';

class FirestoreServices {
  static getuser(uid) {
    return firestore
        .collection(usersCollection)
        .where('id', isEqualTo: uid)
        .snapshots();
  }

  static getSubCategoryproducts(title) {
    return firestore
        .collection(productColllection)
        .where('p_subcategory', isEqualTo: title)
        .snapshots();
  }

  static getProducts(category) {
    return firestore
        .collection(productColllection)
        .where('p_category', isEqualTo: category)
        .snapshots();
  }

  static getCart(uid) {
    return firestore
        .collection(cartCollection)
        .where('added_by', isEqualTo: uid)
        .snapshots();
  }

  static deleteDocument(docId) {
    return firestore.collection(cartCollection).doc(docId).delete();
  }

  static getChatMessages(docId) {
    return firestore
        .collection(chatsCollection)
        .doc(docId)
        .collection(messagesCollection)
        .orderBy('created_on', descending: true)
        .snapshots();
  }

  static getAllOrders() {
    return firestore
        .collection(ordersCollection)
        .where('order_by', isEqualTo: currentUser!.uid)
        .snapshots();
  }

  static getWishlists() {
    return firestore
        .collection(productColllection)
        .where('p_wishlist', arrayContains: currentUser!.uid)
        .snapshots();
  }

  static getAllMessages() {
    return firestore
        .collection(chatsCollection)
        .where('fromId', isEqualTo: currentUser!.uid)
        .snapshots();
  }

  static getCount() async {
    var res = await Future.wait(
      [
        firestore
            .collection(cartCollection)
            .where('added_by', isEqualTo: currentUser!.uid)
            .get()
            .then(
          (value) {
            return value.docs.length;
          },
        ),
        firestore
            .collection(productColllection)
            .where('p_wishlist', arrayContains: currentUser!.uid)
            .get()
            .then(
          (value) {
            return value.docs.length;
          },
        ),
        firestore
            .collection(ordersCollection)
            .where('order_by', isEqualTo: currentUser!.uid)
            .get()
            .then(
          (value) {
            return value.docs.length;
          },
        )
      ],
    );
    return res;
  }

  static allproducts() {
    return firestore.collection(productColllection).snapshots();
  }

  //get featured products method
  static getFeaturedProducts() {
    return firestore
        .collection(productColllection)
        .where('is_featured', isEqualTo: true)
        .get();
  }

  static searchProducts(title) {
    return firestore.collection(productColllection).get();
  }
}

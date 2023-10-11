import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_mart_app/consts/consts.dart';
import 'package:e_mart_app/controllers/home_controller.dart';

class ChatsController extends GetxController {
  @override
  void onInit() {
    // TODO: implement onInit
    getChatId();
    super.onInit();
  }

  var chats = firestore.collection(chatsCollection);
  var friendName = Get.arguments[0];
  var friendId = Get.arguments[1];
  var senderName = Get.find<HomeController>().username;
  var curentId = currentUser!.uid;
  var msgController = TextEditingController();
  dynamic chatDocId;
  var isLoading = false.obs;
  getChatId() async {
    isLoading(true);
    await chats
        .where('users', isEqualTo: {friendId: null, curentId: null})
        .limit(1)
        .get()
        .then((QuerySnapshot snapshot) {
          if (snapshot.docs.isNotEmpty) {
            chatDocId = snapshot.docs.single.id;
          } else {
            chats.add(
              {
                'created_on': null,
                'last_msg': '',
                'users': {friendId: null, curentId: null},
                'toId': '',
                'fromId': '',
                'friendname': friendName,
                'sendername': senderName
              },
            ).then((value) {
              chatDocId = value.id;
            });
          }
        });
    isLoading(false);
  }

  sendMsg(String msg) async {
    if (msg.trim().isNotEmpty) {
      chats.doc(chatDocId).update({
        'created_on': FieldValue.serverTimestamp(),
        'last_msg': msg,
        'toId': friendId,
        'fromId': curentId
      });
      chats.doc(chatDocId).collection(messagesCollection).doc().set({
        'created_on': FieldValue.serverTimestamp(),
        'msg': msg,
        'uid': curentId
      });
    }
  }
}

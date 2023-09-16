import 'package:e_mart_app/consts/consts.dart';

class FirestoreServices{
  static getuser(uid)
  {
    return firestore.collection(usersCollection).where('id',isEqualTo: uid).snapshots();
  }
}
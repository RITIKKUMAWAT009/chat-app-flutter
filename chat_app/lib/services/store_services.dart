import 'package:chat_app/utils/constants/firebase_const.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class StoreServices {
 static  getUserProfileData(String uid)  {
    try {
          return db.collection(userCollection).where('id', isEqualTo: uid).get();
    } catch (e) {
      print(e.toString());
    }
    return null;
  }

  static Stream<QuerySnapshot>? getAllUsers() {
    try {
      return db.collection(userCollection).snapshots();
    } catch (e) {
      print(e.toString());
    }
 return null;
  }
}

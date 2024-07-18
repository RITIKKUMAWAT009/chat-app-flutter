import 'package:chat_app/utils/constants/firebase_const.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeController extends GetxController {
  SharedPreferences? sharedPreferences;

  static HomeController get instance => Get.find();
  @override
  void onInit() async{
    // TODO: implement onInit
    super.onInit();
    sharedPreferences=await SharedPreferences.getInstance();
    getUserDetails();
  }
  List<String> currentUserDetail=[];
  getUserDetails()async{
  sharedPreferences=await SharedPreferences.getInstance();

    await FirebaseFirestore.instance.collection(userCollection).where('id',isEqualTo:currentUser!.uid).get().then((value)async{
      sharedPreferences?.setStringList('user_details',[
        value.docs[0]['username'],
        value.docs[0]['email'],
        value.docs[0]['about'],
        value.docs[0]['imageUrl'],
      ]);
    });

  }

}
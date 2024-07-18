import 'package:chat_app/controller/home_controller.dart';
import 'package:chat_app/controller/profile_controller.dart';
import 'package:chat_app/utils/constants/firebase_const.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';

class ChatController extends GetxController {
  @override
  void onInit() {
    getChatId();
    super.onInit();
  }
var chats=FirebaseFirestore.instance.collection(chatCollection);
  var isLoading=false.obs;
  //variables for chat
String chatId="";
  String userId=currentUser!.uid;
  String friendId=Get.arguments[0];
  String friendName=Get.arguments[1];
  String friendImage=Get.arguments[2];
  String? username=HomeController.instance.sharedPreferences?.getStringList('user_details')![0];

  final messageController = TextEditingController();

  getChatId()async{
    isLoading(true);
    try{
      await chats.where('users',isEqualTo:{friendId:null,userId:null}).get().then((QuerySnapshot value) {
        if(value.docs.isNotEmpty){
          chatId=value.docs.single.id;
        }else{
          chats.add({
            'users':{userId:null,friendId:null},
            'username':username,
            'friend_name':friendName,
            'friend_image':friendImage,
            'from_id':'',
            'to_id':'',
            'created_at':DateTime.now()
          }).then((value) {
            chatId=value.id;
          });
        }
      });
isLoading(false);
    }catch(e){
      print(e.toString());
    }
  }

  sendMessage(String msg)async{
    print('inside send message');
    try{
     if(msg.trim().isNotEmptyAndNotNull){
       //is msg is not null then update the chat id document and then save the message to database

       chats.doc(chatId).update({
         'created_on':FieldValue.serverTimestamp(),
         'from_id':userId,
         'to_id':friendId,
         'last_msg':msg
       });
       //now save the message to database
       chats.doc(chatId).collection('messages').doc().set({
         'created_on':FieldValue.serverTimestamp(),
         'from_id':userId,
         'msg':msg
       });

     }

messageController.clear();
    }catch(e){
      print(e.toString());
    }
  }
}
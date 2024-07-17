import 'package:chat_app/screens/chat/chat_screen.dart';
import 'package:chat_app/utils/constants/images.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';

Widget chatsComponent(){
  return Container(
    child: ListView.builder(
      physics: const BouncingScrollPhysics(),
      itemCount: 20,itemBuilder:(context, index) {
      return ListTile(
        onTap:()=>Get.to(()=> ChatScreen(username: 'Dummy Name',),transition: Transition.downToUp,duration: const Duration(seconds: 1)),
        leading: CircleAvatar(
          radius: 25,
          child:Image.asset(ic_user),
        ),
        title: 'Dummy Name'.text.size(16).semiBold.make(),
        subtitle:'Message here'.text.make(),
        trailing: 'Last seen'.text.gray400.make(),
      );
    },),
  );
}
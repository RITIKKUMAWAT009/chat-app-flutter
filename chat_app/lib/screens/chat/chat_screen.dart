import 'package:chat_app/screens/chat/component/chat_bubble.dart';
import 'package:chat_app/services/store_services.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../controller/chat_controller.dart';

class ChatScreen extends StatelessWidget {
   ChatScreen({super.key,});

  @override
  Widget build(BuildContext context) {
    final controller=Get.put(ChatController());
    return Scaffold(
        backgroundColor: Colors.grey.shade800,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          foregroundColor: Colors.white,
          leading: const Icon(Icons.arrow_back_ios_new).onTap(() {
            Get.back();
          }),
          actions: [
            IconButton(onPressed: () {}, icon: const Icon(Icons.more_vert))
          ],
        ),
        body: Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20)),
                color: Colors.white),
            child: Column(
              children: [
                Row(
                  children: [
                     CircleAvatar(
                      radius: 30,
                      backgroundImage: NetworkImage(
                      controller.friendImage),
                    ),
                    12.widthBox,
                    Expanded(
                      child: RichText(
                          text:  TextSpan(
                              text: '${controller.friendName}\n',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold),
                              children: [
                            TextSpan(
                                text: 'Last seen recently',
                                style: TextStyle(height: 2,
                                    color: Colors.grey,
                                    fontSize: 12,
                                    fontWeight: FontWeight.normal))
                          ])),
                    ),
                    CircleAvatar(
                      backgroundColor: Colors.black.withOpacity(0.2),
                      child: IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.call),
                      ),
                    ),
                    10.widthBox,
                    CircleAvatar(
                      backgroundColor: Colors.black.withOpacity(0.2),
                      child: IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.video_call),
                      ),
                    ),
                  ],
                ),
                20.heightBox,
                Obx(
                    ()=> Expanded(
                    child:controller.isLoading.value ? const Center(child: CircularProgressIndicator(
                      valueColor: AlwaysStoppedAnimation(Colors.cyanAccent),
                    )) : StreamBuilder(
                      stream: StoreServices.getAllChats(controller.chatId),
                      builder: (BuildContext context,AsyncSnapshot<QuerySnapshot> snapshot) {
                        if(snapshot.connectionState == ConnectionState.waiting){
                          return const Center(child: CircularProgressIndicator());
                        }
                        return ListView(
                          children:snapshot.data!.docs.mapIndexed((currentValue, index) {
                            var data = snapshot.data!.docs[index];
                            return chatBubble(index,data);
                          },).toList(),
                        );
                      },
                    )
                  ),
                ),
                10.heightBox,
                Container(
                    height: 50,
                    padding: const EdgeInsets.symmetric(horizontal: 1),
                    child: Row(
                      children: [
                        Expanded(
                            child: TextField(
                              controller: controller.messageController,
                                autocorrect: true,
                                maxLines: 1,
                                cursorHeight: 20,
                                enableSuggestions: true,
                                cursorColor: Colors.white,
                                style: TextStyle(color: Colors.white),
                                decoration: InputDecoration(
                                    prefixIcon: Icon(
                                      Icons.emoji_emotions_rounded,
                                      size: 30,
                                      color: Colors.grey.shade200,
                                    ).onTap(() {
                                      print('emoji');
                                    }),
                                    suffixIcon: Icon(
                                      Icons.attachment,
                                      size: 30,
                                      color: Colors.grey.shade200,
                                    ).onTap(() {
                                      print('file');
                                    }),
                                    contentPadding: EdgeInsets.only(left: 20),
                                    hintText: 'Type your message...',
                                    hintStyle: TextStyle(color: Colors.grey),
                                    filled: true,
                                    fillColor: Colors.grey.shade800,
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(50),
                                    )))),
                        10.widthBox,
                        CircleAvatar(
                            radius: 25,
                            backgroundColor: Colors.green,
                            child: IconButton(
                                onPressed: () {},
                                icon: const Icon(
                                  Icons.send,
                                  size: 25,
                                ).onTap(() => controller.sendMessage(controller.messageController.text),)
                            ))
                      ],
                    ))
              ],
            )));
  }
}

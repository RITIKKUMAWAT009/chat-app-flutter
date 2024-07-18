
import 'package:chat_app/utils/constants/firebase_const.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:intl/intl.dart'as intl;

Widget chatBubble(index,DocumentSnapshot data){
  var t=data['created_on']==null?DateTime.now():data['created_on'].toDate();
  var time=intl.DateFormat('HH:mm').format(t);
  return Directionality(
    textDirection: data['from_id']==currentUser!.uid
        ? TextDirection.rtl
        : TextDirection.ltr,
    child: Container(
      margin: const EdgeInsets.only(
        bottom: 8,
      ),
      child: Row(
        children: [
          CircleAvatar(
            radius: 20,
            backgroundImage:data['from_id'] == currentUser!.uid
                ? const NetworkImage(
                'https://cdn.pixabay.com/photo/2021/07/19/04/36/woman-6477171_640.jpg')
                : const NetworkImage(
                'https://images.pexels.com/photos/220453/pexels-photo-220453.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1'),
          ),
          Expanded(
              child: Directionality(
                textDirection: TextDirection.ltr,
                child: Container(
                  margin: const EdgeInsets.only(
                      left: 8, right: 8),
                  padding: const EdgeInsets.symmetric(
                      horizontal: 12, vertical: 8),
                  decoration: BoxDecoration(
                      borderRadius: index.isEven
                          ? const BorderRadius.only(topLeft: Radius.circular(20),
                        bottomLeft: Radius.circular(20),
                        bottomRight: Radius.circular(20),
                        topRight: Radius.circular(20),
                      )
                          : const BorderRadius.only(
                          topLeft: Radius.circular(20),
                          bottomLeft: Radius.circular(20),
                          bottomRight:
                          Radius.circular(20)),
                      color: data['from_id'] == currentUser!.uid
                          ? Colors.black.withOpacity(0.2)
                          : Colors.blue.withOpacity(0.3)),
                  child: Directionality(
                    textDirection:data['from_id'] == currentUser!.uid
                        ? TextDirection.rtl
                        : TextDirection.ltr,
                    child:
                    '${data['msg']}'
                        .text
                        .color(Colors.black)
                        .fontWeight(FontWeight.w400)
                        .make(),
                  ),
                ),
              )),
          time
              .toString()
              .text
              .start
              .color(Colors.black)
              .size(6)
              .make()
        ],
      ),
    ),
  );
}
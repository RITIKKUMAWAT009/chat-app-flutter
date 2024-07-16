import 'package:chat_app/utils/constants/strings.dart';
import 'package:chat_app/utils/constants/images.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

Widget appBar({required GlobalKey<ScaffoldState> scaffoldKey}) {
  return Container(
    color: Colors.white,
    padding: const EdgeInsets.only(right: 12),
    height: 80,
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        InkWell(
          onTap: (){
            scaffoldKey.currentState!.openDrawer();
          },
          child: Container(
            height: 80,
            width: 90,
            decoration:  BoxDecoration(
              color: Colors.grey.shade800,
              borderRadius: const BorderRadius.only(
                topRight: Radius.circular(100),
                bottomRight: Radius.circular(100),
              ),
            ),
            child: const Icon(Icons.settings, color: Colors.white),
          ),
        ),
        RichText(
          text: TextSpan(
            children: [
              TextSpan(
                  text: '$appName\n',
                  style: const TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Colors.black)),
              TextSpan(
                  text: '                 $connectingLives',
                  style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: Vx.gray600)),
            ],
          ),
        ),
        CircleAvatar(
          radius: 25,
          child: Image.asset(ic_user,),
        )
      ],
    ),
  );
}

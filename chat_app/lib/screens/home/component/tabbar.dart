import 'package:chat_app/utils/constants/strings.dart';
import 'package:flutter/material.dart';

Widget tabbar(){
  return RotatedBox(
    quarterTurns: 3,
    child: Container(
      child: TabBar(

        labelStyle: TextStyle(fontWeight: FontWeight.bold,color: Colors.white),
        unselectedLabelStyle: TextStyle(fontWeight: FontWeight.bold,color: Colors.grey),
        indicatorColor: Colors.white,
        indicatorSize: TabBarIndicatorSize.tab,
        indicatorWeight:4,
        tabs: [
          Tab(
            text: chats,
          ),
          Tab(
            text: status,
          ),
          Tab(
            text: camera,
          ),
        ],
      ),
    ),
  );
}
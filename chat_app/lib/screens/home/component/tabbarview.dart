
import 'package:chat_app/screens/home/component/chat_component.dart';
import 'package:flutter/material.dart';

Widget tabbarview() {
  return Expanded(
    child: Container(
      margin: EdgeInsets.only(bottom: 8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(bottomLeft:Radius.circular(20)),
      ),
      child: TabBarView(
        children: [
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(bottomLeft:Radius.circular(20)),
            ),
            child: chatsComponent(),
          ),
          Container(
            decoration: BoxDecoration(
              color: Colors.green,
              borderRadius: BorderRadius.only(bottomLeft:Radius.circular(20)),
            ),
          ),
          Container(
            decoration: BoxDecoration(
              color: Colors.blue,
              borderRadius: BorderRadius.only(bottomLeft:Radius.circular(20)),
            ),

          ),
        ],
      ),
    ),
  );
}
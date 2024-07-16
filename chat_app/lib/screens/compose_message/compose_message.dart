import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';

class ComposeMessage extends StatelessWidget {
  const ComposeMessage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade800,
      appBar: AppBar(
        elevation: 0.0,
        leading: Icon(
          Icons.arrow_back_ios_new,
          color: Colors.white,
        ).onTap(() {
          Get.back();
        }),
        actions: [
          TextButton(
              onPressed: () {
                Get.back();
              },
              child: 'Send'.text.color(Colors.white).size(18).make())
        ],
        backgroundColor: Colors.transparent,
        title: 'New Message'.text.color(Colors.white).make(),
      ),
      body: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
          color: Colors.white,
        ),
        child: StreamBuilder(
          stream: null,
          builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {},
        ),
      ),
    );
  }
}

import 'package:chat_app/controller/home_controller.dart';
import 'package:chat_app/screens/home/home_screen.dart';
import 'package:chat_app/screens/profile_screen/profile_screen.dart';
import 'package:chat_app/utils/constants/strings.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../../utils/constants/images.dart';

Widget drawer({required HomeController controller}) {
  return Drawer(
    backgroundColor: Colors.grey.shade800,
    shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.horizontal(right: Radius.circular(25))),
    child: Column(
      children: [
        ListTile(
          leading: const Icon(
            Icons.arrow_back_ios_new,
            color: Colors.white,
          ).onTap(() {
            Get.back();
          }),
          title: settings.text.fontFamily('lato-bold').white.make(),
        ),
        20.heightBox,
        CircleAvatar(
          child: Image.asset(ic_user),
          radius: 45,
        ),
        10.heightBox,
        controller.sharedPreferences?.getStringList('user_details')![0].text.fontFamily('lato-bold').size(16).white.make()?? ''.text.make(),
        20.heightBox,
        const Divider(
          color: Colors.white,
          height: 0.5,
        ),
        10.heightBox,
        ListView(
          shrinkWrap: true,
        children: List.generate(
            iconsList.length,
            (index) => ListTile(
              onTap: () {
                switch(index){
                  case 0:{
                    Get.to(() =>const ProfileScreen(),transition: Transition.downToUp,duration: const Duration(seconds: 1));
                  }
                }
              },
              leading: Icon(
                iconsList[index],
                color: Colors.white,
              ),
              title: iconsTextList[index]
                  .text
                  .fontFamily('lato-bold')
                  .white
                  .make(),
            ),
          ),
        ),
        10.heightBox,
        const Divider(
          color: Colors.white,
          height: 0.5,
        ),
        10.heightBox,
        ListTile(
          leading: const Icon(
            Icons.man,
            color: Colors.white,
          ),
          title: invite.text.fontFamily('lato-bold').white.make(),
        ),
        const Spacer(),
        ListTile(
          leading: const Icon(
            Icons.logout,
            color: Colors.white,
          ),
          title: logout.text.fontFamily('lato-bold').white.make(),
        ),
        20.heightBox,
      ],
    ),
  );
}

import 'dart:io';

import 'package:chat_app/controller/profile_controller.dart';
import 'package:chat_app/screens/profile_screen/component/pick_image_dialoge.dart';
import 'package:chat_app/services/store_services.dart';
import 'package:chat_app/utils/constants/firebase_const.dart';
import 'package:chat_app/utils/constants/images.dart';
import 'package:chat_app/utils/constants/strings.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ProfileController());
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
              onPressed: () async {
                if (controller.imagePath.value.isEmpty) {
                  controller.updateProfile();
                } else {
                  await controller.uploadImage();
                  controller.updateProfile();
                }
              },
              child: 'Save'.text.color(Colors.white).size(18).make())
        ],
        backgroundColor: Colors.transparent,
        title: profile.text.color(Colors.white).make(),
      ),
      body: SingleChildScrollView(
        child: Container(
          alignment: Alignment.center,
          padding: EdgeInsets.all(12),
          child: FutureBuilder(
            future: StoreServices.getUserProfileData(currentUser!.uid),
            builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
              if (snapshot.hasData) {
                var data = snapshot.data!.docs[0];
                print(data['username']);
                controller.nameController.text = data['username'];
                controller.emailController.text = data['email'];
                controller.aboutController.text = data['about'];
                controller.imgUrl = data['imageUrl'];
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Obx(
                      () => CircleAvatar(
                        radius: 80,
                        backgroundColor: Colors.grey,
                        child: Padding(
                          padding: const EdgeInsets.all(3.0),
                          child: Stack(
                            fit: StackFit.expand,
                            children: [
                              controller.imagePath.value.isEmpty &&
                                      data['imageUrl'] == ''
                                  ? Image.asset(
                                      ic_user,
                                      color: Colors.orange,
                                    )
                                  : controller.imagePath.value.isNotEmpty
                                      ? Image.file(
                                          File(
                                            controller.imagePath.value,
                                          ),
                                          fit: BoxFit.fill,
                                        )
                                          .box
                                          .roundedFull
                                          .clip(Clip.antiAlias)
                                          .make()
                                      : Image.network(
                                          data['imageUrl'],
                                          fit: BoxFit.fill,
                                        )
                                          .box
                                          .roundedFull
                                          .clip(Clip.antiAlias)
                                          .make(),
                              Positioned(
                                bottom: 10,
                                right: 10,
                                child: CircleAvatar(
                                  backgroundColor: Colors.grey,
                                  child: Icon(
                                    Icons.camera_alt,
                                    color: Colors.white,
                                  ).onTap(() => Get.dialog(
                                      pickImageDialog(context, controller),
                                      barrierDismissible: false)),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                    20.heightBox,
                    UserDetailTile(
                      label: 'Name',
                      subTitle: nameSub,
                      controller: controller.nameController,
                      suffixIcon: Icons.edit,
                      prefixIcon: Icons.person,
                    ),
                    UserDetailTile(
                      label: 'About',
                      subTitle: '',
                      maxLines: 4,
                      controller: controller.aboutController,
                      suffixIcon: Icons.edit,
                      prefixIcon: Icons.info,
                    ),
                    UserDetailTile(
                      label: 'Email',
                      controller: controller.emailController,
                      subTitle: '',
                      readOnly: true,
                      suffixIcon: Icons.edit,
                      prefixIcon: Icons.email,
                    )
                  ],
                );
              } else {
                return Center(
                    child: CircularProgressIndicator(
                  color: Colors.white,
                ));
              }
            },
          ),
        ),
      ),
    );
  }
}

class UserDetailTile extends StatelessWidget {
  const UserDetailTile(
      {super.key,
      this.subTitle,
      this.label,
      this.controller,
      this.suffixIcon,
      this.prefixIcon,
      this.readOnly = false,
      this.maxLines = 1});

  final String? subTitle, label;
  final TextEditingController? controller;
  final IconData? suffixIcon, prefixIcon;
  final bool readOnly;
  final int maxLines;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: TextFormField(
        controller: controller,
        readOnly: readOnly,
        maxLines: maxLines,
        style: TextStyle(color: Colors.white),
        cursorColor: Colors.white,
        decoration: InputDecoration(
            label: label!.text.white.semiBold.make(),
            suffixIcon: Icon(
              suffixIcon,
              color: Colors.white,
            ),
            isDense: false,
            border: OutlineInputBorder()),
      ),
      subtitle: subTitle!.text.bold.white.make(),
      leading: Align(
          widthFactor: 0.1,
          alignment: Alignment.topCenter,
          child: Icon(
            prefixIcon,
            color: Colors.white,
          )),
    );
  }
}

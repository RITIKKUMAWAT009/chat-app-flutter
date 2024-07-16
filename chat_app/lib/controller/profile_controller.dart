import 'dart:io';

import 'package:chat_app/utils/constants/firebase_const.dart';
import 'package:chat_app/utils/loaders/loaders.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:velocity_x/velocity_x.dart';

class ProfileController extends GetxController {
  final nameController = TextEditingController();
  final aboutController = TextEditingController();
  final emailController = TextEditingController();
  var imagePath = ''.obs;
  var imgUrl = '';

  updateProfile() async {
    try {
      var store = db.collection(userCollection).doc(currentUser!.uid);
      await store.set({
        'username': nameController.text,
        'about': aboutController.text,
        'email': emailController.text,
        'imageUrl': imgUrl
      }, SetOptions(merge: true));

      Loaders.successSnackBar(
          title: 'Success!', message: 'Profile updated successfully');
      Navigator.pop(Get.context!);
    } catch (e) {
      Loaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
    }
  }

  Future<void> pickImage(BuildContext context, ImageSource source) async {
    // Requesting permissions
    PermissionStatus cameraPermission = await Permission.camera.request();
    PermissionStatus photosPermission = await Permission.photos.request();
    // Checking permissions
    if (cameraPermission.isGranted) {
      try {
        final XFile? image =
            await ImagePicker().pickImage(source: source, imageQuality: 80);
        if (image != null) {
          imagePath.value = image.path;
          VxToast.show(context, msg: 'Image selected');
        } else {
          Loaders.warningSnackBar(
              title: 'No image selected', message: 'Please select an image');
        }
      } catch (e) {
        Loaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
      }
    } else {
      if (cameraPermission.isDenied || photosPermission.isDenied) {
        Loaders.warningSnackBar(
            title: 'Permission denied',
            message: 'Please grant permission to access photos');
      }
    }
  }

  uploadImage() async {
    try {
      EasyLoading.show(dismissOnTap: false,status: 'Uploading...',);
      var name = basename(imagePath.value);
      var destination = 'images/${currentUser!.uid}/$name';
      Reference ref = storage.ref().child(destination);
      await ref.putFile(File(imagePath.value));
      imgUrl = await ref.getDownloadURL();
      print(imgUrl);
      EasyLoading.dismiss();
    } catch (e) {
      Loaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
      EasyLoading.dismiss();
    }
  }
}

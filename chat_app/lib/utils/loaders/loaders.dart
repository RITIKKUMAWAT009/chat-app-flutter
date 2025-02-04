import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
class Loaders {
  static warningSnackBar({required title,message=''}){
    Get.snackbar(
        title,
        message,
        isDismissible: true,
        shouldIconPulse: true,
        colorText: Colors.white,
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.orange,
        duration: const Duration(seconds: 2),
        margin: const EdgeInsets.all(20),
        icon: const Icon(Iconsax.warning_2,color: Colors.white,)
    );
  } static successSnackBar({required title,message='',duration=2}){
    Get.snackbar(
        title,
        message,
        isDismissible: true,
        shouldIconPulse: true,
        colorText: Colors.white,
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor:Colors.blueAccent,
        duration:  Duration(seconds: duration),
        margin: const EdgeInsets.all(20),
        icon: const Icon(Iconsax.check,color: Colors.white,)
    );
  }
  static errorSnackBar({required title,message=''}){
    Get.snackbar(
        title,
        message,
        isDismissible: true,
        shouldIconPulse: true,
        colorText: Colors.white,
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red.shade600,
        duration:  Duration(seconds: 2),
        margin: const EdgeInsets.all(20),
        icon: const Icon(Iconsax.warning_2,color: Colors.white,)
    );
  }
}

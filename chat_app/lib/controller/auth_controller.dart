import 'package:chat_app/screens/home/home_screen.dart';
import 'package:chat_app/utils/constants/firebase_const.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../screens/welcome/welcome_screen.dart';

class AuthController extends GetxController {
  @override
  void onReady() {
    // TODO: implement onReady()
    super.onReady();
    screenRedirect();
  }

  screenRedirect() {
    if (FirebaseAuth.instance.currentUser != null) {
      Get.offAll(HomeScreen());
    } else {
      Get.offAll(WelcomeScreen());
    }
  }
  final usernameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();




  registerWithEmail() async {
    try {
      var userCredential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: emailController.text, password: passwordController.text);

      db.collection(userCollection).doc(userCredential.user!.uid).set({
        'id': userCredential.user!.uid,
        'username': usernameController.text,
        'email': emailController.text,
        'about': 'Hey, I am using Chat App',
        'imageUrl': 'https://i.stack.imgur.com/l60Hf.png',
      });
      Get.snackbar(
          snackPosition: SnackPosition.BOTTOM,
          'Success',
          'Account created successfully',
          colorText: Colors.white,
          backgroundColor: Colors.green);
      Get.offAll(()=>HomeScreen());
    } catch (e) {
      Get.snackbar(
          snackPosition: SnackPosition.BOTTOM,
          colorText:Colors.white,
          'Error',
          e.toString(),
          backgroundColor: Colors.red);
    }
  }

// late final PhoneVerificationCompleted phoneVerificationCompleted;
// late final PhoneVerificationFailed phoneVerificationFailed;
// late PhoneCodeSent phoneCodeSent;
// String verificationId = "";
//
//   ///[SEND OTP]
//   void sendOtp() async{
//     phoneVerificationCompleted=(PhoneAuthCredential phoneAuthCredential) async{
// await auth.signInWithCredential(phoneAuthCredential);
//     };
//     phoneVerificationFailed=(FirebaseAuthException error) {
//       print('erroe is =-----------------------'+error.toString());
//       if(error.code=='invalid-phone-number'){
//         Get.snackbar('Error', 'The provided phone number is not valid');
//       }
//     };
//     phoneCodeSent=(String verificationId, int? forceResendingToken) async{
//       this.verificationId=verificationId;
//     };
//     isOtpSent.value = true;
//     try{
//       await auth.verifyPhoneNumber(phoneNumber:"+91${phoneController.text}",
//         verificationCompleted:phoneVerificationCompleted, verificationFailed:phoneVerificationFailed,
//         codeSent: (verificationId, forceResendingToken) {
//
//       }, codeAutoRetrievalTimeout: (verificationId) {
//
//       },);
//     }catch(e){
//       print('inside catch'+e.toString());
//     }
//   }
}

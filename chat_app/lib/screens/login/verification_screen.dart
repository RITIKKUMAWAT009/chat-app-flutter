import 'package:chat_app/component/custome_elevated_button.dart';
import 'package:chat_app/controller/auth_controller.dart';
import 'package:chat_app/screens/home/home_screen.dart';
import 'package:chat_app/utils/constants/strings.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';

class VerificationScreen extends StatelessWidget {
  const VerificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(AuthController());
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          centerTitle: true,
          title: letsConnect.text.black.bold.fontFamily('lato-bold').make(),
        ),
        body: Container(
          padding: EdgeInsets.all(16.0),
          child: Column(
            children: [
              TextFormField(
                controller: controller.usernameController,
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide(color: Vx.gray600)),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide(color: Vx.gray400)),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide(color: Vx.blue700)),
                    labelText: 'User Name',
                    prefixIcon: Icon(
                      Icons.person,
                      color: Vx.gray600,
                    ),
                    alignLabelWithHint: true,
                    hintText: ' Enter username',
                    labelStyle: TextStyle(
                        color: Vx.gray400, fontWeight: FontWeight.bold)),
              ),
              20.heightBox,
              TextFormField(
                controller: controller.emailController,
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide(color: Vx.gray600)),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide(color: Vx.gray400)),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide(color: Vx.blue700)),
                    labelText: 'Email',
                    prefixIcon: Icon(
                      Icons.email,
                      color: Vx.gray600,
                    ),
                    alignLabelWithHint: true,
                    hintText: ' Enter your phone number',
                    labelStyle: TextStyle(
                        color: Vx.gray400, fontWeight: FontWeight.bold)),
              ),
              20.heightBox, TextFormField(
                controller: controller.passwordController,
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide(color: Vx.gray600)),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide(color: Vx.gray400)),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide(color: Vx.blue700)),
                    labelText: 'Password',
                    prefixIcon: Icon(
                      Icons.lock,
                      color: Vx.gray600,
                    ),suffixIcon: Icon(Icons.remove_red_eye,color: Vx.gray600,),
                    alignLabelWithHint: true,
                    hintText: 'Enter your password',
                    labelStyle: TextStyle(
                        color: Vx.gray400, fontWeight: FontWeight.bold)),
              ),
              20.heightBox,
              // otpText.text.semiBold.size(16).make(),
              //
              Spacer(),
              CustomElevatedButton(
                child: continueText.text.semiBold.size(16).make(),
                onPressed: () {
                  // Get.to(() => HomeScreen());
                  // controller.isOtpSent.value = true;
                  controller.registerWithEmail();
                },
              ),
              30.heightBox,
            ],
          ),
        ),
      ),
    );
  }
}

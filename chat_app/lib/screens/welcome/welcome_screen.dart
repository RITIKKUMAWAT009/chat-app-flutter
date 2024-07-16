
import 'package:chat_app/component/custome_elevated_button.dart';
import 'package:chat_app/utils/constants/strings.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';

import '../login/verification_screen.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          physics:const NeverScrollableScrollPhysics(),
          child: Container(
            height: MediaQuery.of(context).size.height,
            padding: EdgeInsets.all(16.0),
            child: Column(
              children: [
                Expanded(
                    flex: 1,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          'assets/logo/img.png',
                          width: 120,
                        ),
                        Text(
                          'Chat App',
                          style: TextStyle(
                              fontSize: 32,
                              fontFamily: 'lato_bold',
                              fontWeight: FontWeight.w500),
                        )
                      ],
                    )),
                Expanded(
                    flex: 3,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Wrap(
                          spacing: 10.0,
                          children: List.generate(
                              featuresList.length,
                                  (index) => Chip(
                                elevation: 10.0,
                                shadowColor: Colors.grey.shade200,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20)),
                                padding: EdgeInsets.symmetric(horizontal: 1.0),
                                backgroundColor: Colors.transparent,
                                side: BorderSide(color: Colors.grey.shade400),
                                label: Text(featuresList[index]),
                              )),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Text(
                          'Join the\n revolution\n today',
                          style: TextStyle(
                              fontSize: 32,
                              fontFamily: 'lato_bold',
                              fontWeight: FontWeight.w500,
                              letterSpacing: 2),
                        )
                      ],
                    )),
                Expanded(
                    flex: 1,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Center(
                          child: CustomElevatedButton(child: startMessaging.text.semiBold.size(16).make(),onPressed:(){Get.to(() => VerificationScreen());},),
                        ),
                        SizedBox(height: 20,),
                        Text('Design and Developed by Ritik kumawat',style: TextStyle(color: Colors.black54),)
                      ],
                    )),
              ],
            ),
          ),
        ),
      ),
    );
  }
}



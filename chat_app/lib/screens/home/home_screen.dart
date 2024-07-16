import 'package:chat_app/screens/home/component/appbar.dart';
import 'package:chat_app/screens/home/component/drawer.dart';
import 'package:chat_app/screens/home/component/tabbar.dart';
import 'package:chat_app/screens/home/component/tabbarview.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';

import '../compose_message/compose_message.dart';

class HomeScreen extends StatelessWidget {
   HomeScreen({super.key});
  @override
  Widget build(BuildContext context) {
    final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
    return SafeArea(
      child: DefaultTabController(
        length: 3,
        child: Scaffold(
          key: scaffoldKey,
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              Get.to(()=>ComposeMessage(),transition:Transition.downToUp);
            },
            elevation: 10,
            backgroundColor: Colors.black,
            child: const Icon(Icons.add,color: Colors.white,),
          ),
          backgroundColor: Colors.grey.shade800,
          body: Column(
            children: [
              appBar(scaffoldKey:scaffoldKey),
              Expanded(
                child: Row(
                  children: [
                    tabbar(),
                    tabbarview(),
                  ],
                ),
              ),
        
            ],
          ),
          drawer: drawer(),
        ),
      ),
    );
  }
}

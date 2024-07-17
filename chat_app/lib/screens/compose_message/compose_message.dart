import 'package:chat_app/screens/chat/chat_screen.dart';
import 'package:chat_app/services/store_services.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';

class ComposeMessage extends StatelessWidget {
  const ComposeMessage({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
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
        width: double.infinity,
        height:size.height,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
          color: Colors.white,
        ),
        child: StreamBuilder(
          stream: StoreServices.getAllUsers(),
          builder:
              (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if(snapshot.connectionState == ConnectionState.waiting){
              return Center(child: CircularProgressIndicator());
            }
            return GridView(
              shrinkWrap: true,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, mainAxisExtent: 180),
              children: snapshot.data!.docs.mapIndexed(
                (currentValue, index) {
                  var data = snapshot.data!.docs[index];
                  return Card(
                    elevation:10,
                    color: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        border: Border.all(
                            color: Colors.grey.shade800.withOpacity(0.2),
                           ),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              CircleAvatar(
                                radius: 35,
                                backgroundImage: NetworkImage(data['imageUrl']),
                              ),
                              10.widthBox,
                              Expanded(
                                  // width: size.width / 6,
                                  child: data['username']
                                      .toString()
                                      .text
                                      .overflow(TextOverflow.ellipsis)
                                      .bold
                                      .makeCentered()),
                            ],
                          ),
                          Container(
                            width: double.infinity,
                            margin: EdgeInsets.symmetric(horizontal: 5, vertical: 15),
                            child: ElevatedButton.icon(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.grey.shade800,
                                foregroundColor:Colors.white,

                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(5),
                                ),
                              ),
                                onPressed:(){
                                Get.to(()=>ChatScreen(username:data['username'],imageUrl: data['imageUrl'],),transition: Transition.downToUp,duration: const Duration(seconds: 1));
                                },icon:Icon(Icons.message),label: "Message".text.make()),
                          )
                        ],
                      ),
                    ),
                  );
                },
              ).toList(),
            );
          },
        ),
      ),
    );
  }
}

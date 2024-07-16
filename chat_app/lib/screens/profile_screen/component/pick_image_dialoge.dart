
import 'package:chat_app/controller/profile_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:velocity_x/velocity_x.dart';

Widget pickImageDialog(context,ProfileController controller){
  var listTileTitle=['Camera','Gallery','Cancel'];
  var listTileIcon=[Icon(Icons.camera_alt,color:Colors.white,),Icon(Icons.image,color:Colors.white,),Icon(Icons.cancel,color:Colors.white,)];
  return Dialog(elevation: 20,
    backgroundColor: Colors.grey.shade700,
    shadowColor:Colors.blueAccent,
    child: Container(
      padding: EdgeInsets.all(16),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          'Select image from'.text.white.make(),
          Divider(
          ),
          10.heightBox,
          ListView(
            shrinkWrap:true,
            children:List.generate(3,(index) =>ListTile(
              onTap: (){
                switch(index){
                  case 0:
                   controller.pickImage(context,ImageSource.camera);
                   Get.back();
                   break;
                  case 1:
                   controller.pickImage(context,ImageSource.gallery);
                   Get.back();
                    break;
                  case 2:
                    Get.back();
                    break;
                }
              },
              leading: listTileIcon[index],title: listTileTitle[index].text.color(Colors.white).make(),),
          )
          )
        ],
      ),
    ),
  );
}
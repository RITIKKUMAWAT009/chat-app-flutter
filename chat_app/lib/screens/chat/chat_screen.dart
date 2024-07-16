import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey.shade800,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          foregroundColor: Colors.white,
          leading: const Icon(Icons.arrow_back_ios_new).onTap(() {
            Get.back();
          }),
          actions: [
            IconButton(onPressed: () {}, icon: const Icon(Icons.more_vert))
          ],
        ),
        body: Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20)),
                color: Colors.white),
            child: Column(
              children: [
                Row(
                  children: [
                    const CircleAvatar(
                      radius: 30,
                      backgroundImage: NetworkImage(
                          'https://cdn.pixabay.com/photo/2021/07/19/04/36/woman-6477171_640.jpg'),
                    ),
                    12.widthBox,
                    Expanded(
                      child: RichText(
                          text: const TextSpan(
                              text: 'Name\n',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold),
                              children: [
                            TextSpan(
                                text: 'Last seen recently',
                                style: TextStyle(
                                    color: Colors.grey,
                                    fontSize: 16,
                                    fontWeight: FontWeight.normal))
                          ])),
                    ),
                    CircleAvatar(
                      backgroundColor: Colors.black.withOpacity(0.2),
                      child: IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.call),
                      ),
                    ),
                    10.widthBox,
                    CircleAvatar(
                      backgroundColor: Colors.black.withOpacity(0.2),
                      child: IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.video_call),
                      ),
                    ),
                  ],
                ),
                20.heightBox,
                Expanded(
                  child: ListView.builder(
                      physics: const BouncingScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: 100,
                      itemBuilder: (context, index) {
                        return Directionality(
                          textDirection: index.isEven
                              ? TextDirection.ltr
                              : TextDirection.rtl,
                          child: Container(
                            margin: const EdgeInsets.only(
                              bottom: 8,
                            ),
                            child: Row(
                              children: [
                                CircleAvatar(
                                  radius: 20,
                                  backgroundImage: index.isEven
                                      ? const NetworkImage(
                                          'https://cdn.pixabay.com/photo/2021/07/19/04/36/woman-6477171_640.jpg')
                                      : const NetworkImage(
                                          'https://images.pexels.com/photos/220453/pexels-photo-220453.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1'),
                                ),
                                Expanded(
                                    child: Directionality(
                                  textDirection: TextDirection.ltr,
                                  child: Container(
                                    margin: const EdgeInsets.only(
                                        left: 8, right: 8),
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 12, vertical: 8),
                                    decoration: BoxDecoration(
                                        borderRadius: index.isEven
                                            ? const BorderRadius.only(
                                                // topLeft: Radius.circular(20),
                                                bottomLeft: Radius.circular(20),
                                                // bottomRight: Radius.circular(20),
                                                topRight: Radius.circular(20),
                                              )
                                            : const BorderRadius.only(
                                                topLeft: Radius.circular(20),
                                                // bottomLeft: Radius.circular(20),
                                                bottomRight:
                                                    Radius.circular(20)),
                                        color: index.isEven
                                            ? Colors.black.withOpacity(0.2)
                                            : Colors.blue.withOpacity(0.3)),
                                    child: Directionality(
                                      textDirection: index.isEven
                                          ? TextDirection.ltr
                                          : TextDirection.rtl,
                                      child:
                                          'Message clblhfhldjhbhnvcv fhjhl x h hfvlslj jhdjh hv lils slhv  nklj jl f  k klk lfblk lklk lksvlk lksnlx  knvflkvnlk slsnkj flknkljblkslknbsie'
                                              .text
                                              .color(Colors.black)
                                              .fontWeight(FontWeight.w400)
                                              .make(),
                                    ),
                                  ),
                                )),
                                '11:00\nAM'
                                    .text
                                    .start
                                    .color(Colors.black)
                                    .size(6)
                                    .make()
                              ],
                            ),
                          ),
                        );
                      }),
                ),
                10.heightBox,
                Container(
                    height: 50,
                    padding: const EdgeInsets.symmetric(horizontal: 1),
                    child: Row(
                      children: [
                        Expanded(
                            child: TextField(
                                autocorrect: true,
                                maxLines: 1,
                                cursorHeight: 20,
                                enableSuggestions: true,
                                cursorColor: Colors.white,
                                style: TextStyle(color: Colors.white),
                                decoration: InputDecoration(
                                    prefixIcon: Icon(
                                      Icons.emoji_emotions_rounded,
                                      size: 30,
                                      color: Colors.grey.shade200,
                                    ).onTap(() {
                                      print('emoji');
                                    }),
                                    suffixIcon: Icon(
                                      Icons.attachment,
                                      size: 30,
                                      color: Colors.grey.shade200,
                                    ).onTap(() {
                                      print('file');
                                    }),
                                    contentPadding: EdgeInsets.only(left: 20),
                                    hintText: 'Type your message...',
                                    hintStyle: TextStyle(color: Colors.grey),
                                    filled: true,
                                    fillColor: Colors.grey.shade800,
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(50),
                                    )))),
                        10.widthBox,
                        CircleAvatar(
                            radius: 25,
                            backgroundColor: Colors.green,
                            child: IconButton(
                                onPressed: () {},
                                icon: const Icon(
                                  Icons.send,
                                  size: 25,
                                )))
                      ],
                    ))
              ],
            )));
  }
}

import 'package:chat_gpt/constants/constants.dart';
import 'package:chat_gpt/services/assets_manager.dart';
import 'package:chat_gpt/widgets/text_widget.dart';
import 'package:flutter/material.dart';

class MyWidget extends StatelessWidget {
  const MyWidget({super.key, required this.msg, required this.chatIndex});

    final String msg;
    final int chatIndex;

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Material(
        color: chatIndex == 0 ? scaffoldBackgroundColor : cardColor,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset(
                chatIndex == 0 ?
                AssetsManager.userImage 
                : AssetsManager.botImage,
                height: 30,
                width: 30,
              ),
              Expanded(
                child: TextWidget(
                  label: msg
                  )
                ),
                chatIndex == 0 
                ? SizedBox.shrink() 
                // ignore: prefer_const_constructors
                : Row(
                  // ignore: prefer_const_literals_to_create_immutables
                  children: [
                    const Icon(
                      Icons.thumb_up_alt_outlined,
                      color: Colors.white,
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    // ignore: prefer_const_constructors
                    Icon(Icons.thumb_down_alt_outlined,
                    color: Colors.white,),
                  ],

                ),
            ],
          ),
        ),
      ),
    ]);
  }
}

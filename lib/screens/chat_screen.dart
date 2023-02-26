import 'package:chat_gpt/constants/constants.dart';
import 'package:chat_gpt/services/api_service.dart';
import 'package:chat_gpt/services/assets_manager.dart';
import 'package:chat_gpt/widgets/text_widget.dart';
import 'package:chat_gpt/widgets/widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import '../services/services.dart';


class Chat_Screen extends StatefulWidget {
  const Chat_Screen({super.key,});



  @override
  State<Chat_Screen> createState() => _Chat_ScreenState();
}

class _Chat_ScreenState extends State<Chat_Screen> {
  final bool _istyping = true;
  late TextEditingController textEditingController;

  @override
  void initState() {
    textEditingController = TextEditingController();
    super.initState();
  }
  @override
  void dispose() {
    textEditingController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Image.asset(AssetsManager.openaiLogo),
        ),
        title: const Text("ChatGPT"),
        actions: [
          IconButton(
            onPressed: ()async{
              await Services.showModalSheet(context: context);

            },
             icon: Icon(Icons.more_vert_rounded,color: Colors.white,),)
        ],
      ),
      body: SafeArea(child: Column(children: [
        Flexible(child: ListView.builder(
          itemCount: 5,
          itemBuilder: (context, index){
            return MyWidget(
              msg: chatMessages[index]["msg"].toString(),
              chatIndex: int.parse(chatMessages[index]["chatIndex"].toString()),
            );
        }),),
        if(_istyping) ...{
          SpinKitThreeBounce(color: Colors.white, size: 18,),
          SizedBox(height: 15,),

          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
          Expanded(
            child: TextField(
              style: TextStyle(color: Colors.grey),
              controller: textEditingController,
          onSubmitted: (value){

          },
          decoration: InputDecoration.collapsed(hintText: "How I can help you?", hintStyle: TextStyle(color: Colors.grey)),
          ),
          ),
          IconButton(
            onPressed: ()async{
              try{
                await ApiService.getModels();
              }catch(error){
                print("error $error");
              }
            }, 
            icon: const Icon(Icons.send),
            color: Colors.white,
            ),
          SizedBox(
            height: 25,
          ),
        ],),
        }
        
      ]),),
    );
  }
}

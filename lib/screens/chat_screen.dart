import 'package:chat_gpt/services/assets_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';


class Chat_Screen extends StatefulWidget {
  const Chat_Screen({super.key});

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
            onPressed: (){},
             icon: Icon(Icons.more_vert_rounded,color: Colors.white,),)
        ],
      ),
      body: SafeArea(child: Column(children: [
        Flexible(child: ListView.builder(
          itemCount: 6,
          itemBuilder: (context, index){
            return const Text('I love coding');
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
        ],),
        }
        
      ]),),
    );
  }
}
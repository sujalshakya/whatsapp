import 'package:flutter/material.dart';

class MessageDetail extends StatelessWidget {
  const MessageDetail({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(appBar: AppBar(
        backgroundColor: const Color(0xFF00856e),
        title: const Text("WhatsApp", style: TextStyle(color: Colors.white),),
        actions: const [Padding(
          padding: EdgeInsets.all(8.0),
          child: Icon(Icons.search, color: Colors.white,),
        ), Icon(Icons.more_vert, color: Colors.white,)],
      ),);
  }
}
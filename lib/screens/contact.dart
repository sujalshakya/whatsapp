import 'package:flutter/material.dart';

class Contact extends StatelessWidget {
  const Contact({super.key});

  @override
  Widget build(BuildContext context) {
    
    return  Scaffold(
       appBar: AppBar(
        backgroundColor: const Color(0xFF00856e),
        leading: const Icon(Icons.arrow_back, color: Colors.white,),
        title: const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Select contact", style: TextStyle(color: Colors.white, fontSize: 16),),
            Text("256 contacts",  style: TextStyle(color: Colors.white, fontSize: 12),)
          ],
        ),
        actions: const [Padding(
          padding: EdgeInsets.all(8.0),
          child: Icon(Icons.search, color: Colors.white,),
        ), Icon(Icons.more_vert, color: Colors.white,)],
      ),
      body:  Column(
        children: [const Row(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Text("Create"),
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: Row(children: [Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(width: 40, height: 40, decoration: BoxDecoration(borderRadius: BorderRadius.circular(25), color: const Color(0xFF00856e)), child: const Icon(Icons.people, size: 28, color: Colors.white,), ),
          ),const Padding(
            padding: EdgeInsets.all(8.0),
            child: Text("New Group", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),),
          )],),
        ),
        Padding(
 padding: const EdgeInsets.symmetric(horizontal: 8),          child: Row(children: [Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(width: 40, height: 40, decoration: BoxDecoration(borderRadius: BorderRadius.circular(25), color: const Color(0xFF00856e)), child: const Icon(Icons.people, size: 28, color: Colors.white,), ),
          ),const Padding(
            padding: EdgeInsets.all(8.0),
            child: Text("New Contact", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),), 
          ),  const Spacer(), const Padding(
            padding: EdgeInsets.all(8.0),
            child: Icon(Icons.qr_code, color: Color(0xFF00856e),),
          )],),
        ),Padding(
 padding: const EdgeInsets.symmetric(horizontal: 8),          child: Row(children: [Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(width: 40, height: 40, decoration: BoxDecoration(borderRadius: BorderRadius.circular(25), color: const Color(0xFF00856e)), child: const Icon(Icons.people, size: 28, color: Colors.white,), ),
          ),const Padding(
            padding: EdgeInsets.all(8.0),
            child: Text("New Community", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),),
          )],),
        ),const Row(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Text("Discover"),
            ),
          ],
        ), Padding(
 padding: const EdgeInsets.symmetric(horizontal: 8),          child: Row(children: [Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(width: 40, height: 40, decoration: BoxDecoration(borderRadius: BorderRadius.circular(25), color: const Color(0xFF00856e)), child: const Icon(Icons.house, size: 28, color: Colors.white,), ),
          ),const Padding(
            padding: EdgeInsets.all(8.0),
            child: Text("Businesses", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),),
          )],),
        ),const Row(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Text("Contacts on WhatsApp"),
            ),
          ],
        ), 
        const Message(),
        const Message(),
        const Message(),
        const Message(),
        const Message(),
        const Message(),
        const Message(),

        ],
        
      ),
    );
  }
}


class Message extends StatelessWidget {
  const Message({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 2),
      child: Row(children: [
        Container(        height:50,
        width: 50,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(40),
          color: Color(0xFF00856e)     ), ),
        const Padding(
          padding: EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: 
            CrossAxisAlignment.start,
          children: [
            Text("Name", style:TextStyle(fontWeight: FontWeight.bold),),
            Text("Message")
          ],
                ),
        ),
      ],),
    );
  }
}


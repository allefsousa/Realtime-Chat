import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fluterchat/widget/text_compose.dart';
import 'package:flutter/material.dart';

class ChatScreen extends StatefulWidget {
  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {

  void _sendMessage(String text){
    Firestore.instance.collection("messages").add({"text":text});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Olá'),
      ),
      body: TextCompose( _sendMessage),
    );
  }
}

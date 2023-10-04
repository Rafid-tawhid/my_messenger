import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

class NewMessage extends StatefulWidget {
  const NewMessage({super.key});

  @override
  State<NewMessage> createState() => _NewMessageState();
}

class _NewMessageState extends State<NewMessage> {
  final _messageCon=TextEditingController();


  @override
  void dispose() {
    _messageCon.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 14,right: 14,bottom: 14),
      child: Row(
        children: [
          Expanded(child: TextField(
            textCapitalization: TextCapitalization.sentences,
            autocorrect: true,
            controller: _messageCon,
            enableSuggestions: true,
            decoration: InputDecoration(
              labelText: 'Send a message..'
            ),
          )),
          IconButton(onPressed: _submitMessage, icon: Icon(Icons.send,color: Colors.blueAccent,))

        ],
      ),
    );
  }


  Future<void> _submitMessage() async {


    final enteredMsg=_messageCon.text;
    if(enteredMsg.trim().isEmpty){
      return;
    }
    FocusScope.of(context).unfocus();
    _messageCon.clear();


    final user=FirebaseAuth.instance.currentUser!;
    final userData= await FirebaseFirestore.instance.collection('users').doc(user.uid).get();

    FirebaseFirestore.instance.collection('chat').add({
      'text':enteredMsg,
      'createdAt':Timestamp.now(),
      'userId':user.uid,
      'username':userData.data()!['username'],
      'userImage':userData.data()!['image_url']
    });

    _messageCon.clear();

  }
}

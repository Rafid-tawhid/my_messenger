import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_messenger/widgets/chat_bubble.dart';

class ChatMessage extends StatelessWidget{
  const ChatMessage({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    final authUser=FirebaseAuth.instance.currentUser!;

    return StreamBuilder(
        stream: FirebaseFirestore.instance.collection('chat').orderBy('createdAt',descending: true).snapshots(),
        builder: (context,snapshot){
          if(snapshot.connectionState==ConnectionState.waiting){
            return Center(child: CircularProgressIndicator(),);
          }
          else if(snapshot.data!.docs.isEmpty){
            return Center(child: Text('No message..'),);
          }
          else if(snapshot.hasError){
            return Center(child: Text('Something went wrong.'),);
          }
          else {
            final loadedMessage=snapshot.data!.docs;
            print('loadedMessage ${loadedMessage.length}');
            return ListView.builder(
              padding: EdgeInsets.only(left: 14,right: 14,bottom: 40),
              reverse: true,
              itemCount: loadedMessage.length,
              itemBuilder: (context,index){
                final chatMessage=loadedMessage[index].data();
                final nextChatMessage=index+1<loadedMessage.length?loadedMessage[index+1].data():null;
                final currentMessageUserId=chatMessage['userId'];
                final nextMessageUserId=nextChatMessage!=null?nextChatMessage['userId'] : null;
                final nextUserIsSame=nextMessageUserId==currentMessageUserId;
                if(nextUserIsSame){
                  return MessageBubble.next(message: chatMessage['text'], isMe: authUser.uid==currentMessageUserId);
                }
                else {
                  return MessageBubble.first(userImage: chatMessage['userImage'], username: chatMessage['username'], message: chatMessage['text'], isMe: authUser.uid==currentMessageUserId);
                }

              },
            );
          }
        });
  }


}
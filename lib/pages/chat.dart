import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:my_messenger/widgets/chat_message.dart';
import 'package:my_messenger/widgets/new_chat_messages.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});
  static const String routeName='chats';

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}


class _ChatScreenState extends State<ChatScreen> {

  @override
  void initState() {
    super.initState();
    print('CALLED....');
    setupPushNotification();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Chat box'),
      actions: [
        IconButton(onPressed: _logout, icon: Icon(Icons.exit_to_app))
      ],),
      body: Column(
        children: const [
          Expanded(child: ChatMessage()),
          NewMessage()
        ],
      ),
    );
  }

  void _logout() {
    FirebaseAuth.instance.signOut();
  }

  void setupPushNotification() async{
    final fcm= FirebaseMessaging.instance;
    await fcm.requestPermission();
    fcm.subscribeToTopic('chat');
    // final token=await fcm.getToken();
    // print('Token ${token}');
  }
}

import 'dart:async';
import 'dart:math';

import 'package:chat_gpt_flutter/chat_gpt_flutter.dart';
import 'package:chat_gpt_sdk/chat_gpt_sdk.dart';
import 'package:dash_chat_2/dash_chat_2.dart';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';



class TranslateScreen extends StatefulWidget {
  const TranslateScreen({Key? key}) : super(key: key);
  static const String routeName = '/tt';
  @override
  State<TranslateScreen> createState() => _TranslateScreenState();
}

class _TranslateScreenState extends State<TranslateScreen> {
  /// text controller
  final chatGpt =
      ChatGpt(apiKey: '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');

  String testPrompt =
      'Which Disney character famously leaves a glass slipper behind at a royal ball?';
  var testRequest;
  List<dynamic> _message=[];
  StreamSubscription? _subscription;
  TextEditingController controller=TextEditingController();

  void sendMessage(){
    ChatGpt chatGpt;
    ChatMessage(user: ChatUser(id: '121'), createdAt: DateTime.now());
    
    final request=CompleteText(
      model: KeyDataTransitMode.keyDataThenRawKeyData.name,
      maxTokens: 200,
      prompt: controller.text,);


  }

  @override
  void initState() {

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Flexible(
              child: ListView.builder(
                itemCount: _message.length,
                itemBuilder: (context,index)=>_message[index],
              )),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                    child: TextField(
                      controller: controller,
                  decoration: InputDecoration(hintText: 'Send Message'),
                )),
                IconButton(onPressed: sendMessage, icon: Icon(Icons.send))
              ],
            ),
          )
        ],
      ),
    );
  }
}

// class ChatGptPage extends StatefulWidget {
//   static const String routeName='/chat_gpt';
//   const ChatGptPage({super.key});
//
//   @override
//   State<ChatGptPage> createState() => _ChatGptPageState();
// }
//
// class _ChatGptPageState extends State<ChatGptPage> {
//   final _openAI = OpenAI.instance.build(
//     token: OPENAI_API_KEY,
//     baseOption: HttpSetup(
//       receiveTimeout: const Duration(
//         seconds: 5,
//       ),
//     ),
//     enableLog: true,
//   );
//
//   final ChatUser _currentUser =
//   ChatUser(id: '1', firstName: 'Rafid', lastName: 'Tawhid');
//
//   final ChatUser _gptChatUser =
//   ChatUser(id: '2', firstName: 'Virtual', lastName: 'Assistant');
//
//   List<ChatMessage> _messages = <ChatMessage>[];
//   List<ChatUser> _typingUsers = <ChatUser>[];
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: const Color.fromRGBO(
//           0,
//           166,
//           126,
//           1,
//         ),
//         title: const Text(
//           'Virtual Assistant',
//           style: TextStyle(
//             color: Colors.white,
//           ),
//         ),
//       ),
//       body: DashChat(
//           currentUser: _currentUser,
//           typingUsers: _typingUsers,
//           messageOptions: const MessageOptions(
//             currentUserContainerColor: Colors.black,
//             containerColor: Color.fromRGBO(
//               0,
//               166,
//               126,
//               1,
//             ),
//             textColor: Colors.white,
//           ),
//           onSend: (ChatMessage m) {
//             getChatResponse(m);
//           },
//           messages: _messages),
//     );
//   }
//
//   Future<void> getChatResponse(ChatMessage m) async {
//     setState(() {
//       _messages.insert(0, m);
//       _typingUsers.add(_gptChatUser);
//     });
//     List<Messages> _messagesHistory = _messages.reversed.map((m) {
//       if (m.user == _currentUser) {
//         return Messages(role: Role.user, content: m.text);
//       } else {
//         return Messages(role: Role.assistant, content: m.text);
//       }
//     }).toList();
//     final request = ChatCompleteText(
//       model: GptTurbo0301ChatModel(),
//       messages: _messagesHistory,
//       maxToken: 200,
//     );
//     final response = await _openAI.onChatCompletion(request: request);
//     for (var element in response!.choices) {
//       if (element.message != null) {
//         setState(() {
//           _messages.insert(
//             0,
//             ChatMessage(
//                 user: _gptChatUser,
//                 createdAt: DateTime.now(),
//                 text: element.message!.content),
//           );
//         });
//       }
//     }
//     setState(() {
//       _typingUsers.remove(_gptChatUser);
//     });
//   }
// }

import 'dart:async';
import 'dart:convert';
import 'dart:math';

import 'package:chat_bubbles/bubbles/bubble_normal.dart';
import 'package:chat_gpt_flutter/chat_gpt_flutter.dart';
import 'package:chat_gpt_sdk/chat_gpt_sdk.dart';
import 'package:dash_chat_2/dash_chat_2.dart';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;



class TranslateScreen extends StatefulWidget {
  const TranslateScreen({Key? key}) : super(key: key);
  static const String routeName = '/tt';
  @override
  State<TranslateScreen> createState() => _TranslateScreenState();
}

class _TranslateScreenState extends State<TranslateScreen> {
  /// text controller
  final String apiKey = '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';
  final String apiUrl = 'https://api.openai.com/v1/engines/davinci/completions';

  TextEditingController controller = TextEditingController();
  ScrollController scrollController = ScrollController();
  List<Message> msgs = [];
  bool isTyping = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ChatGPT App'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                  controller: scrollController,
                  itemCount: msgs.length,
                  shrinkWrap: true,
                  reverse: true,
                  itemBuilder: (context, index) {
                    return Padding(
                        padding: const EdgeInsets.symmetric(vertical: 4),
                        child: isTyping && index == 0
                            ? Column(
                          children: [
                            BubbleNormal(
                              text: msgs[0].msg,
                              isSender: true,
                              color: Colors.blue.shade100,
                            ),
                            const Padding(
                              padding: EdgeInsets.only(left: 16, top: 4),
                              child: Align(
                                  alignment: Alignment.centerLeft,
                                  child: Text("Typing...")),
                            )
                          ],
                        )
                            : BubbleNormal(
                          text: msgs[index].msg,
                          isSender: msgs[index].isSender,
                          color: msgs[index].isSender
                              ? Colors.blue.shade100
                              : Colors.grey.shade200,
                        ));
                  }),
            ),

            Row(
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      width: double.infinity,
                      height: 40,
                      decoration: BoxDecoration(
                          color: Colors.grey[200],
                          borderRadius: BorderRadius.circular(10)),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8),
                        child: TextField(
                          controller: controller,
                          textCapitalization: TextCapitalization.sentences,
                          onSubmitted: (value) {
                            sendMsg();
                          },
                          textInputAction: TextInputAction.send,
                          showCursor: true,
                          decoration: const InputDecoration(
                              border: InputBorder.none, hintText: "Enter text"),
                        ),
                      ),
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    sendMsg();
                  },
                  child: Container(
                    height: 40,
                    width: 40,
                    decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.circular(30)),
                    child: const Icon(
                      Icons.send,
                      color: Colors.white,
                    ),
                  ),
                ),
                const SizedBox(
                  width: 8,
                )
              ],
            ),

          ],
        ),
      ),
    );
  }

  void sendMsg() async {
    String text = controller.text;
    // String apiKey = "RAFIDsk-VRNPWaM7wHPFphpPWouiT3BlbkFJhRkyRUu6QSsBgsFXZ3fkRAFID";
    controller.clear();
    try {
      if (text.isNotEmpty) {
        setState(() {
          msgs.insert(0, Message(true, text));
          isTyping = true;
        });
        scrollController.animateTo(0.0,
            duration: const Duration(seconds: 1), curve: Curves.easeOut);
        var response = await http.post(
            Uri.parse("https://api.openai.com/v1/chat/completions"),
            headers: {
              "Authorization": "Bearer $apiKey",
              "Content-Type": "application/json"
            },
            body: jsonEncode({
              "model": "gpt-3.5-turbo",
              "messages": [
                {"role": "user", "content": text}
              ]
            }));
        print('response ${response.body.toString()}');
        if (response.statusCode == 200) {
          var json = jsonDecode(response.body);
          setState(() {
            isTyping = false;
            msgs.insert(
                0,
                Message(
                    false,
                    json["choices"][0]["message"]["content"]
                        .toString()
                        .trimLeft()));
          });
          scrollController.animateTo(0.0,
              duration: const Duration(seconds: 1), curve: Curves.easeOut);
        }
      }
    } on Exception {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text("Some error occurred, please try again!")));
    }
  }

}


class Message {
  bool isSender;
  String msg;
  Message(this.isSender, this.msg);
}

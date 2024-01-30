import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:http/http.dart' as http;
import 'package:my_messenger/models/user_model.dart';

class ChatGPTApp extends StatelessWidget {
  const ChatGPTApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ChatScreenGPT(),
    );
  }
}

class ChatScreenGPT extends StatefulWidget {
  const ChatScreenGPT({Key? key}) : super(key: key);

  @override
  _ChatScreenGPTState createState() => _ChatScreenGPTState();
}

class _ChatScreenGPTState extends State<ChatScreenGPT> {
  final TextEditingController _textController = TextEditingController();
  final List<Map<String, String>> _messages = [];
  static const String _openAiKey = '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';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ChatGPT App'),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: _messages.length,
              itemBuilder: (context, index) {
                final message = _messages[index];
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 4.0, horizontal: 8.0),
                  child: Container(
                    decoration: BoxDecoration(
                      color: message['role'] == 'user' ? Colors.blue[200] : Colors.grey[300],
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          message['role']!,
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(height: 4.0),
                        Text(
                          message['content']!,
                          style: TextStyle(fontSize: 16.0),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0,vertical: 12),
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 16.0),
                    decoration: BoxDecoration(
                      color: Colors.grey[200],
                      borderRadius: BorderRadius.circular(24.0),
                    ),
                    child: TextField(
                      controller: _textController,
                      decoration: const InputDecoration(
                        hintText: 'Type your message...',
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.send, color: Theme.of(context).primaryColor),
                  onPressed: _sendMessage,
                ),
              ],
            ),
          ),

        ],
      ),
    );
  }

  Future<void> _sendMessage() async {
    final String userMessage = _textController.text;
    if (userMessage.isNotEmpty) {
      final String assistantMessage = await chatGPTAPI(userMessage);
      setState(() {
        _messages.add({'role': UserModel.name??'Rafid', 'content': userMessage});
        _messages.add({'role': 'assistant', 'content': assistantMessage});
        _textController.clear();
      });
    }
  }

  Future<String> chatGPTAPI(String prompt) async {
    _messages.add({'role': 'user', 'content': prompt});
    try {
      EasyLoading.show();
      final res = await http.post(
        Uri.parse('https://api.openai.com/v1/chat/completions'),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $_openAiKey',
        },
        body: jsonEncode({
          "model": "gpt-3.5-turbo",
          "messages": _messages,
        }),
      );
      EasyLoading.dismiss();

      if (res.statusCode == 200) {
        String content = jsonDecode(res.body)['choices'][0]['message']['content'];
        content = content.trim();

        _messages.add({'role': 'assistant', 'content': content});
        return content;
      }
      return 'An internal error occurred';
    } catch (e) {
      return e.toString();
    }
  }
}

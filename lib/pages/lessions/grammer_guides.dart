import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class GrammarGuideScreen extends StatefulWidget {
 static const String routeName='/grammer';
  final GrammarGuide grammarGuide = GrammarGuide(
    apiKey: '379fe71e03msh216273e71a2dce3p14cb76jsnca85298c495e',
    apiHost: 'wordsapiv1.p.rapidapi.com',
    apiEndpoint: 'https://wordsapiv1.p.rapidapi.com',
  );


  @override
  _GrammarGuideScreenState createState() => _GrammarGuideScreenState();
}

class _GrammarGuideScreenState extends State<GrammarGuideScreen> {
  Map<String, dynamic>? result;

  Future<void> _getTypeOfWord() async {
    try {
      final result = await widget.grammarGuide.getTypeOf('hatchback');
      setState(() {
        this.result = result;
      });
    } catch (e) {
      print('Error: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: _getTypeOfWord,
              child: const Text('Get Type of Word'),
            ),
            const SizedBox(height: 16),
            if (result != null)
              Text(
                'Result: ${result!}',
                style: TextStyle(fontSize: 16),
              ),
          ],
        ),
      ),
    );
  }
}

class GrammarGuide {
  final String apiKey;
  final String apiHost;
  final String apiEndpoint;

  GrammarGuide({
    required this.apiKey,
    required this.apiHost,
    required this.apiEndpoint,
  });

  Future<Map<String, dynamic>> getTypeOf(String word) async {
   // final url = Uri.parse('$apiEndpoint/words/$word/typeOf');
    final url = Uri.parse('https://api.dictionaryapi.dev/api/v2/entries/en/great');

    try {
      final response = await http.get(
        url,
        // headers: {
        //   'X-RapidAPI-Key': apiKey,
        //   'X-RapidAPI-Host': apiHost,
        // },
      );

      print('response ${jsonDecode(response.body)}');

      if (response.statusCode == 200) {

        return jsonDecode(response.body);
      } else {
        throw Exception('Failed to load data');
      }
    } catch (e) {
      throw Exception('Error: $e');
    }
  }
}
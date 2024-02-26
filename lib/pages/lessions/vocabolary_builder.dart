import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class DictionaryApp extends StatefulWidget {
  @override
  _DictionaryAppState createState() => _DictionaryAppState();
}

class _DictionaryAppState extends State<DictionaryApp> {
  TextEditingController _textEditingController = TextEditingController();
  String _meaning = '';

  Future<void> getWordMeaning(String word) async {
    String apiUrl =
        'https://api.dictionaryapi.dev/api/v2/entries/en_US/$word';
    try {
      final response = await http.get(Uri.parse(apiUrl));
      if (response.statusCode == 200) {
        final List<dynamic> meanings = jsonDecode(response.body);
        if (meanings.isNotEmpty) {
          setState(() {
            _meaning = meanings[0]['meanings'][0]['definitions'][0]['definition'];
          });
        } else {
          setState(() {
            _meaning = 'No meaning found for this word.';
          });
        }
      } else {
        setState(() {
          _meaning = 'Error: ${response.statusCode}';
        });
      }
    } catch (e) {
      setState(() {
        _meaning = 'Error: $e';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dictionary App'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: _textEditingController,
              decoration: InputDecoration(
                labelText: 'Enter a word',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                String word = _textEditingController.text.trim();
                if (word.isNotEmpty) {
                  getWordMeaning(word);
                }
              },
              child: Text('Get Meaning'),
            ),
            SizedBox(height: 20),
            Text(
              _meaning,
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 20),
            Expanded(
              child: MeaningfulWordsList(),
            ),
          ],
        ),
      ),
    );
  }
}

class MeaningfulWordsList extends StatelessWidget {
  final List<String> words = [
    'Love',
    'Peace',
    'Happiness',
    'Friendship',
    'Family',
    'Kindness',
    'Gratitude',
    'Success',
    'Courage',
    'Empathy',
    'Compassion',
    'Resilience',
    'Generosity',
    'Wisdom',
    'Hope',
    'Optimism',
    'Freedom',
    'Equality',
    'Creativity',
    'Passion',
    'Inspiration',
    'Motivation',
    'Understanding',
    'Trust',
    'Faith',
    'Patience',
    'Confidence',
    'Joy',
    'Humility',
    'Contentment'
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: words.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(words[index]),
          onTap: () {
            _showWordMeaningDialog(context, words[index]);
          },
        );
      },
    );
  }

  Future<void> _showWordMeaningDialog(BuildContext context, String word) async {
    String meaning = await _fetchMeaning(word);
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(word),
          content: Text(meaning),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Close'),
            ),
          ],
        );
      },
    );
  }

  Future<String> _fetchMeaning(String word) async {
    String apiUrl = 'https://api.dictionaryapi.dev/api/v2/entries/en_US/$word';
    try {
      final response = await http.get(Uri.parse(apiUrl));
      if (response.statusCode == 200) {
        final List<dynamic> meanings = jsonDecode(response.body);
        if (meanings.isNotEmpty) {
          return meanings[0]['meanings'][0]['definitions'][0]['definition'];
        } else {
          return 'No meaning found for this word.';
        }
      } else {
        return 'Error: ${response.statusCode}';
      }
    } catch (e) {
      return 'Error: $e';
    }
  }
}



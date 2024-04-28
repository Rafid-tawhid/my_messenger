import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:my_messenger/utils/rapid_api_model.dart';

Future<void> checkGrammar() async {
  var url = Uri.parse('https://grammarbot.p.rapidapi.com/check');
  var headers = {
    'content-type': 'application/x-www-form-urlencoded',
    'X-RapidAPI-Key': 'c0bf2a27aemsh29280d32fdd3f77p17bb17jsnb469f31d7834',
    'X-RapidAPI-Host': 'grammarbot.p.rapidapi.com'
  };
  var body = 'text=Susan%20go%20to%20the%20store%20everyday&language=en-US';

  try {
    var response = await http.post(url, headers: headers, body: body);

    if (response.statusCode == 200) {
      // Handle successful response
     // print('Response: ${response.body}');

      handleGrammarBotResponse(response.body);
    } else {
      // Handle other response codes
      print('Request failed with status: ${response.statusCode}');
    }
  } catch (e) {
    // Handle exceptions
    print('Exception: $e');
  }
}

void handleGrammarBotResponse(String responseBody) {
  // Parse the JSON response
  Map<String, dynamic> jsonResponse = jsonDecode(responseBody);

  // Create a GrammarBotResponse object
  GrammarBotResponse response = GrammarBotResponse.fromJson(jsonResponse);

  // Access various parts of the response
  print('Software: ${response.software}');
  print('Language: ${response.language}');
  print('Matches: ${response.matches}');

  // Example: Accessing the first match
  if (response.matches.isNotEmpty) {
    var firstMatch = response.matches.first;
    print('Message: ${firstMatch['message']}');
    print('Short Message: ${firstMatch['shortMessage']}');
    print('Replacements: ${firstMatch['replacements']}');
    print('Offset: ${firstMatch['offset']}');
    print('Length: ${firstMatch['length']}');
    print('Context: ${firstMatch['context']}');
    print('Sentence: ${firstMatch['sentence']}');
  }
  }
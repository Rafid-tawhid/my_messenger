import 'package:flutter/cupertino.dart';
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:my_messenger/utils/rapid_api_model.dart';

class RapidProvider extends ChangeNotifier{

  GrammarBotResponse? responseGrammer;
  dynamic fullResponse;

  Future<void> checkGrammar(String message) async {
    var url = Uri.parse('https://grammarbot.p.rapidapi.com/check');
    var headers = {
      'content-type': 'application/x-www-form-urlencoded',
      'X-RapidAPI-Key': 'c0bf2a27aemsh29280d32fdd3f77p17bb17jsnb469f31d7834',
      'X-RapidAPI-Host': 'grammarbot.p.rapidapi.com'
    };
    var body = 'text=${encodeSentence(message)}&language=en-US';

    print('SEND BODY: ${body}');
    try {
      var response = await http.post(url, headers: headers, body: body);

      if (response.statusCode == 200) {
        // Handle successful response
        // print('Response: ${response.body}');
        responseGrammer=null;
        fullResponse=null;

        fullResponse=response.body;
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
    responseGrammer = GrammarBotResponse.fromJson(jsonResponse);
    // Printing the message from the first match
    print(responseGrammer!.matches[0].message);


    notifyListeners();
  }

  String encodeSentence(String sentence) {
    return sentence.replaceAll(' ', '%20');
  }
}


//examples
//She don't likes to eat vegetables.
//Susan go to the store everyday
//We was planning to go on a trip


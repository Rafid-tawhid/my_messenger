import 'package:flutter/cupertino.dart';
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:my_messenger/utils/rapid_api_model.dart';

class RapidProvider extends ChangeNotifier{

  Software? software;
  Warnings? warnings;
  GrammarCheckResult? grammarCheckResult;

  dynamic fullResponse;
  bool showLoadingBar=false;

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
      showLoadingBar=true;
      var response = await http.post(url, headers: headers, body: body);

      showLoadingBar=false;

      if (response.statusCode == 200) {
        // Handle successful response
         print('Response: ${response.body}');
        fullResponse=response.body;
        handleGrammarBotResponse(fullResponse);
      } else {
        // Handle other response codes
        print('Request failed with status: ${response.statusCode}');
      }
    } catch (e) {
      showLoadingBar=false;
      // Handle exceptions
      print('Exception: $e');
    }
    notifyListeners();
  }

  void handleGrammarBotResponse(dynamic responseBody) {
    // Parse the JSON response
    Map<String, dynamic> jsonResponse = jsonDecode(responseBody);
   try{
     grammarCheckResult =GrammarCheckResult.fromJson(jsonResponse);
   }
   catch(e){
     print('Somthing Went Wrong ${e}');
   }
  }

  String encodeSentence(String sentence) {
    return sentence.replaceAll(' ', '%20');
  }
}


//examples
//She don't likes to eat vegetables.
//Susan go to the store everyday
//We was planning to go on a trip
//Her are going to the store to buy some apples
//he dog eated my homework
//He goed to the store yesterday.
//The cat sleeped on the couch




//response
// {
//   "software": {
//     "name": "GrammarBot",
//     "version": "4.3.1",
//     "apiVersion": 1,
//     "premium": true,
//     "premiumHint": "Thanks for supporting GrammarBot!",
//     "status": ""
//   },
//   "warnings": {
//     "incompleteResults": false
//   },
//   "language": {
//     "name": "English (US)",
//     "code": "en-US",
//     "detectedLanguage": {
//       "name": "English (US)",
//       "code": "en-US"
//     }
//   },
//   "matches": [
//     {
//       "message": "Statistics suggests that 'He' might be the correct word here. Please check.",
//       "shortMessage": "",
//       "replacements": [
//         {
//           "value": "He"
//         }
//       ],
//       "offset": 0,
//       "length": 3,
//       "context": {
//         "text": "Her are going to the store to buy some appl...",
//         "offset": 0,
//         "length": 3
//       },
//       "sentence": "Her are going to the store to buy some apples",
//       "type": {
//         "typeName": "Other"
//       },
//       "rule": {
//         "id": "CONFUSION_RULE",
//         "description": "Statistically detect wrong use of words that are easily confused",
//         "issueType": "non-conformance",
//         "category": {
//           "id": "TYPOS",
//           "name": "Possible Typo"
//         }
//       }
//     }
//   ]
// }
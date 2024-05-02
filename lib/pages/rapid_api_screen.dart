import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:my_messenger/providers/rapid_provider.dart';
import 'package:provider/provider.dart';

class RapidApiScreen extends StatefulWidget {
  const RapidApiScreen({super.key});

  @override
  State<RapidApiScreen> createState() => _RapidApiScreenState();
}

class _RapidApiScreenState extends State<RapidApiScreen> {
  TextEditingController controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final pro = Provider.of<RapidProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('GrammarBot'),
        actions: [
          IconButton(
              onPressed: () {
                showModalBottomSheet(
                    context: context,
                    builder: (context) {
                      final provider = Provider.of<RapidProvider>(context);
                      if (provider.fullResponse != null) {
                        print(provider.fullResponse.toString());
                        return Padding(
                          padding: const EdgeInsets.all(30.0),
                          child: Container(
                              height: MediaQuery.sizeOf(context).height / 2,
                              child: SingleChildScrollView(
                                  child: Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(10.0),
                                    child: Text(
                                      'Response',
                                      style: TextStyle(fontSize: 22),
                                    ),
                                  ),
                                  Text(
                                    provider.fullResponse,
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ))),
                        );
                      } else {
                        return Text('Nothing to show');
                      }
                    });
              },
              icon: Icon(Icons.info_outline))
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 12.0),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey),
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    child: TextField(
                      controller: controller,
                      decoration: InputDecoration(
                        hintText: 'Search...',
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 8.0),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(4),
                    ),
                  ),
                  onPressed: () async {
                    if (controller.text.isNotEmpty) {
                      EasyLoading.show();
                      await pro.checkGrammar(controller.text.trim());
                      EasyLoading.dismiss();
                    }
                  },
                  child: Icon(Icons.search),
                ),
              ],
            ),
          ),
          Consumer<RapidProvider>(
            builder: (context, provider, _) {
              if (provider.grammarCheckResult != null) {
                // return Expanded(
                //     child: ListView.builder(
                //   itemCount: provider.grammarCheckResult!.matches.length,
                //   itemBuilder: (context, index) {
                //     final match = provider.grammarCheckResult!.matches[index];
                //     // return ListTile(
                //     //   title: Text(
                //     //     match.message,
                //     //     style: TextStyle(fontWeight: FontWeight.bold),
                //     //   ),
                //     //   subtitle: Column(
                //     //     crossAxisAlignment: CrossAxisAlignment.start,
                //     //     children: [
                //     //       Text('Sentence: ${match.sentence}'),
                //     //       Text('Mistake: ${provider.grammarCheckResult!.matches.first.shortMessage}'),
                //     //       // Text(
                //     //       //     'Offset: ${match.offset}, Length: ${match.length}'),
                //     //       Text(
                //     //           'Suggestion: ${match.replacements.isNotEmpty ? match.replacements[0].value : "N/A"}'),
                //     //     ],
                //     //   ),
                //     //   leading: Icon(Icons.error, color: Colors.red),
                //     //   trailing: Icon(Icons.arrow_forward),
                //     //   onTap: () {
                //     //     // Handle tap action
                //     //   },
                //     // );
                //
                //
                //   },
                // ));

                return Expanded(
                  child: ListView(
                    children: [
                      // ListTile(
                      //   title: Text('Software'),
                      //   subtitle: Text('Name: ${provider.grammarCheckResult!.software.name}\nVersion: ${provider.grammarCheckResult!.software.version}\nAPI Version: ${provider.grammarCheckResult!.software.apiVersion}\nPremium: ${provider.grammarCheckResult!.software.premium}\nPremium Hint: ${provider.grammarCheckResult!.software.premiumHint}\nStatus: ${provider.grammarCheckResult!.software.status}'),
                      // ),
                      ListTile(
                        title: Text('Warnings'),
                        subtitle: Text('Incomplete Results: ${provider.grammarCheckResult!.warnings.incompleteResults}'),
                      ),
                      ListTile(
                        title: Text('Language'),
                        subtitle: Text('Name: ${provider.grammarCheckResult!.language.name}\nDetected Language: ${provider.grammarCheckResult!.language.detectedLanguage.name} (${provider.grammarCheckResult!.language.detectedLanguage.code})'),
                      ),
                      ListTile(
                        title: Text('Matches (${provider.grammarCheckResult!.matches.length})'),
                        subtitle: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: provider.grammarCheckResult!.matches.map((match) => Text('Message: ${match.message}\nShort Message: ${match.shortMessage}\nContext: ${match.context.text}\nSentence: ${match.sentence}\nType: ${match.type.typeName}\nRule Description: ${match.rule.description}\n')).toList(),
                        ),
                      ),
                    ],
                  ),
                );
              } else {
                return Text('Nothing to show..');
              }
            },
          ),
        ],
      ),
    );
    ;
  }
}

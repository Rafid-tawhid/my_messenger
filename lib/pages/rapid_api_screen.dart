import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_messenger/providers/rapid_provider.dart';
import 'package:provider/provider.dart';

class RapidApiScreen extends StatefulWidget {
  const RapidApiScreen({super.key});

  @override
  State<RapidApiScreen> createState() => _RapidApiScreenState();
}

class _RapidApiScreenState extends State<RapidApiScreen> {
  TextEditingController controller=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('GrammarBot responseGrammer '),
      ),
      body: Consumer<RapidProvider>(
        builder: (context,provider,_){
          if(provider.responseGrammer==null){
            return Center(child: CircularProgressIndicator());
          }
          else {
            return Column(
              children: [

                Row(
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
                      onPressed: () {
                        if(controller.text.isNotEmpty){
                          provider.checkGrammar(controller.text.trim());
                        }
                      },
                      child: Icon(Icons.search),
                    ),
                  ],
                ),

                Text('MESSAGE : ${provider.responseGrammer!.matches.first.sentence}'),
                Expanded(
                  child: ListView.builder(
                    itemCount: provider.responseGrammer!.matches.length,
                    itemBuilder: (context, index) {
                     final match = provider.responseGrammer!.matches[index];
                     if(provider.responseGrammer!.matches.length==0){
                       return Text('No Data found to show');
                     }
                     else {
                       return Card(
                         margin: EdgeInsets.all(8.0),
                         child: Padding(
                           padding: EdgeInsets.all(16.0),
                           child: Column(
                             crossAxisAlignment: CrossAxisAlignment.start,
                             children: [
                               Text(
                                 match.shortMessage,
                                 style: TextStyle(
                                   fontWeight: FontWeight.bold,
                                   fontSize: 18.0,
                                 ),
                               ),
                               SizedBox(height: 8.0),
                               Text(
                                 match.message,
                                 style: TextStyle(fontSize: 16.0),
                               ),
                               SizedBox(height: 8.0),
                               Text(
                                 'Suggested replacements:',
                                 style: TextStyle(fontWeight: FontWeight.bold),
                               ),
                               Column(
                                 crossAxisAlignment: CrossAxisAlignment.start,
                                 children: match.replacements.map((replacement) {
                                   return Text(
                                     replacement.value,
                                     style: TextStyle(fontSize: 16.0),
                                   );
                                 }).toList(),
                               ),
                             ],
                           ),
                         ),
                       );
                     }
                    },
                  ),
                ),
              ],
            );
          }
        },
      ),
    );;
  }
}

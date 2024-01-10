import 'package:flutter/material.dart';
import 'package:my_messenger/pages/lessions/reading_steps.dart';
import 'package:my_messenger/pages/lessions/speech_demo.dart';
import 'package:my_messenger/pages/lessions/writing/text_to_speech.dart';

import '../../models/quiz_models.dart';
import '../../widgets/cards.dart';
import 'listening_screen.dart';

final List<Topic> basics = [
  Topic(name: 'Reading', imagePath: 'images/flags/reading.png'),
  Topic(name: 'Writing', imagePath: 'images/flags/writing.png'),
  Topic(name: 'Listening', imagePath: 'images/flags/listen.png'),
  Topic(name: 'Speaking', imagePath: 'images/flags/speaking.png'),

];

class BasicsOfLanguage extends StatelessWidget {
  String title;
  BasicsOfLanguage(this.title);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Learn & Practice $title'),
      ),
      body: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 8.0,
          mainAxisSpacing: 8.0,
        ),
        itemCount: basics.length,
        itemBuilder: (context, index) {
          return TopicCard(topic: basics[index],onTaap: (value){
            if(value=='Reading'){
              Navigator.push(context, MaterialPageRoute(builder: (context)=>ReadingSteps()));
            }
            if(value=='Speaking'){
              Navigator.push(context, MaterialPageRoute(builder: (context)=>SpeechDemo()));
            }
            if(value=='Writing'){
              Navigator.push(context, MaterialPageRoute(builder: (context)=>SpeechSampleApp()));
              //Navigator.push(context, MaterialPageRoute(builder: (context)=>SpeechSampleApp()));
            }
            if(value=='Listening'){
              Navigator.push(context, MaterialPageRoute(builder: (context)=>ListeningScreen()));
            }
          },);
        },
      ),
    );
  }
}

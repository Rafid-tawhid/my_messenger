import 'package:flutter/material.dart';
import 'package:my_messenger/pages/chat.dart';
import 'package:my_messenger/pages/question_page.dart';
import '../models/quiz_models.dart';
import '../pages/translation_screens.dart';
import '../pages/lessions/lessions_step.dart';
import '../pages/translater_page.dart';

class TopicCard extends StatelessWidget {
  final Topic topic;
  final Function(String value) onTaap;

  TopicCard({required this.topic,required this.onTaap});



  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5.0,
      color: Colors.white ,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
      child: Container(
        
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12)
        ),
        child: InkWell(
          onTap: (){
            onTaap(topic.name);
          },
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
             // const Icon(Icons.access_alarm,size: 100,),
              Image.asset(
                topic.imagePath,
                height: 100.0,
                width: 100.0,
                fit: BoxFit.cover,
              ),
              const SizedBox(height: 10.0),
              Text(
                topic.name,
                style: const TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}


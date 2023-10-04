import 'package:flutter/material.dart';
import 'package:my_messenger/pages/question_page.dart';
import '../models/quiz_models.dart';
import '../pages/translater_page.dart';

class TopicCard extends StatelessWidget {
  final Topic topic;

  TopicCard({required this.topic});



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
            if(topic.name=='Speech Recognition'){
              Navigator.pushNamed(context,TranslatorApp.routeName);
            }
            if(topic.name=='Interactive Quizzes'){
              Navigator.pushNamed(context,QustionPage.routeName);
            }

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
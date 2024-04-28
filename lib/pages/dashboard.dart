import 'package:flutter/material.dart';
import 'package:my_messenger/pages/progress_tracking.dart';
import 'package:my_messenger/pages/question_page.dart';
import 'package:my_messenger/pages/translater_page.dart';

import '../demo_camera.dart';
import '../utils/temp_db.dart';
import '../widgets/cards.dart';
import '../widgets/drawer.dart';
import 'chat.dart';
import 'lessions/record_my_audio.dart';
import 'lessions/vocabolary_builder.dart';
import 'translation_screens.dart';
import 'lessions/chat_gpt_screen.dart';
import 'lessions/grammer_guides.dart';
import 'lessions/lessions_step.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});
  static const String routeName='/dashboard';

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MyDrawer(),
      appBar: AppBar(
        title: const Text('Education Topics'),
      ),
      body: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 8.0,
          mainAxisSpacing: 8.0,
        ),
        itemCount: topics.length,
        itemBuilder: (context, index) {
          return TopicCard(topic: topics[index],onTaap: (value) {
            if(value=='Language Conversion'){
              Navigator.pushNamed(context,TranslatorApp.routeName);
            }
            if(value=='Interactive Quizzes'){
              Navigator.pushNamed(context,QustionPage.routeName);
            }
            if(value=='Interactive Lessons'){
              Navigator.push(context, MaterialPageRoute(builder: (context)=>LessionsSteps()));
            }
            if(value=='Flashcards and Vocabulary Builders'){

              Navigator.push(context, MaterialPageRoute(builder: (context)=>DictionaryApp()));
            }
            if(value=='Common Discussion'){
             Navigator.pushNamed(context,ChatScreen.routeName);
            }
            if(value=='Feedback and Support'){
              Navigator.push(context, MaterialPageRoute(builder: (context)=>ChatGPTApp()));
            }
            if(value=='Progress Tracking'){
              Navigator.pushNamed(context,ProgressTracking.routeName);
            }
            if(value=='Grammar Guides'){
              Navigator.pushNamed(context,GrammarGuideScreen.routeName);
            }
            if(value=='Social Features'){
           //   Navigator.push(context, MaterialPageRoute(builder: (context)=>RecorderExample()));
              Navigator.push(context, MaterialPageRoute(builder: (context)=>CameraScreen()));

            }
          },);
        },
      ),
    );
  }
}

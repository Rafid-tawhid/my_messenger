import 'package:flutter/material.dart';
import 'package:my_messenger/pages/progress_tracking.dart';
import 'package:my_messenger/pages/question_page.dart';
import 'package:my_messenger/pages/translater_page.dart';

import '../utils/temp_db.dart';
import '../widgets/cards.dart';
import '../widgets/drawer.dart';
import 'chat.dart';
import 'chat_gpt_page.dart';
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
        title: Text('Education Topics'),
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
            if(value=='Common Discussion'){
              Navigator.pushNamed(context,ChatScreen.routeName);
            }
            if(value=='Feedback and Support'){
              Navigator.pushNamed(context,TranslateScreen.routeName);
            }
            if(value=='Progress Tracking'){
              Navigator.pushNamed(context,ProgressTracking.routeName);
            }
          },);
        },
      ),
    );
  }
}

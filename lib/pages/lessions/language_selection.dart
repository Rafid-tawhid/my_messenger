import 'package:flutter/material.dart';

import '../../models/quiz_models.dart';
import '../../widgets/cards.dart';

final List<Topic> languages = [
  Topic(name: 'English', imagePath: 'images/flags/usa.png'),
  Topic(name: 'Hindi', imagePath: 'images/flags/india.png'),
  Topic(name: 'Arabic', imagePath: 'images/flags/uae.png'),
  Topic(name: 'German', imagePath: 'images/flags/germany.png'),
  Topic(name: 'Russian', imagePath: 'images/flags/russia.png'),
  Topic(name: 'Spanish', imagePath: 'images/flags/spain.png'),
  Topic(name: 'Urdu', imagePath: 'images/flags/pakistan.png'),
  Topic(name: 'Japanese', imagePath: 'images/flags/japan.png'),
  Topic(name: 'Italian', imagePath: 'images/flags/italy.png'),
];



class LanguageSelection extends StatelessWidget {
  const LanguageSelection({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Select Language'),
      ),
      body: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 8.0,
          mainAxisSpacing: 8.0,
        ),
        itemCount: languages.length,
        itemBuilder: (context, index) {
          return TopicCard(topic: languages[index],onTaap: (value){

          },);
        },
      ),
    );
  }
}

import 'package:flutter/material.dart';

import '../../models/quiz_models.dart';

final List<Topic> basicsOfReading = [
  Topic(
    name: 'Understand the Basic Parts of Speech',
    imagePath: 'images/flags/reading.png',
    subTitle: 'Unlock the essence of language by delving into the foundational components that give words their roles and meanings.',
  ),
  Topic(
    name: 'Master Sentence Structure',
    imagePath: 'images/flags/writing.png',
    subTitle: 'Build a strong linguistic foundation as you grasp the art of constructing sentences, understanding how words come together to convey meaning.',
  ),
  Topic(
    name: 'Study Verb Tenses',
    imagePath: 'images/flags/listen.png',
    subTitle: 'Embark on a journey through time with verb tenses, mastering the art of expressing actions in the past, present, and future.',
  ),
  Topic(
    name: 'Practice Vocabulary',
    imagePath: 'images/flags/listen.png',
    subTitle: 'Expand your linguistic palette by immersing yourself in the world of words, enriching your vocabulary for more articulate expression.',
  ),
  Topic(
    name: 'Practice Regularly',
    imagePath: 'images/flags/speaking.png',
    subTitle: 'Cultivate your language skills through consistent practice, refining your abilities to read, write, listen, and speak with increasing proficiency.',
  ),
];

class ReadingSteps extends StatelessWidget {
  const ReadingSteps({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Basics of Reading'), // Customize app bar color
      ),
      body: ListView.builder(
        itemCount: basicsOfReading.length,
        itemBuilder: (context, index) {
          return Card(
            elevation: 5,
            margin: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
            child: ListTile(
              leading: CircleAvatar(
                radius: 25,
                backgroundImage: AssetImage(basicsOfReading[index].imagePath),
              ),
              title: Text(
                basicsOfReading[index].name,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
              subtitle: Text(
                basicsOfReading[index].subTitle!,
                style: TextStyle(
                  fontStyle: FontStyle.italic,
                  color: Colors.grey[600],
                ),
              ),
              onTap: () {
                // Add any action you want when the ListTile is tapped
              },
            ),
          );
        },
      ),
    );
  }
}

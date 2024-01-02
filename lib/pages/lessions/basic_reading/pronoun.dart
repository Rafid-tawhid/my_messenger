import 'package:flutter/material.dart';

class PronounsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pronouns'),
      ),
      body: const SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            PronounsSection(
              title: 'Introduction',
              content:
              'Pronouns replace nouns. Without them, language would be repetitious, lengthy, and awkward.',
            ),
            PronounsSection(
              title: 'Personal Pronouns',
              content:
              'Personal pronouns refer to specific persons, places, or things. They have characteristics like number, person, and case. Number can be singular or plural, person can be first, second, or third, and case can be subjective or objective.',
            ),
            PronounsSection(
              title: 'Indefinite Pronouns',
              content:
              'Indefinite pronouns refer to general persons, places, or things. They are always third-person pronouns and can be subjects or objects in sentences. Some are singular, some are plural, and some can be either depending on the context.',
            ),
            PronounsSection(
              title: 'Possessive Pronouns',
              content:
              'Possessive pronouns replace possessive nouns. They never take apostrophes and can stand alone. They can be used as subjects or objects.',
            ),
            PronounsSection(
              title: 'Reflexive Pronouns',
              content:
              'Reflexive pronouns add emphasis and always follow a noun or personal pronoun. They show that someone did something to themselves.',
            ),
            PronounsSection(
              title: 'Relative Pronouns',
              content:
              'Relative pronouns begin a clause that refers to a noun in a sentence. They can refer to people or things and include words like that, who, whom, whose, which, and what.',
            ),
            PronounsSection(
              title: 'Demonstrative Pronouns',
              content:
              'Demonstrative pronouns indicate specific persons, places, or things. They include words like this, these, that, and those.',
            ),
          ],
        ),
      ),
    );
  }
}

class PronounsSection extends StatelessWidget {
  final String title;
  final String content;

  const PronounsSection({required this.title, required this.content});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 12.0),
          Text(
            content,
            style: TextStyle(fontSize: 16.0),
          ),
        ],
      ),
    );
  }
}
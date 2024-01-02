import 'package:flutter/material.dart';

class NounsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Nouns'),
      ),
      body: const SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            NounsSection(
              title: 'Introduction',
              content:
              'The first real word you ever used probably was a noun—a word like mama, daddy, car, or cookie. Most children begin building their vocabularies with nouns.',
            ),
            NounsSection(
              title: 'Characteristics of Nouns',
              content:
              'Nouns have these characteristics:\n\n'
                  '- They are abstract or concrete.\n'
                  '- They are proper or common.\n'
                  '- Most are singular or plural, but...\n'
                  '- Some are collective.',
            ),
            NounsSection(
              title: 'Noun Markers',
              content:
              'In English, nouns are often preceded by noun markers—the articles/adjectives a, an, the, or some for example; or possessive words like my or your.',
            ),
            NounsSection(
              title: 'Abstract and Concrete Nouns',
              content:
              'Every noun is either abstract or concrete.\n\n'
                  'Nouns like enthusiasm, willingness, and angst are abstract nouns. Abstract nouns name things we cannot see, touch, or detect readily through our senses.',
            ),
            NounsSection(
              title: 'Proper and Common Nouns',
              content:
              'Every noun is either proper or common.\n\n'
                  'A proper noun identifies a particular person, animal, place, thing, or idea. The first letter of each word of a proper noun is capitalized.',
            ),
            NounsSection(
              title: 'Singular, Plural, and Collective Nouns',
              content:
              'Most nouns are either singular or plural...\n\n'
                  'Most nouns are made plural with the addition of s or es. Some nouns have irregular plural forms. Some nouns have the same form in both singular and plural.\n\n'
                  '...but some nouns are collective.\n\n'
                  'A collective noun names a collection or group of things. Although a collective noun refers to a group of many things, it is usually singular in form.',
            ),
          ],
        ),
      ),
    );
  }
}

class NounsSection extends StatelessWidget {
  final String title;
  final String content;

  const NounsSection({required this.title, required this.content});

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
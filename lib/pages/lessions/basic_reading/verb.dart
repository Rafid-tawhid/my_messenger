import 'package:flutter/material.dart';

class VerbsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Verbs'),
      ),
      body: const SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            VerbsSection(
              title: 'Action Verbs',
              content:
              'Action verbs express physical or mental actions, such as think, eat, collide, realize, and dance.',
            ),
            VerbsSection(
              title: 'Linking Verbs',
              content:
              'Linking verbs express a state of being and connect the subject with more information about that subject. Examples include the forms of "to be" and sense verbs like appear, seem, look, feel, smell, taste, and sound.',
            ),
            VerbsSection(
              title: 'Helping Verbs',
              content:
              'Helping verbs often appear with main verbs to fine-tune their meaning, expressing when something occurred or other characteristics. Examples include have, has, had, to be (am, is, are, was, were, been), do, does, did, will, shall, would, could, should, can, may, might, must, supposed to, ought to, used to, and have to.',
            ),
          ],
        ),
      ),
    );
  }
}

class VerbsSection extends StatelessWidget {
  final String title;
  final String content;

  const VerbsSection({required this.title, required this.content});

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
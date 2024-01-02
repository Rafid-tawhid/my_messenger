import 'package:flutter/material.dart';
import 'package:my_messenger/pages/lessions/basic_reading/pronoun.dart';
import 'package:my_messenger/pages/lessions/basic_reading/verb.dart';

import 'noun.dart';

class PartsOfSpeech extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Parts of Speech'),
      ),
      body: const PartsOfSpeechScreen(),
    );
  }
}

class PartsOfSpeechScreen extends StatelessWidget {
  const PartsOfSpeechScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.all(16.0),
      children: const [
        PartsOfSpeechCard(
          title: 'NOUN',
          description:
          'A noun is the name of a person, place, thing, or idea.',
          exampleWords: ['man', 'Butte College', 'house', 'happiness'],
        ),
        PartsOfSpeechCard(
          title: 'PRONOUN',
          description: 'A pronoun is a word used in place of a noun.',
          exampleWords: ['She', 'we', 'they', 'it'],
        ),
        PartsOfSpeechCard(
          title: 'VERB',
          description: 'A verb expresses action or being.',
          exampleWords: ['jump', 'is', 'write', 'become'],
        ),
        PartsOfSpeechCard(
          title: 'ADJECTIVE',
          description: 'An adjective modifies or describes a noun or pronoun.',
          exampleWords: ['pretty', 'old', 'blue', 'smart'],
        ),
        PartsOfSpeechCard(
          title: 'ADVERB',
          description:
          'An adverb modifies or describes a verb, an adjective, or another adverb.',
          exampleWords: ['gently', 'extremely', 'carefully', 'well'],
        ),
        PartsOfSpeechCard(
          title: 'PREPOSITION',
          description:
          'A preposition is a word placed before a noun or pronoun to form a phrase modifying another word in the sentence.',
          exampleWords: ['by', 'with', 'about', 'until'],
        ),
        PartsOfSpeechCard(
          title: 'CONJUNCTION',
          description: 'A conjunction joins words, phrases, or clauses.',
          exampleWords: ['and', 'but', 'or', 'while', 'because'],
        ),
        PartsOfSpeechCard(
          title: 'INTERJECTION',
          description: 'An interjection is a word used to express emotion.',
          exampleWords: ['Oh!', 'Wow!', 'Oops!'],
        ),
      ],
    );
  }
}

class PartsOfSpeechCard extends StatelessWidget {
  final String title;
  final String description;
  final List<String> exampleWords;

  const PartsOfSpeechCard({
    required this.title,
    required this.description,
    required this.exampleWords,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        if(title=='NOUN'){
          Navigator.push(context, MaterialPageRoute(builder: (context)=>NounsScreen()));
        }
        if(title=='PRONOUN'){
          Navigator.push(context, MaterialPageRoute(builder: (context)=>PronounsScreen()));
        }
        if(title=='VERB'){
          Navigator.push(context, MaterialPageRoute(builder: (context)=>VerbsScreen()));
        }
      },
      child: Card(
        elevation: 4.0,
        margin: EdgeInsets.only(bottom: 16.0),
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8.0),
              Text(description),
              const SizedBox(height: 8.0),
              Text('Example Words: ${exampleWords.join(', ')}'),
            ],
          ),
        ),
      ),
    );
  }
}
import 'dart:ui';

import 'package:flutter/material.dart';

import '../models/quiz_models.dart';


const OPENAI_API_KEY = "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";


final List<Topic> topics = [
  Topic(name: 'Interactive Lessons', imagePath: 'images/lessons.png'),
  Topic(name: 'Common Discussion', imagePath: 'images/speech.png'),
  Topic(name: 'Flashcards and Vocabulary Builders', imagePath: 'images/word.png'),
  Topic(name: 'Language Conversion', imagePath: 'images/conversion.png'),
  Topic(name: 'Grammar Guides', imagePath: 'images/grammar.png'),
  Topic(name: 'Multi-level Courses', imagePath: 'images/courses.png'),
  Topic(name: 'Progress Tracking', imagePath: 'images/progress.png'),
  Topic(name: 'Interactive Quizzes', imagePath: 'images/quizzes.png'),
  Topic(name: 'Social Features', imagePath: 'images/social.png'),
  Topic(name: 'Feedback and Support', imagePath: 'images/feedback.png'),
  Topic(name: 'Certificates and Recognition', imagePath: 'images/certificate.png'),
];

var topicsName=topics.forEach((element) =>element.name);

List<Map<String, dynamic>> questionAnsList = [
  {
    'question': '1. Identify the sentence with correct grammar:',
    'answer': [
      'She don’t like coffee.',
      'He doesn’t like coffee.',
      'They doesn’t like coffee.',
      'I doesn’t like coffee.'
    ],
    'rightAns': 'He doesn’t like coffee.',
    'givenAns': '',
  },
  {
    'question': '2. Choose the correct spelling:',
    'answer': ['Occasion', 'Occassion', 'Occasssion', 'Ocassion'],
    'rightAns': 'Occasion',
    'givenAns': '',
  },
  {
    'question': '3. Which sentence is punctuated correctly?',
    'answer': [
      'The cat, is sleeping.',
      'The cat is sleeping.',
      'The cat is, sleeping.',
      'The cat is sleeping'
    ],
    'rightAns': 'The cat is sleeping.',
    'givenAns': '',
  },
  {
    'question': '4. Select the sentence with the correct verb usage:',
    'answer': [
      'She speak three languages.',
      'She speaks three languages.',
      'She speak three language.',
      'She speaking three languages.'
    ],
    'rightAns': 'She speaks three languages.',
    'givenAns': '',
  },
  {
    'question': '5. Identify the correctly spelled word:',
    'answer': ['Bizzare', 'Bizzarre', 'Bizarre', 'Bizzarr'],
    'rightAns': 'Bizarre',
    'givenAns': '',
  },
  {
    'question': '6. Choose the sentence with proper subject-verb agreement:',
    'answer': [
      'The team are winning.',
      'The team is winning.',
      'The team am winning.',
      'The team be winning.'
    ],
    'rightAns': 'The team is winning.',
    'givenAns': '',
  },
  {
    'question': '7. Which sentence is grammatically correct?',
    'answer': [
      'Neither of the students have completed the assignment.',
      'Neither of the students has completed the assignment.',
      'Neither of the students is completed the assignment.',
      'Neither of the students been completed the assignment.'
    ],
    'rightAns': 'Neither of the students has completed the assignment.',
    'givenAns': '',
  },
  {
    'question': '8. Identify the correct use of apostrophe:',
    'answer': [
      'The dogs bark is loud.',
      'The dog’s bark is loud.',
      'The dogs’ bark is loud.',
      'The dogs bark’s is loud.'
    ],
    'rightAns': 'The dog’s bark is loud.',
    'givenAns': '',
  },
  {
    'question': '9. Choose the sentence with the correct spelling:',
    'answer': ['Definately', 'Definitely', 'Definatly', 'Defenitely'],
    'rightAns': 'Definitely',
    'givenAns': '',
  },
  {
    'question': '10. Identify the sentence with proper use of commas:',
    'answer': [
      'She went to the store and bought apples oranges and bananas.',
      'She went to the store and bought apples, oranges, and bananas.',
      'She went to the store and bought apples, oranges and, bananas.',
      'She went to the store and bought apples oranges, and bananas.'
    ],
    'rightAns': 'She went to the store and bought apples, oranges, and bananas.',
    'givenAns': '',
  },
];

class myColors{
  static const purple=Colors.deepPurple;
}
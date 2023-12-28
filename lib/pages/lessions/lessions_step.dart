import 'package:flutter/material.dart';
import 'package:my_messenger/utils/temp_db.dart';
import 'package:my_messenger/widgets/button.dart';

import 'language_selection.dart';

class LessionsSteps extends StatelessWidget {
  const LessionsSteps({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: Text('Language Learning'),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildSection('1. Set Clear Goals', 'Define your reasons for learning the language.',
                details: [
                  'Specify short-term and long-term goals.',
                  'Identify specific scenarios where you want to use the language.',
                  'Set realistic milestones for measurable progress.',
                ]),
            _buildSection('2. Choose the Right Language', 'Consider your interests and practical needs.',
                details: [
                  'Research the cultural and economic relevance of the language.',
                  'Explore language families to find similarities with languages you may already know.',
                  'Consider the availability of resources for learning that language.',
                ]),
            _buildSection('3. Create a Learning Plan', 'Break down your language learning into achievable goals.',
                details: [
                  'Set a study schedule that fits your daily routine.',
                  'Break down larger goals into smaller, manageable tasks.',
                  'Include a variety of learning activities to keep it engaging.',
                ]),
            _buildSection('4. Start with Basic Vocabulary and Grammar', 'Learn essential phrases and common grammar rules.',
                details: [
                  'Focus on greetings, numbers, and everyday expressions.',
                  'Use flashcards or language apps to memorize vocabulary.',
                  'Understand basic sentence structures and common verb conjugations.',
                ]),
            _buildSection('5. Use Language Learning Resources', 'Leverage apps, online courses, podcasts, and more.',
                details: [
                  'Explore language learning apps like Duolingo, Memrise, or Babbel.',
                  'Enroll in online courses from platforms like Coursera or Udemy.',
                  'Listen to podcasts, watch videos, and follow language learning blogs.',
                ]),
            _buildSection('6. Practice Regularly', 'Consistency is key. Practice the language daily.',
                details: [
                  'Establish a daily practice routine, even if it\'s for a short duration.',
                  'Use language learning apps with daily challenges.',
                  'Consistent exposure enhances retention and fluency.',
                ]),
            _buildSection('7. Immerse Yourself', 'Surround yourself with the language through media and daily activities.',
                details: [
                  'Watch movies, TV shows, or YouTube videos in the target language.',
                  'Change your phone or computer settings to the language.',
                  'Read books, articles, or blogs written in the language.',
                ]),
            _buildSection('8. Join Language Communities', 'Connect with other language learners for support and practice.',
                details: [
                  'Join language exchange groups on platforms like Tandem or HelloTalk.',
                  'Participate in online forums or social media groups dedicated to language learners.',
                  'Engage in conversations with native speakers through language exchange.',
                ]),
            _buildSection('9. Take Language Classes', 'Consider enrolling in formal language classes.',
                details: [
                  'Enroll in online or in-person language courses.',
                  'Choose courses that emphasize speaking and practical application.',
                  'Receive guidance from experienced language instructors.',
                ]),
            _buildSection('10. Practice Speaking', 'Regularly engage in speaking activities with native speakers.',
                details: [
                  'Participate in language exchange sessions with native speakers.',
                  'Practice pronunciation by repeating sentences from audio resources.',
                  'Record yourself speaking and listen for areas of improvement.',
                ]),
            _buildSection('11. Be Patient and Persistent', 'Celebrate small victories and persist through challenges.',
                details: [
                  'Acknowledge and celebrate every milestone, no matter how small.',
                  'Understand that language learning is a gradual process.',
                  'Maintain a positive mindset and persevere through difficulties.',
                ]),
            _buildSection('12. Review and Reinforce', 'Regularly review and reinforce what you\'ve learned.',
                details: [
                  'Use spaced repetition techniques for vocabulary review.',
                  'Create flashcards to reinforce grammar rules and expressions.',
                  'Periodically revisit previous lessons to solidify your understanding.',
                ]),

            const SizedBox(height: 40,),
            Align(alignment: Alignment.centerRight, child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                ReusableButton(text: 'Next', onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>LanguageSelection()));
                }),

              ],
            )),
            const SizedBox(height: 40,),
          ],
        ),
      ),
    );
  }

  Widget _buildSection(String title, String content, {List<String>? details}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: Text(
            title,
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
        ),
        Text(content),
        if (details != null)
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: details.map((detail) => _buildDetail(detail)).toList(),
          ),
        Divider(),
      ],
    );
  }

  Widget _buildDetail(String detail) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        children: [
          Icon(
            Icons.arrow_forward,
            size: 16.0,
            color: Colors.grey,
          ),
          SizedBox(width: 4.0),
          Expanded(child: Text(detail)),
        ],
      ),
    );
  }

}

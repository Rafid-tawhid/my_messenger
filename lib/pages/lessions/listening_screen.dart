import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class ListeningScreen extends StatelessWidget {
  final List<String> videoLinks = [
    'https://www.youtube.com/user/bbclearningenglish',
    'https://www.youtube.com/user/ENGLISHCLASS101',
    'https://www.youtube.com/user/duncaninchina',
    'https://www.youtube.com/user/engvid',
    'https://www.youtube.com/user/rachelsenglish',
    'https://www.youtube.com/channel/UCz4tgANd4yy8Oe0iXCdSWfA',
    'https://www.youtube.com/user/GoNaturalEnglish',
    'https://www.youtube.com/user/learnexmumbai',
    'https://www.youtube.com/user/EnglishClass101',
    'https://www.youtube.com/user/EnglishJade',
    'https://www.youtube.com/user/JamesESL',
    'https://www.youtube.com/c/twominenglish',
    'https://www.youtube.com/user/EnglishLessons4U',
    'https://www.youtube.com/c/InteractiveEnglish',
    'https://www.youtube.com/user/CrownAcademyEnglish',
    'https://www.youtube.com/user/englishanyone',
    'https://www.youtube.com/c/LearnEnglishLab',
    'https://www.youtube.com/user/oxfordonlineenglish',
    'https://www.youtube.com/c/EnglishProfessionally',
    'https://www.youtube.com/user/englishwithalexander',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('English Learning Videos'),
      ),
      body: ListView.builder(
        itemCount: videoLinks.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(4.0),
            child: Card(
              child: ListTile(
                title: Text('Video ${index + 1}'),
                leading: Icon(Icons.perm_media,color: Colors.grey,size: 40,),
                subtitle: Text(videoLinks[index]),
                onTap: () => _launchURL(videoLinks[index]),
              ),
            ),
          );
        },
      ),
    );
  }

  Future<void> _launchURL(String _url) async {
    if (!await launchUrl(Uri.parse(_url))) {
      throw Exception('Could not launch $_url');
    }
  }
}
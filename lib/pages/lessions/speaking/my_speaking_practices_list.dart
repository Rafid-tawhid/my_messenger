import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:my_messenger/providers/speech_provider.dart';
import 'package:provider/provider.dart';

class MySpeakingPractices extends StatefulWidget {


  @override
  State<MySpeakingPractices> createState() => _MySpeakingPracticesState();
}

class _MySpeakingPracticesState extends State<MySpeakingPractices> {
  final FlutterTts _flutterTts = FlutterTts();
  Map? _currentVoice;
 late List<bool> isPlayingList;
  late SpeechProvider provider;

  @override
  void initState() {
    super.initState();

    initTTS();
    provider=Provider.of(context,listen: false);
    provider.getSpeechPractices();
    isPlayingList = List.filled(provider.speakingPracList.length, false);
  }

  void initTTS() {
    _flutterTts.getVoices.then((data) {
      try {
        List<Map> _voices = List<Map>.from(data);
        _voices = _voices.where((_voice) => _voice["name"].contains("en")).toList();
        setState(() {
          _currentVoice = _voices.first;
          setVoice(_currentVoice!);
        });
      } catch (e) {
        print(e);
      }
    });
  }

  void setVoice(Map voice) {
    _flutterTts.setVoice({"name": voice["name"], "locale": voice["locale"]});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Practices'),
      ),
      body: Consumer<SpeechProvider>(
        builder: (context,pro,_)=>ListView.builder(
          itemCount: pro.speakingPracList.length,
          itemBuilder: (context, index) => ListTile(
            title: Text(
              pro.speakingPracList[index]['text'],
              maxLines: 1,
            ),
            leading: Text((index + 1).toString()),
            trailing: IconButton(
              onPressed: () {
                setState(() {
                  isPlayingList[index] = !isPlayingList[index];
                });
                if (isPlayingList[index]) {
                  _flutterTts.speak(pro.speakingPracList[index]['text']);

                } else {
                  _flutterTts.stop();
                }
              },
              icon: isPlayingList[index]
                  ? const Icon(Icons.pause)
                  : const Icon(Icons.play_arrow),
            // ),
          ),
        ),
      )
    ));
  }
}


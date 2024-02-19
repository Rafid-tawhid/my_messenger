import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';

class MySpeakingPractices extends StatefulWidget {
  MySpeakingPractices(this.speechList, {Key? key}) : super(key: key);
  final List<String> speechList;

  @override
  State<MySpeakingPractices> createState() => _MySpeakingPracticesState();
}

class _MySpeakingPracticesState extends State<MySpeakingPractices> {
  final FlutterTts _flutterTts = FlutterTts();
  Map? _currentVoice;
  late List<bool> isPlayingList;

  @override
  void initState() {
    super.initState();
    initTTS();
    isPlayingList = List.filled(widget.speechList.length, false);
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
      body: ListView.builder(
        itemCount: widget.speechList.length,
        itemBuilder: (context, index) => ListTile(
          title: Text(
            widget.speechList[index],
            maxLines: 1,
          ),
          leading: Text((index + 1).toString()),
          trailing: IconButton(
            onPressed: () {
              setState(() {
                isPlayingList[index] = !isPlayingList[index];
              });
              if (isPlayingList[index]) {
                _flutterTts.speak(widget.speechList[index]);

              } else {
                _flutterTts.stop();
              }
            },
            icon: isPlayingList[index]
                ? const Icon(Icons.pause)
                : const Icon(Icons.play_arrow),
          ),
        ),
      ),
    );
  }
}


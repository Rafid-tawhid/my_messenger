import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';

class MySpeakingPractices extends StatefulWidget {
  MySpeakingPractices(this.speechList, {super.key});
  List<String> speechList = [];

  @override
  State<MySpeakingPractices> createState() => _MySpeakingPracticesState();
}

class _MySpeakingPracticesState extends State<MySpeakingPractices> {
  final FlutterTts _flutterTts=FlutterTts();
  Map? _currentVoice;
  bool play=false;

  @override
  void initState() {
    initTTS();
    super.initState();
  }
  void initTTS() {
    _flutterTts.getVoices.then((data) {
      try{
        List<Map> _voices=List<Map>.from(data);
        _voices=_voices.where((_voice) => _voice["name"].contains("en")).toList();
        setState(() {
          _currentVoice=_voices.first;
          setVoice(_currentVoice!);
        });
      }
      catch(e){
        print(e);
      }
    });
  }
  void setVoice(Map voice){
    _flutterTts.setVoice({"name":voice["name"],"locale":voice["locale"]});
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
            trailing: IconButton(onPressed: (){
              setState(() {
                play=true;
              });

              _flutterTts.speak(widget.speechList.toString()).whenComplete((){
                setState(() {
                  play=false;
                });
              });
            }, icon: play?const Icon(Icons.pause):const Icon(Icons.play_arrow)),
          ),
        ));
  }
}

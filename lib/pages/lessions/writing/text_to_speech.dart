import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';

class SpeechSampleApp extends StatefulWidget {
  const SpeechSampleApp({super.key});

  @override
  State<SpeechSampleApp> createState() => _SpeechSampleAppState();
}

class _SpeechSampleAppState extends State<SpeechSampleApp> {


  FlutterTts _flutterTts=FlutterTts();
  Map? _currentVoice;
  @override
  void initState() {
    // TODO: implement initState
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
    return  Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          _flutterTts.speak("Hello friends. How are you ?");
        },
        child: Icon(Icons.speaker_phone),
      ),
    );
  }


}

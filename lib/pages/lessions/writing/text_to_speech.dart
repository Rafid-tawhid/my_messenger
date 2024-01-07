import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';

class SpeechSampleApp extends StatefulWidget {
  const SpeechSampleApp({super.key});

  @override
  State<SpeechSampleApp> createState() => _SpeechSampleAppState();
}

class _SpeechSampleAppState extends State<SpeechSampleApp> {


  FlutterTts _flutterTts=FlutterTts();
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
      }
      catch(e){
        print(e);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold();
  }


}

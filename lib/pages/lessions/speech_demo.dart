import 'package:flutter/material.dart';
import 'package:voice_to_text/voice_to_text.dart';

class SpeackingScreen extends StatefulWidget {
  const SpeackingScreen({Key? key}) : super(key: key);

  @override
  State<SpeackingScreen> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<SpeackingScreen> {
  final VoiceToText _speech = VoiceToText();
  String text = ""; //this is optional, I could get the text directly using speechResult
  @override
  void initState() {
    super.initState();
    _speech.initSpeech();
    _speech.addListener(() {
      setState(() {
        text = _speech.speechResult;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Speaking Practice'),
      ),
      body: Container(
        padding: const EdgeInsets.all(10),
        alignment: Alignment.center,
        child: Column(
          textBaseline: TextBaseline.alphabetic,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
           if(_speech.isNotListening) Image.asset('images/avater.gif',height: 120,width: 120,),
            Text(
                _speech.isListening
                    ? "Listening...."
                    : 'Tap the microphone to start',
                style:
                const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            Text(_speech.isNotListening
                ? text.isNotEmpty
                ? text
                : "Try speaking again"
                : "",style: TextStyle(fontSize: 16,fontStyle: FontStyle.italic),),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed:
        // If not yet listening for speech start, otherwise stop
        _speech.isNotListening ? _speech.startListening : _speech.stop,
        tooltip: 'Listen',
        child: Icon(_speech.isNotListening ? Icons.mic_off : Icons.mic),
      ),
    );
  }
}

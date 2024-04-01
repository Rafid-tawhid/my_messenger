import 'dart:io';

import 'package:audioplayers/audioplayers.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:voice_to_text/voice_to_text.dart';
import 'package:record/record.dart';
import 'my_speaking_practices_list.dart';


class SpeakingScreen extends StatefulWidget {
  const SpeakingScreen({Key? key}) : super(key: key);

  @override
  State<SpeakingScreen> createState() => _SpeakingScreenState();
}

class _SpeakingScreenState extends State<SpeakingScreen> {
  final VoiceToText _speech = VoiceToText();
  List<String> speechList=[];
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
        actions: [
          IconButton(onPressed: (){
            print('object');
           Navigator.push(context, MaterialPageRoute(builder: (context)=>MySpeakingPractices(speechList)));
          }, icon: const Icon(Icons.list))],
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
                : "",style: const TextStyle(fontSize: 16,fontStyle: FontStyle.italic),textAlign: TextAlign.justify,),
            if(text.isNotEmpty)ElevatedButton(onPressed: (){
              speechList.add(text);
              setState(() {
                text='';
              });


            }, child: Text('Save')),
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





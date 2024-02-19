import 'dart:io';

import 'package:audioplayers/audioplayers.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:voice_to_text/voice_to_text.dart';
import 'package:record/record.dart';
import 'my_speaking_practices_list.dart';

class SpeackingScreen extends StatefulWidget {
  const SpeackingScreen({Key? key}) : super(key: key);

  @override
  State<SpeackingScreen> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<SpeackingScreen> {
  final VoiceToText _speech = VoiceToText();
  List<String> speechList=[];
  String text = "";
  //this is optional, I could get the text directly using speechResult
  late AudioPlayer _audioPlayer;
  late String _filePath;
  final audioRecord=AudioRecorder();
  @override
  void initState() {
    super.initState();
    _audioPlayer = AudioPlayer();

    _speech.initSpeech();
    _speech.addListener(() {
      setState(() {
        text = _speech.speechResult;
      });
    });

  }
  Future<void> startRecording() async {
   // Directory appDir = await getApplicationDocumentsDirectory();
    audioRecord.start(RecordConfig(), path: '${DateTime.now()}/speach');

  }

  Future<void> stopRecording() async {
    final path = await audioRecord.stop();
    _filePath =  path!+ '/recording.mp3';
  }

  @override
  void dispose() {
    _audioPlayer.dispose();
    super.dispose();
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
        onPressed:(){
          if(_speech.isNotListening){
            _speech.startListening;
            startRecording();
          }else {
            _speech.stop();
            stopRecording().then((value) {
              print('FILE PATH $_filePath');
            });

          }
        },
        // If not yet listening for speech start, otherwise stop: _speech.stop,
        tooltip: 'Listen',
        child: Icon(_speech.isNotListening ? Icons.mic_off : Icons.mic),
      ),
    );
  }


  Future<String?> uploadFile(File file) async {
    try {
      String fileName = basename(file.path);
      Reference firebaseStorageRef =
      FirebaseStorage.instance.ref().child('audios/$fileName');
      UploadTask uploadTask = firebaseStorageRef.putFile(file);
      TaskSnapshot taskSnapshot = await uploadTask.whenComplete(() => null);
      String downloadUrl = await taskSnapshot.ref.getDownloadURL();
      return downloadUrl;
    } catch (e) {
      print(e.toString());
      return null;
    }
  }


// Assuming you have a function to retrieve the MP3 file.
//   Future<File> getMP3File() async {
//     final url = 'https://www.example.com/example.mp3';
//     final response = await http.get(url);
//     final directory = await getApplicationDocumentsDirectory();
//     final file = File('${directory.path}/example.mp3');
//     await file.writeAsBytes(response.bodyBytes);
//     return file;
//   }
//
// // Example usage
//   void uploadMP3File() async {
//     File mp3File = await getMP3File();
//     String downloadUrl = await uploadFile(mp3File);
//     print("Download URL: $downloadUrl");
//   }

}
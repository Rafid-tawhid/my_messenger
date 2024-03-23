import 'package:flutter/material.dart';
// ignore_for_file: depend_on_referenced_packages, library_private_types_in_public_api, use_build_context_synchronously, avoid_print

import 'dart:async';
import 'dart:io' as io;

import 'package:audioplayers/audioplayers.dart';
import 'package:file/file.dart';
import 'package:file/local.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_voice_recorder/flutter_voice_recorder.dart';
import 'package:path_provider/path_provider.dart';
import 'package:record/record.dart';

class RecorderExample extends StatefulWidget {
  final LocalFileSystem localFileSystem;

  const RecorderExample({super.key, localFileSystem})
      : localFileSystem = localFileSystem ?? const LocalFileSystem();

  @override
  State<StatefulWidget> createState() => RecorderExampleState();
}

class RecorderExampleState extends State<RecorderExample> {
     late AudioRecorder audioRecord;
     late AudioPlayer audioPlayer;
     bool isRecording=false;
     String? recordedPath;

  @override
  void initState() {
    audioPlayer =AudioPlayer();
    audioRecord =AudioRecorder();
    super.initState();
  }
  @override
  void dispose() {
    // TODO: implement dispose
    audioPlayer.dispose();
    audioRecord.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Audio Record'),),
      body: Center(
        child: Column(
          children: [
            if(isRecording)Text('Recording is Progress'),
            ElevatedButton(onPressed: isRecording?_stopRecording:_startRecording, child: isRecording?Text('Stop Recording'):Text('Start Recording')),
            SizedBox(height: 20,),
            if(!isRecording&&recordedPath!=null) ElevatedButton(onPressed: _play, child: Text('Play'))
          ],
        ),
      ),
    );
  }



  Future<void> _startRecording() async{
    try{
      if(await audioRecord.hasPermission()){
        print('PERMISSION GRANTED');
        await audioRecord.start(const RecordConfig(), path: 'aFullPath/myFile.m4a');
        setState(() {
          isRecording=true;
        });
      }
    }
        catch(e){

        }
  }

  Future<void> _stopRecording() async{
    try{
      String? path=await audioRecord.stop();

      setState(() {
        isRecording=false;
        recordedPath=path!;

      });
    }
        catch(e){

        }
  }

  Future<void> _play() async {
    try{
      await audioPlayer.play(UrlSource(recordedPath!));
    }
    catch(e){
      
    }
  }
}
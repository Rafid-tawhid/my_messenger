import 'dart:io';

import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:path_provider/path_provider.dart';

class VoiceRecorder extends StatefulWidget {
  @override
  _VoiceRecorderState createState() => _VoiceRecorderState();
}

class _VoiceRecorderState extends State<VoiceRecorder> {
  late AudioPlayer _audioPlayer;
  late AudioRecorder _audioRecorder;
  String _filePath = '';

  @override
  void initState() {
    super.initState();
    _audioPlayer = AudioPlayer();
    _audioRecorder = AudioRecorder();
  }

  Future<void> _startRecording() async {
    try {
      Directory appDir = await getApplicationDocumentsDirectory();
      _filePath = '${appDir.path}/recording.mp3';
      await _audioRecorder.startRecord(_filePath);
    } catch (e) {
      print('Error recording: $e');
    }
  }

  Future<void> _stopRecording() async {
    try {
      await _audioRecorder.stopRecord();
    } catch (e) {
      print('Error stopping recording: $e');
    }
  }

  Future<void> _playRecording() async {
    try {
      await _audioPlayer.play(DeviceFileSource(_filePath));
    } catch (e) {
      print('Error playing recording: $e');
    }
  }

  @override
  void dispose() {
    _audioPlayer.dispose();
    _audioRecorder.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Voice Recorder'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              onPressed: _startRecording,
              child: Text('Start Recording'),
            ),
            ElevatedButton(
              onPressed: _stopRecording,
              child: Text('Stop Recording'),
            ),
            ElevatedButton(
              onPressed: _playRecording,
              child: Text('Play Recording'),
            ),
          ],
        ),
      ),
    );
  }
}

class AudioRecorder {
  late String _filePath;
  late Process _process;

  Future<void> startRecord(String filePath) async {
    _filePath = filePath;
    _process = await Process.start(
      'ffmpeg',
      [
        '-f',
        'alsa',
        '-ac',
        '1',
        '-i',
        'default',
        _filePath,
      ],
    );
  }

  Future<void> stopRecord() async {
    _process.kill(ProcessSignal.sigterm);
    await _process.exitCode;
  }

  void dispose() {}
}

void main() {
  runApp(MaterialApp(
    home: VoiceRecorder(),
  ));
}

import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';

class VoiceRecorderScreen extends StatefulWidget {
  @override
  _VoiceRecorderScreenState createState() => _VoiceRecorderScreenState();
}

class _VoiceRecorderScreenState extends State<VoiceRecorderScreen> {
  final AudioRecorder _audioRecorder = AudioRecorder();

  bool _isRecording = false;

  @override
  void dispose() {
    _audioRecorder.dispose();
    super.dispose();
  }

  Future<void> _startRecording() async {
    try {
      await _audioRecorder.startRecording();
      setState(() {
        _isRecording = true;
      });
    } catch (e) {
      print('Error starting recording: $e');
    }
  }

  Future<void> _stopRecording() async {
    try {
      await _audioRecorder.stopRecording();
      setState(() {
        _isRecording = false;
      });
    } catch (e) {
      print('Error stopping recording: $e');
    }
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
          children: [
            IconButton(
              icon: Icon(_isRecording ? Icons.stop : Icons.mic),
              onPressed: () {
                if (_isRecording) {
                  _stopRecording();
                } else {
                  _startRecording();
                }
              },
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () async {
                if (!_isRecording) {
                  await _audioRecorder.playRecordedFile();
                }
              },
              child: Text('Play Recorded Audio'),
            ),
          ],
        ),
      ),
    );
  }
}

class AudioRecorder {
  final AudioPlayer _audioPlayer = AudioPlayer();

  Future<void> startRecording() async {
    // Add your code to start recording audio
    print('Recording started');
  }

  Future<void> stopRecording() async {
    // Add your code to stop recording audio
    print('Recording stopped');
  }

  Future<void> playRecordedFile() async {
    // Add your code to play the recorded audio file
    print('Playing recorded audio');
  }

  void dispose() {
    _audioPlayer.dispose();
  }
}



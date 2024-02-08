import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

class ListeningScreen extends StatefulWidget {
  @override
  _ListeningScreenState createState() => _ListeningScreenState();
}

class _ListeningScreenState extends State<ListeningScreen> {
  AudioPlayer? _currentPlayer;
  String? _currentUrl;

  List<String> audioUrls = [
    "https://www.soundhelix.com/examples/mp3/SoundHelix-Song-1.mp3",
    "https://www.soundhelix.com/examples/mp3/SoundHelix-Song-2.mp3",
    "https://www.soundhelix.com/examples/mp3/SoundHelix-Song-3.mp3",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Listening Screen'),
      ),
      body: ListView.builder(
        itemCount: audioUrls.length,
        itemBuilder: (context, index) {
          final url = audioUrls[index];
          return ListTile(
            title: Text('Track ${index + 1}'),
            trailing: IconButton(
              icon: Icon(_currentUrl == url && _currentPlayer?.state == PlayerState.playing
                  ? Icons.pause
                  : Icons.play_arrow),
              onPressed: () async {
                EasyLoading.show();
                await _playPauseTrack(url);
                EasyLoading.dismiss();
              },
            ),
          );
        },
      ),
    );
  }

  Future<void> _playPauseTrack(String url) async {
    if (_currentUrl == url && _currentPlayer?.state == PlayerState.playing) {
      await _currentPlayer!.pause();
    } else {
      // Stop the current player if it's playing
      if (_currentPlayer != null && _currentPlayer!.state == PlayerState.playing) {
        await _currentPlayer!.stop();
      }

      // Create a new player for the selected track
      final player = AudioPlayer();
      await player.play(UrlSource(url));

      setState(() {
        _currentPlayer = player;
        _currentUrl = url;
      });
    }
  }

  @override
  void dispose() {
    _currentPlayer?.dispose();
    super.dispose();
  }
}

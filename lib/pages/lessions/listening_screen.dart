import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

class ListeningScreen extends StatefulWidget {
  @override
  _ListeningScreenState createState() => _ListeningScreenState();
}

class _ListeningScreenState extends State<ListeningScreen> {
  List<AudioPlayer> audioPlayers = [
    AudioPlayer(),
    AudioPlayer(),
    AudioPlayer(),
  ];
  List<String> audioUrls = [
    "https://www.soundhelix.com/examples/mp3/SoundHelix-Song-1.mp3",
    "https://www.soundhelix.com/examples/mp3/SoundHelix-Song-2.mp3",
    "https://www.soundhelix.com/examples/mp3/SoundHelix-Song-3.mp3",
  ];

  @override
  void dispose() {
    for (var player in audioPlayers) {
      player.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Listening Screen'),
      ),
      body: ListView.builder(
        itemCount: audioPlayers.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text('Track ${index + 1}'),
            trailing: IconButton(
              icon: Icon(
                audioPlayers[index].state == PlayerState.playing
                    ? Icons.pause
                    : Icons.play_arrow,
              ),
              onPressed: () {
                playPauseTrack(index);
              },
            ),
          );
        },
      ),
    );
  }

  Future<void> playPauseTrack(int index) async {
    if (audioPlayers[index].state == PlayerState.playing) {
      await audioPlayers[index].pause();
    } else {
      await audioPlayers[index].play(UrlSource(audioUrls[index]));
    }
    setState(() {}); // Refresh UI
  }
}

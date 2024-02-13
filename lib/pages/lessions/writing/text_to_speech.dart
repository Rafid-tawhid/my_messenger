import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';

class SpeechSampleApp extends StatefulWidget {
  const SpeechSampleApp({super.key});

  @override
  State<SpeechSampleApp> createState() => _SpeechSampleAppState();
}

class _SpeechSampleAppState extends State<SpeechSampleApp> {


  final FlutterTts _flutterTts=FlutterTts();
  Map? _currentVoice;
  bool play=false;
  final _textCon=TextEditingController();

  @override
  void dispose() {
    _textCon.dispose();
    super.dispose();
  }
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
      appBar: AppBar(
        title: const Text('Writing Practice'),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: play?Colors.red:Colors.green,
        onPressed: (){
          setState(() {
            play=true;
          });

          _flutterTts.speak(_textCon.text==""?"Welcome to Fun Language":_textCon.text).whenComplete((){
            setState(() {
              play=false;
            });
          });
        },
        child: const Icon(Icons.speaker_phone,color: Colors.white,),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
             Align(alignment: Alignment.center, child: Image.asset('images/avater2.gif',height: 150,width: 150,)),
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: Text('Write something then press the button'),
              ),
              TextField(
                maxLines: 10,
                controller: _textCon,
                decoration: InputDecoration(
                  helperText: 'Write something...',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: const BorderSide(
                      color: Colors.grey,
                      width: 1
                    )
                  )
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }


}

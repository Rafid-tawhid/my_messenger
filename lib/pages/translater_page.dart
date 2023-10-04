
// Make sure your Internet is Connected
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:translator/translator.dart';

class TranslatorApp extends StatefulWidget {
  static const String routeName='/translator';

  const TranslatorApp({super.key});

  @override
  State<TranslatorApp> createState() => _TranslatorAppState();
}

class _TranslatorAppState extends State<TranslatorApp> {
  List<String> languages = [
    'English',
    'Hindi',
    'Arabic	',
    'German',
    'Russian',
    'Spanish',
    'Urdu',
    'Japanese	',
    'Italian'
  ];
  List<String> languagescode = [
    'en',
    'hi',
    'ar',
    'de',
    'ru',
    'es',
    'ur',
    'ja',
    'it'
  ];
  final translator = GoogleTranslator();
  String from = 'en';
  String to = 'hi';
  String data = 'आप कैसे हैं?';
  String selectedvalue = 'English';
  String selectedvalue2 = 'Hindi';
  TextEditingController controller =
  TextEditingController(text: 'How are you?');
  final formkey = GlobalKey<FormState>();
  bool isloading = false;
  translate() async {
    try {
      if (formkey.currentState!.validate()) {
        await translator
            .translate(controller.text, from: from, to: to)
            .then((value) {
          data = value.text;
          isloading = false;
          setState(() {});
          // print(value);
        });
      }
    } on SocketException catch (_) {
      isloading = true;
      SnackBar mysnackbar = const SnackBar(
        content: Text('Internet not Connected'),
        backgroundColor: Colors.red,
        duration: Duration(seconds: 5),
      );
      ScaffoldMessenger.of(context).showSnackBar(mysnackbar);
      setState(() {});
    }
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    controller.dispose();
  }
  // @override
  // void initState() {
  //   super.initState();
  //   translate();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        flexibleSpace: Container(
            decoration: const BoxDecoration(
              color: Color.fromARGB(255, 50, 46, 165),
            )),
        title: const Text(
          'Translator App',
          style: TextStyle(
              color: Colors.white, fontWeight: FontWeight.bold, fontSize: 28),
        ),
      ),
      backgroundColor: const Color.fromARGB(255, 87, 104, 254),
      body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(
                height: 30,
              ),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 40),
                decoration: BoxDecoration(
                    color: Colors.indigo.shade100,
                    borderRadius: BorderRadius.circular(10)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text('From'),
                    const SizedBox(
                      width: 100,
                    ),
                    DropdownButton(
                      value: selectedvalue,
                      focusColor: Colors.transparent,
                      items: languages.map((lang) {
                        return DropdownMenuItem(
                          value: lang,
                          child: Text(lang),
                          onTap: () {
                            if (lang == languages[0]) {
                              from = languagescode[0];
                            } else if (lang == languages[1]) {
                              from = languagescode[1];
                            } else if (lang == languages[2]) {
                              from = languagescode[2];
                            } else if (lang == languages[3]) {
                              from = languagescode[3];
                            } else if (lang == languages[4]) {
                              from = languagescode[4];
                            } else if (lang == languages[5]) {
                              from = languagescode[5];
                            } else if (lang == languages[6]) {
                              from = languagescode[6];
                            } else if (lang == languages[7]) {
                              from = languagescode[7];
                            } else if (lang == languages[8]) {
                              from = languagescode[8];
                            }
                            setState(() {
                              // print(lang);
                              // print(from);
                            });
                          },
                        );
                      }).toList(),
                      onChanged: (value) {
                        selectedvalue = value!;
                      },
                    )
                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.all(20),
                margin: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                    color: Colors.blueGrey.withOpacity(0.3),
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: Colors.black)),
                child: Form(
                  key: formkey,
                  child: TextFormField(
                    controller: controller,
                    maxLines: null,
                    minLines: null,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter some text';
                      }
                      return null;
                    },
                    textInputAction: TextInputAction.done,
                    decoration: const InputDecoration(
                        enabledBorder: InputBorder.none,
                        border: InputBorder.none,
                        errorBorder: InputBorder.none,
                        errorStyle: TextStyle(color: Colors.white)),
                    style: const TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 18),
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 40),
                decoration: BoxDecoration(
                    color: Colors.indigo.shade100,
                    borderRadius: BorderRadius.circular(10)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text('To'),
                    const SizedBox(
                      width: 100,
                    ),
                    DropdownButton(
                      value: selectedvalue2,
                      focusColor: Colors.transparent,
                      items: languages.map((lang) {
                        return DropdownMenuItem(
                          value: lang,
                          child: Text(lang),
                          onTap: () {
                            if (lang == languages[0]) {
                              to = languagescode[0];
                            } else if (lang == languages[1]) {
                              to = languagescode[1];
                            } else if (lang == languages[2]) {
                              to = languagescode[2];
                            } else if (lang == languages[3]) {
                              to = languagescode[3];
                            } else if (lang == languages[4]) {
                              to = languagescode[4];
                            } else if (lang == languages[5]) {
                              to = languagescode[5];
                            } else if (lang == languages[6]) {
                              to = languagescode[6];
                            } else if (lang == languages[7]) {
                              to = languagescode[7];
                            } else if (lang == languages[8]) {
                              to = languagescode[8];
                            }
                            setState(() {
                              print(lang);
                              print(from);
                            });
                          },
                        );
                      }).toList(),
                      onChanged: (value) {
                        selectedvalue2 = value!;
                      },
                    )
                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.all(20),
                margin: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                    color: Colors.blueGrey.withOpacity(0.3),
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: Colors.black)),
                child: Center(
                  child: SelectableText(
                    data,
                    style: const TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              ElevatedButton(
                  onPressed: translate,
                  style: ButtonStyle(
                      backgroundColor:
                      MaterialStatePropertyAll(Colors.indigo.shade900),
                      fixedSize: const MaterialStatePropertyAll(Size(300, 45))),
                  child:isloading?const SizedBox.square(
                    dimension: 20,
                    child: CircularProgressIndicator(color: Colors.white,),
                  ): const Text('Translate')),
              const SizedBox(
                height: 30,
              )
            ],
          )),
    );
  }
}
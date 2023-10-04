// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors_in_immutables, prefer_const_constructors, unused_field, prefer_final_fields, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

class QuestionSetWidget extends StatefulWidget {
  final int index;
  final Map<String, dynamic> q;
  final Function(String) onAnswer;

  QuestionSetWidget({
    required this.index,
    required this.q,
    required this.onAnswer,
  });

  @override
  State<QuestionSetWidget> createState() => _QuestionSetWidgetState();
}

class _QuestionSetWidgetState extends State<QuestionSetWidget> {
  var _groupValue = '';

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 5, right: 5, top: 5, bottom: 10),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        color: Color.fromARGB(255, 41, 41, 41),
        elevation: 5,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              ListTile(
                title: Text(widget.q['question'], style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),),
                subtitle: Column(
                  children: (widget.q['answer'] as List)
                      .map((e) => ListTile(
                            title: Text(e, style: TextStyle(fontWeight: FontWeight.w300, color: Colors.white),),
                            leading: Radio<String>(
                              fillColor: MaterialStateProperty.all(Colors.deepOrange),
                              value: e,
                              groupValue: _groupValue,
                              onChanged: (value) {
                                setState(() {
                                  _groupValue = value as String;
                                });
                                widget.onAnswer(_groupValue);
                              },
                            ),
                          ))
                      .toList(),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

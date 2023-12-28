// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors, non_constant_identifier_names, prefer_final_fields, unused_field, must_be_immutable, unused_element

import 'dart:async';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:my_messenger/pages/result_page.dart';

import '../models/question_answer.dart';
import '../utils/temp_db.dart';
import '../widgets/question_set_widget.dart';


class QustionPage extends StatefulWidget {
  static const routeName = '/question';

  @override
  State<QustionPage> createState() => _QustionPageState();
}

class _QustionPageState extends State<QustionPage> {
  bool _hasQuizStarted = false;
  String _timeString = '';
  int duration = 30;
  late Timer _timer;

  @override
  void didChangeDependencies() {
    _setTime();
    super.didChangeDependencies();
  }

  _startTimer() {
    _timer = Timer.periodic(Duration(seconds: 1), (_) {
      if (duration == 0) {
        _timer.cancel();
        Navigator.pushReplacementNamed(context, ResultPage.routeName);
      } else {
        setState(() {
          duration--;
          _setTime();
        });
      }
    });
  }

  _setTime() {
    _timeString = DateFormat('mm:ss')
        .format(DateTime.fromMillisecondsSinceEpoch(duration * 1000));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff222222),
      appBar: AppBar(
        backgroundColor: Color(0xff222222),
        title: Text(
          'Question',
          style: TextStyle(color: Colors.deepOrange),
        ),
        actions: [
          IconButton(
            onPressed: !_hasQuizStarted
                ? null
                : () {
                    Navigator.pushReplacementNamed(context, ResultPage.routeName);
                    _timer.cancel();
                  },
            icon: Icon(
              Icons.save,
              color: Colors.deepOrange,
            ),
          ),
        ],
      ),
      body: !_hasQuizStarted
          ? Center(
              child: InkWell(
                onTap: () {
                  setState(() {
                    _hasQuizStarted = true;
                    _startTimer();
                  });
                },
                child: Container(
                  height: 45,
                  width: 125,
                  decoration: BoxDecoration(
                      color: Colors.deepOrange,
                      borderRadius: BorderRadius.circular(25)),
                  child: Center(
                      child: Text(
                    'START QUIZ',
                    style: TextStyle(
                        fontWeight: FontWeight.bold, color: Colors.white),
                  )),
                ),
              ),
            )
          : Column(
              children: [
                SizedBox(
                  height: 10,
                ),
                Text(
                  _timeString,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.deepOrange,
                    fontSize: 40,
                  ),
                ),
                Expanded(
                  child: ListView.builder(
                    itemCount: questionAnsList.length,
                    itemBuilder: (context, index) {
                      final ques = questionAnsList[index];
                      return QuestionSetWidget(
                        index: index,
                        onAnswer: (value) {
                          ques['givenAns'] = value;
                        },
                        q: ques,
                      );
                    },
                  ),
                ),
              ],
            ),
    );
  }
}

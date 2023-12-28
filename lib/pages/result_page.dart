// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors, must_be_immutable, unused_field, unnecessary_brace_in_string_interps, prefer_const_literals_to_create_immutables, avoid_unnecessary_containers, sized_box_for_whitespace, sort_child_properties_last

import 'package:flutter/material.dart';
import '../models/question_answer.dart';
import '../utils/temp_db.dart';
import 'question_page.dart';

class ResultPage extends StatelessWidget {
  static const routeName = 'result-page';
  int _rightAnswer = 0;
  Size? size;

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    resultCalculate();
    return Scaffold(
      backgroundColor: Color(0xff222222),
        body: Container(
      height: size!.height,
      width: size!.width,
      child: Column(
        children: [
          Container(
            height: size!.height / 2 + 90,
            width: size!.width / 2,
            child: Stack(
              alignment: Alignment.center,
              children: [
                Positioned(
                  top: 65,
                  child: Text(
                    'Congratulation!',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25, color: Colors.white),
                  ),
                ),
                CircleAvatar(
                  radius: 60,
                  backgroundColor: Color(0xffBFEED1),
                  child: CircleAvatar(
                    radius: 45,
                    backgroundColor: Color(0xff01BA47),
                    child: Icon(
                      Icons.check_outlined,
                      color: Colors.white,
                      size: 50,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            height: size!.height / 2 - 90,
            width: size!.width / 2,
            child: Column(
              children: [
                Text(
                  'Your test is submited.',
                  style: TextStyle(fontWeight: FontWeight.w500, fontSize: 18,color: Colors.white,),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  'Your right answer is : ${_rightAnswer}',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20,color: Colors.white,),
                ),
                SizedBox(
                  height: 30,
                ),
                Container(
                  height: 40,
                  width: 110,
                  child: OutlinedButton(
                    child: Text(
                      'TRY AGAIN',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    style: OutlinedButton.styleFrom(
                        primary: Color(0xff01BA47),
                        shadowColor: Color(0xff01BA47),
                        side: BorderSide(color: Color(0xff01BA47))),
                    onPressed: () {
                      Navigator.of(context).pushReplacementNamed(QustionPage.routeName);
                      _rightAnswer = 0;
                    },
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    ));
  }

  resultCalculate() {
    for (var data in questionAnsList) {
      if (data['givenAns'] == data['rightAns']) {
        _rightAnswer++;
      }
    }
  }
}

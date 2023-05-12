import 'package:flutter/material.dart';
import './question.dart';
import './answers.dart';

class Quiz extends StatelessWidget {
  final List<Map<String, Object>> questionList;
  final int _questionIndex;
  final Function _answerQuestion;
  Quiz(this.questionList, this._questionIndex, this._answerQuestion);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Question(questionList[_questionIndex]["questions"].toString()),
        ...(questionList[_questionIndex]["options"]
                as List<Map<String, Object>>)
            .map((e) {
          return Answers(
              () => _answerQuestion(e["score"]), e['text'].toString());
        }),

        // Image Widget
        Container(
          height: 250,
          width: 250,
          margin: EdgeInsets.all(10),
          child: Image.asset("image/logo.png", fit: BoxFit.contain),
        ),
      ],
    );
  }
}

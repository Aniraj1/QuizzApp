import 'package:flutter/material.dart';
import './result.dart';
import './quiz.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  var _questionIndex = 0;
  var _score = 0;
  // var listOfQuestions = [
  //   {
  //     'questions': 'What is your favrouite Color?',
  //     'options': ['Red', 'Blue', 'Yellow', 'Green'],
  //   },
  //   {
  //     'questions': 'What is your favrouite food?',
  //     'options': ['Pasta', 'Carbonara', 'Momo', 'Chowmin'],
  //   },
  //   {
  //     'questions': 'What is your favrouite Animal?',
  //     'options': ['Cat', 'Dog', 'Pig', 'Tiger'],
  //   },
  // ];

  final listOfQuestions = [
    {
      'questions': 'What is your favrouite Color?',
      'options': [
        {"text": "Red", "score": 10},
        {"text": "Blue", "score": 20},
        {"text": "Yellow", "score": 30},
        {"text": "Green", "score": 40}
      ],
    },
    {
      'questions': 'What is your favrouite food?',
      'options': [
        {"text": "MoMo", "score": 10},
        {"text": "Noodles", "score": 20},
        {"text": "Fries", "score": 30},
        {"text": "Sandwich", "score": 40}
      ],
    },
    {
      'questions': 'What is your favrouite Animal?',
      'options': [
        {'text': 'Dog', 'score': 10},
        {'text': 'Cat', 'score': 20},
        {'text': 'Snake', 'score': 30},
        {'text': 'Tiger', 'score': 40},
      ],
    },
  ];

  void resetData() {
    setState(() {
      _questionIndex = 0;
      _score = 0;
    });
  }

  void _answerQuestion(int score) {
    _score = _score + score;
    setState(() {
      _questionIndex = _questionIndex + 1;
    });
    print(_questionIndex);
  }

  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      appBar: AppBar(
          title: Text(
        "My QuiZZ",
        style: TextStyle(fontFamily: 'Inspiration'),
      )),
      body: _questionIndex < listOfQuestions.length
          ? Quiz(listOfQuestions, _questionIndex, _answerQuestion)
          : Result(_score, resetData),
    ));
  }
}

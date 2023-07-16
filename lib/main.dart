import 'package:flutter/material.dart';
import 'quiz.dart';
import 'result.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  final _questions = const [
    {
      'questionText': 'What is you favorite color?',
      'answers': [
        {'text': 'black', 'score': 10},
        {'text': 'green ', 'score': 3},
        {'text': 'white ', 'score': 2},
        {'text': 'yellow', 'score': 5}
      ],
    },
    {
      'questionText': 'What is you favorite animal?',
      'answers': [
        {'text': 'dog', 'score': 5},
        {'text': 'rabbit ', 'score': 3},
        {'text': 'wolf ', 'score': 7},
        {'text': 'lion', 'score': 10}
      ],
    },
    {
      'questionText': 'What is your preferred programming language?',
      'answers': [
        {'text': 'python', 'score': 3},
        {'text': 'dart ', 'score': 5},
        {'text': 'java ', 'score': 7},
        {'text': 'c#', 'score': 10}
      ],
    },
  ];
  var _questionIndex = 0;
  var _totalScore = 0;

  void _resetQuiz() {
    setState(() {
      _questionIndex = 0;
      _totalScore = 0;
    });
  }

  void _answerQuestion(int score) {
    _totalScore = _totalScore + score;

    setState(() {
      _questionIndex = _questionIndex + 1;
    });

    print(_questionIndex);
    if (_questionIndex < _questions.length) {
      print('We have more questions!');
    } else {
      print('No more questions!');
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('My Simple App'),
        ),
        body: _questionIndex < _questions.length
            ? Quiz(
                answerQuestion: _answerQuestion,
                questionIndex: _questionIndex,
                questions: _questions,
              )
            : Result(_totalScore, _resetQuiz),
      ),
    );
  }
}

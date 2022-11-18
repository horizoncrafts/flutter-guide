import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/question.dart';
import 'package:flutter_complete_guide/answer.dart';

// void main() {
//   runApp(MyApp());
// }

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  static const questions = <Map<String, Object>>[
    {
      'questionText': 'What\'s your favorite color?',
      'answers': <String>['Black', 'Red', 'Green', 'White'],
    },
    {
      'questionText': 'What\'s your favorite animal?',
      'answers': <String>['Rabbit', 'Snake', 'Elephant', 'Lion']
    },
    {
      'questionText': 'What\'s your favorite thing?',
      'answers': <String>['m', 'n', 'c', 'd']
    },
  ];

  var _questionIndex = 0;

  void _answerQuestion() {
    if (_questionIndex < questions.length) {
      setState(() {
        _questionIndex = _questionIndex + 1;
      });
    } else {}

    print(_questionIndex);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      appBar: AppBar(
        title: Text('My First App'),
      ),
      body: _questionIndex < questions.length
          ? Column(
              children: [
                Question(questionText: questions[_questionIndex]['questionText'] as String),
                ...((questions[_questionIndex]['answers'] as List<String>)
                    .map((e) => Answer(e, this._answerQuestion))
                    .toList()),
              ],
            )
          : Center(
              child: Text('You did it'),
            ),
    ));
  }
}

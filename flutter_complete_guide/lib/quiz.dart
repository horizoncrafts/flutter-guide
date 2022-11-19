import 'package:flutter/material.dart';
import 'question.dart';
import './answer.dart';
// import 'package:flutter/src/foundation/key.dart';
// import 'package:flutter/src/widgets/container.dart';
// import 'package:flutter/src/widgets/framework.dart';

class Quiz extends StatelessWidget {
  final List<Map<String, Object>> questions;
  final int questionIndex;
  final Function answerQuestion;

  const Quiz({
    required this.answerQuestion,
    required this.questionIndex,
    required this.questions,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Column(
      children: [
        Question(questionText: questions[questionIndex]['questionText'] as String),
        ...((questions[questionIndex]['answers'] as List<Map<String, Object>>)
            .map((e) => Answer(e['text'] as String, () => this.answerQuestion(e['score'])))
            .toList()),
      ],
    ));
  }
}

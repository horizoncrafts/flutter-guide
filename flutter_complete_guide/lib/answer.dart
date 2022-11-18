import 'package:flutter/material.dart';
// import 'package:flutter/src/foundation/key.dart';
// import 'package:flutter/src/widgets/container.dart';
// import 'package:flutter/src/widgets/framework.dart';

class Answer extends StatelessWidget {
  final String answerText;
  final VoidCallback selectHandler;

  Answer(
    this.answerText,
    this.selectHandler,
  );

  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        margin: EdgeInsets.all(19),
        child: ElevatedButton(
          style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(Colors.blue),
              foregroundColor: MaterialStateProperty.all(Colors.yellowAccent)),
          child: Text(answerText),
          onPressed: selectHandler,
        ));
  }
}

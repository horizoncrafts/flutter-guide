import 'package:flutter/material.dart';
// import 'package:flutter/src/foundation/key.dart';
// import 'package:flutter/src/widgets/container.dart';
// import 'package:flutter/src/widgets/framework.dart';

class Question extends StatelessWidget {
  final String questionText;

  Question({this.questionText = ''});

  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        margin: EdgeInsets.all(19),
        child: Text(
          this.questionText,
          style: TextStyle(fontSize: 28),
          textAlign: TextAlign.center,
        ));
  }
}

import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  void answerQuestion() {
    print('answer chosen');
  }

  @override
  Widget build(BuildContext context) {
    var questions = [
      'What color?',
      'What\'s animal?',
    ];

    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            title: Text('first app'),
          ),
          body: Column(
            children: <Widget>[
              Text('The question'),
              ElevatedButton(onPressed: this.answerQuestion, child: Text('Answer1')),
              ElevatedButton(onPressed: answerQuestion, child: Text('Answer2')),
              ElevatedButton(onPressed: answerQuestion, child: Text('Answer2'))
            ],
          )),
    );
  }
}

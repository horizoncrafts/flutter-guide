import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final int resultScore;
  final VoidCallback resetHandler;

  const Result(this.resultScore, this.resetHandler);

  String get getResultPhrase {
    return 'You did it ${resultScore}';
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Text(getResultPhrase, style: TextStyle(fontSize: 64, fontWeight: FontWeight.bold)),
          TextButton(onPressed: resetHandler, child: Text('reset!'))
        ],
      ),
    );
  }
}

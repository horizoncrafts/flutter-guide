import 'package:flutter/material.dart';

class AssText extends StatelessWidget {
  final String _textToShow;

  const AssText(this._textToShow, {super.key});

  @override
  Widget build(BuildContext context) {
    return Text(_textToShow);
  }
}

import 'package:flutter/material.dart';

import './change_text.dart';
import './add_text.dart';

class AssApp extends StatelessWidget {
  const AssApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'AssApp app',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const AssAppHomePage(title: 'Flutter Demo'),
    );
  }
}

class AssAppHomePage extends StatefulWidget {
  final String title;

  const AssAppHomePage({super.key, required this.title});

  @override
  State<AssAppHomePage> createState() => _AssAppHomePageState();
}

class _AssAppHomePageState extends State<AssAppHomePage> {
  var _textToShow = 'A';

  void _changeTextToShow() {
    setState(() {
      _textToShow += 'B';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.title)),
      body: Center(
          child: Column(children: [
        AssText(_textToShow),
        ChangeTextButton(_changeTextToShow),
      ])),
    );
  }
}

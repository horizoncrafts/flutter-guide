import 'package:flutter/material.dart';

import 'models/transaction.dart';
import 'widgets/user_transactions.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  MyHomePage({super.key});

  // String titleInput = '';
  // String valueInput = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Flutter App'),
        ),
        body: SingleChildScrollView(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            // Header
            Container(
                width: double.infinity,
                child: const Card(
                  elevation: 5,
                  color: Colors.blue,
                  child: Text('CHART'),
                )),
            UserTransactions(),
          ],
        )));
  }
}

import 'package:flutter/material.dart';
import 'transaction.dart';

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
  final List<Transaction> transactions = [
    Transaction(id: 't1', title: 'New stufff', amount: 99.99, date: DateTime.now()),
    Transaction(id: 't2', title: "Weekly stufff", amount: 98.99, date: DateTime.now()),
  ];

  MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Flutter App'),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Container(
                width: double.infinity,
                child: const Card(
                  elevation: 5,
                  color: Colors.blue,
                  child: Text('CHART'),
                )),
            Column(
                children: transactions
                    .map((e) => Card(
                          color: Colors.orange,
                          child: Text(e.title),
                        ))
                    .toList())
          ],
        ));
  }
}

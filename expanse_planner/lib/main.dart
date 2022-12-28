import 'package:expanse_planner/widgets/new_transaction.dart';
import 'package:flutter/material.dart';

import 'models/transaction.dart';
import 'widgets/transaction_list.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Personal Demo',
      theme: ThemeData(
          fontFamily: 'QuickSand',
          textTheme: ThemeData.light()
              .textTheme
              .copyWith(headline6: const TextStyle(fontFamily: 'OpenSans', fontSize: 22, fontWeight: FontWeight.bold)),
          appBarTheme: AppBarTheme(
            toolbarTextStyle: ThemeData.light()
                .textTheme
                .copyWith(
                    headline6: const TextStyle(
                  fontFamily: 'OpenSans',
                  fontSize: 22,
                ))
                .bodyText2,
            titleTextStyle: ThemeData.light()
                .textTheme
                .copyWith(
                    headline6: const TextStyle(
                  fontFamily: 'OpenSans',
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                ))
                .headline6,
          ),
          colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.purple, accentColor: Colors.amber)
          // ColorScheme.fromSwatch(primarySwatch: Colors.purple).copyWith(secondary: Colors.amber),
          ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<Transaction> _userTransactions = [
    Transaction(id: 't1', title: 'Newe stufff', amount: 99.99, date: DateTime.now()),
    Transaction(id: 't2', title: "Weekly stufff", amount: 98.99, date: DateTime.now()),
  ];

  void _addNewTransaction(String title, double amount) {
    final newTrans = Transaction(
      id: DateTime.now().toString(),
      title: title,
      amount: amount,
      date: DateTime.now(),
    );

    setState(() {
      _userTransactions.add(newTrans);
    });
  }

  void _startAddNewTransaction(BuildContext context) {
    showModalBottomSheet(
        context: context,
        builder: (builderContext) {
          return NewTransaction(addTransactionCallback: _addNewTransaction);
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: FloatingActionButton(
            onPressed: () {
              _startAddNewTransaction(context);
            },
            child: const Icon(Icons.add)),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        appBar: AppBar(
          title: const Text(
            'Personal Expanses',
          ),
          actions: <Widget>[
            IconButton(
                onPressed: () {
                  _startAddNewTransaction(context);
                },
                icon: const Icon(Icons.add)),
          ],
        ),
        body: SingleChildScrollView(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            // Header
            const SizedBox(
                width: double.infinity,
                child: Card(
                  elevation: 5,
                  // color: Colors.blue,
                  child: Text('CHART'),
                )),
            // Transactions
            TransactionList(
              userTransactions: _userTransactions,
            ),
          ],
        )));
  }
}

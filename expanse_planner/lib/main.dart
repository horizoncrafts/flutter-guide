import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
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

  // String titleInput = '';
  // String valueInput = '';

  final titleController = TextEditingController();
  final amountController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Flutter App'),
        ),
        body: Column(
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

            // Input
            Card(
              elevation: 5,
              child: Container(
                padding: const EdgeInsets.all(10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: <Widget>[
                    TextField(
                      decoration: const InputDecoration(labelText: "Title"),
                      controller: titleController,
                      // onChanged: (String val) {
                      //   titleInput = val;
                      // },
                    ),
                    TextField(
                      decoration: const InputDecoration(labelText: "Amount"),
                      controller: amountController,
                      // onChanged: (val) => valueInput = val,
                    ),
                    TextButton(
                      onPressed: () {
                        print(titleController.text);
                        print(amountController.text);
                      },
                      child: const Text("Add Transaction"),
                    )
                  ],
                ),
              ),
            ),

            // Transactions
            Column(
                children: transactions
                    .map((e) => Card(
                            // color: Colors.orange,
                            child: Row(
                          children: <Widget>[
                            Container(
                                margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                                padding: const EdgeInsets.all(10),
                                decoration: BoxDecoration(border: Border.all(width: 2, color: Colors.blue)),
                                child: Text(
                                  style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 24,
                                    color: Colors.purple,
                                  ),
                                  '\$${e.amount}',
                                )),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(
                                  style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                                  e.title,
                                ),
                                Text(
                                  style: const TextStyle(color: Colors.grey),
                                  DateFormat('yyyy-MM-dd').format(e.date),
                                ),
                              ],
                            )
                          ],
                        )

                            //Text(e.title),
                            ))
                    .toList())
          ],
        ));
  }
}

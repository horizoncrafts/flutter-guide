import 'package:intl/intl.dart';

import 'package:flutter/material.dart';
import '../models/transaction.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> userTransactions;

  const TransactionList({super.key, required this.userTransactions});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 500,
        child: ListView.builder(
          itemBuilder: (context, index) {
            return Card(
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
                      '\$${userTransactions[index].amount.toStringAsFixed(2)}',
                    )),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                      userTransactions[index].title,
                    ),
                    Text(
                      style: const TextStyle(color: Colors.grey),
                      DateFormat('yyyy-MM-dd').format(userTransactions[index].date),
                    ),
                  ],
                )
              ],
            ));
          },
          itemCount: userTransactions.length,
        ));
  }
}

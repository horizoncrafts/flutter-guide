// import 'package:flutter/src/widgets/container.dart';
// import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/widgets.dart';

// import 'package:flutter/material.dart';

import '../models/transaction.dart';
import 'new_transaction.dart';
import 'transaction_list.dart';

class UserTransactions extends StatefulWidget {
  const UserTransactions({super.key});

  @override
  State<UserTransactions> createState() => _UserTransactionsState();
}

class _UserTransactionsState extends State<UserTransactions> {
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

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      NewTransaction(addTransactionCallback: _addNewTransaction),

      // Transactions
      TransactionList(
        userTransactions: _userTransactions,
      ),
    ]);
  }
}

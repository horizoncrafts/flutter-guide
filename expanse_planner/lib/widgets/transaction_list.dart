import 'package:intl/intl.dart';

import 'package:flutter/material.dart';
import '../models/transaction.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> userTransactions;
  final Function deleteTransaction;

  const TransactionList({super.key, required this.userTransactions, required this.deleteTransaction});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 600,
        child: userTransactions.isEmpty
            ? Column(
                children: <Widget>[
                  Text(
                    'Empty',
                    style: Theme.of(context).textTheme.headline6,
                  ),
                  const SizedBox(
                    height: 110,
                  ),
                  SizedBox(height: 300, child: Image.asset('assets/images/waiting.png', fit: BoxFit.cover)),
                ],
              )
            : ListView.builder(
                itemBuilder: (context, index) {
                  return Card(
                    elevation: 5,
                    margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 5),
                    child: ListTile(
                      leading: CircleAvatar(
                        radius: 30,
                        child: FittedBox(
                          child: Text('\$${userTransactions[index].amount.toStringAsFixed(2)}'),
                        ),
                      ),
                      title: Text(
                        userTransactions[index].title,
                        style: Theme.of(context).textTheme.headline6,
                      ),
                      subtitle: Text(DateFormat.yMMMMd().format(userTransactions[index].date)),
                      trailing: IconButton(
                        onPressed: () => deleteTransaction(userTransactions[index].id),
                        icon: const Icon(Icons.delete),
                        color: Theme.of(context).colorScheme.error,
                      ),
                    ),
                  );
                },
                itemCount: userTransactions.length,
              ));
  }
}

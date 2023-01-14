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
        height: 500,
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
                  // return Card(
                  //     // color: Colors.orange,
                  //     child: Row(
                  //   children: <Widget>[
                  //     Container(
                  //         margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                  //         padding: const EdgeInsets.all(10),
                  //         decoration: BoxDecoration(
                  //             border: Border.all(
                  //           width: 2,
                  //           color: Theme.of(context).primaryColorDark,
                  //         )),
                  //         child: Text(
                  //           style: TextStyle(
                  //             fontWeight: FontWeight.bold,
                  //             fontSize: 24,
                  //             color: Theme.of(context).primaryColorDark,
                  //           ),
                  //           '\$${userTransactions[index].amount.toStringAsFixed(2)}',
                  //         )),
                  //     Column(
                  //       crossAxisAlignment: CrossAxisAlignment.start,
                  //       children: <Widget>[
                  //         Text(
                  //           style: Theme.of(context).textTheme.headline6,
                  //           userTransactions[index].title,
                  //         ),
                  //         Text(
                  //           // style: const TextStyle(color: Colors.grey),
                  //           DateFormat('yyyy-MM-dd').format(userTransactions[index].date),
                  //         ),
                  //       ],
                  //     )
                  //   ],
                  // ));
                },
                itemCount: userTransactions.length,
              ));
  }
}

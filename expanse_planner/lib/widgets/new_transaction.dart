import 'package:flutter/material.dart';

class NewTransaction extends StatelessWidget {
  final titleController = TextEditingController();
  final amountController = TextEditingController();

  final Function addTransactionCallback;

  NewTransaction({super.key, required this.addTransactionCallback});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Container(
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            TextField(
              decoration: const InputDecoration(labelText: "Titley"),
              controller: titleController,
            ),
            TextField(
              decoration: const InputDecoration(labelText: "Amount"),
              controller: amountController,
            ),
            TextButton(
              onPressed: () {
                addTransactionCallback(titleController.text, double.parse(amountController.text));
              },
              child: const Text("Add Transaction"),
            )
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

class NewTransaction extends StatefulWidget {
  final Function addTransactionCallback;

  const NewTransaction({super.key, required this.addTransactionCallback});

  @override
  State<NewTransaction> createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final titleController = TextEditingController();

  final amountController = TextEditingController();

  void submitData() {
    final amountValue = double.parse(amountController.text);

    if (amountValue <= 0 || titleController.text.isEmpty) return;

    widget.addTransactionCallback(titleController.text, amountValue);

    Navigator.of(context).pop();
  }

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
              onSubmitted: (_) => submitData(),
            ),
            TextField(
              decoration: const InputDecoration(labelText: "Amount"),
              controller: amountController,
              onSubmitted: (_) => submitData(),
              keyboardType: const TextInputType.numberWithOptions(decimal: true),
            ),
            TextButton(
              onPressed: submitData,
              child: const Text("Add Transaction"),
            )
          ],
        ),
      ),
    );
  }
}

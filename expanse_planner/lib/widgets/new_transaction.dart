import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class NewTransaction extends StatefulWidget {
  final Function addTransactionCallback;

  const NewTransaction({super.key, required this.addTransactionCallback});

  @override
  State<NewTransaction> createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final _titleController = TextEditingController();
  final _amountController = TextEditingController();

  DateTime? _transactionDate;

  void _submitData() {
    if (_amountController.text.isEmpty) return;

    final amountValue = double.parse(_amountController.text);

    if (amountValue <= 0 || _titleController.text.isEmpty || _transactionDate == null) return;

    widget.addTransactionCallback(_titleController.text, amountValue, _transactionDate);

    Navigator.of(context).pop();
  }

  void _showDatePicker() {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2022),
      lastDate: DateTime.now(),
    ).then((value) {
      if (value == null) return;

      setState(() {
        _transactionDate = value;
      });
    });
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
              controller: _titleController,
              onSubmitted: (_) => _submitData(),
            ),
            TextField(
              decoration: const InputDecoration(labelText: "Amount"),
              controller: _amountController,
              onSubmitted: (_) => _submitData(),
              keyboardType: const TextInputType.numberWithOptions(decimal: true),
            ),
            SizedBox(
              height: 70,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(_transactionDate == null ? "no date" : DateFormat.yMd().format(_transactionDate!)),
                  TextButton(
                      onPressed: _showDatePicker,
                      child: Text(
                        "choose date",
                        style: Theme.of(context).textTheme.headline6,
                      ))
                ],
              ),
            ),
            ElevatedButton(
              onPressed: _submitData,
              child: const Text("Add Transaction"),
            )
          ],
        ),
      ),
    );
  }
}

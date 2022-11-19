// bla bla
import 'package:flutter/material.dart';

class ChangeTextButton extends StatelessWidget {
  final VoidCallback changeTextHandler;

  const ChangeTextButton(this.changeTextHandler, {super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(onPressed: changeTextHandler, child: const Text('nadus mnie'));
  }
}

import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class AdaptiveTextButton extends StatelessWidget {
  final String text;
  final VoidCallback buttonHandler;
  const AdaptiveTextButton(
      {required this.text, required this.buttonHandler, Key? key})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Platform.isIOS
        ? CupertinoButton(
            onPressed: buttonHandler,
            child: const Text(
              'Choose Date',
              style: TextStyle(fontWeight: FontWeight.bold),
            ))
        : OutlinedButton(
            style: OutlinedButton.styleFrom(
              side: BorderSide(color: Theme.of(context).primaryColor, width: 1),
            ),
            onPressed: buttonHandler,
            child: const Text(
              'Choose Date',
              style: TextStyle(fontWeight: FontWeight.bold),
            ));
  }
}

import 'package:flutter/material.dart';

class Answer extends StatelessWidget {
  final VoidCallback selectHandler;
  final String myAnswer;
  const Answer(this.selectHandler, this.myAnswer, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: selectHandler,
        child: Text(myAnswer),
      ),
    );
  }
}
